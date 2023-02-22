const cron = require('node-cron');
const { phoneNumberFormatter } = require('./formatter');

module.exports = function (db, sessionMap, fs, startDEVICE) {

    const setRandomInterval = (intervalFunction, minDelay, maxDelay) => {
        let timeout;

        const runInterval = () => {
            const timeoutFunction = () => {
                intervalFunction();
                runInterval();
            };
            const delay = Math.floor(Math.random() * (maxDelay - minDelay + 1)) + minDelay;
        
            timeout = setTimeout(timeoutFunction, delay);
        };
        runInterval();

        return {
            clear() { clearTimeout(timeout) },
        };
    };

    const interval = setRandomInterval(() => {
        const date = new Date().toLocaleString()
        console.log("Cek data di database pada : "+ date);
        let sqlde = `SELECT device.*, account.id as id_account, account.username, account.expired,account.status FROM device INNER JOIN account ON device.pemilik = account.id`;
        db.query(sqlde, function (err, results) {
            results.forEach(async de => {
                var sekarang = new Date().getTime();
                const myDate = new Date(de.expired)
                const itstime = myDate.getTime()
                if (de.status != 'expired') {
                    if (de.expired != null) {
                        if (sekarang >= itstime) {
                            db.query("UPDATE `account` SET `status` = 'expired' WHERE `account`.`id` = " + de.id_account, function (err, result) {
                                if (err) throw err;
                                console.log(result.affectedRows + " expired user " + de.username);
                                if (sessionMap.has(parseInt(de.nomor))) {
                                    const chi = sessionMap.get(parseInt(de.nomor))
                                    chi.chika.logout();
                                    sessionMap.delete(parseInt(de.nomor))
                                }
                                if (fs.existsSync(`./app_node/session/device-${parseInt(de.nomor)}.json`)) {
                                    fs.unlinkSync(`./app_node/session/device-${parseInt(de.nomor)}.json`);
                                }
                            });
                        }
                    }
                }
                if (sessionMap.has(parseInt(de.nomor))) {
                    let sql = `SELECT * FROM pesan WHERE status='MENUNGGU JADWAL' OR status='GAGAL' AND sender = ${de.nomor} ORDER BY RAND() LIMIT 1`;
                    const wabestie = sessionMap.get(parseInt(de.nomor)).chika
                    db.query(sql, function (err, result) {
                        if(result != null){
                            result.forEach(async d => {
                                const yourDate = new Date(d.jadwal)
                                const waktu = yourDate.getTime()
                                if (sekarang >= waktu) {
                                    if (d.nomor.length > 15) {
                                        var number = phoneNumberFormatter(d.nomor);
                                    } else {
                                        var number = phoneNumberFormatter(d.nomor);
                                    }
                                    console.log(`Mengirim pesam ke Nomor ${number}`)
                                    switch (d.type) {
                                        case "Text":
                                            await wabestie.sendMessage(number, { text: d.pesan }).then(response => {
                                                db.query(`UPDATE pesan SET status = 'TERKIRIM' where id = ${d.id}`)
                                                const date = new Date().toLocaleString()
                                                console.log("Pesan Text untuk "+ number +" berhasil terkirim pada : "+ date );
                                            }).catch(err => {
                                                db.query(`UPDATE pesan SET status = 'GAGAL' where id = ${d.id}`)
                                                const date = new Date().toLocaleString()
                                                console.log("Pesan Text untuk "+ number +" gagal terkirim pada : "+ date );
                                            });
                                            break
                                        case "Text & Media":
                                            let filename = d.media.split('/')[d.media.split('/').length - 1];
                                            let filetype = filename.split('.')[1]
                                            if (filetype == 'jpg' || filetype == 'png' || filetype == 'jpeg') {
                                                await wabestie.sendMessage(number, { image: { url: `${d.media}` }, caption: `${d.pesan}` }).then(response => {
                                                    db.query(`UPDATE pesan SET status = 'TERKIRIM' where id = ${d.id}`)
                                                    const date = new Date().toLocaleString()
                                                    console.log("Pesan Media untuk "+ number +" berhasil terkirim pada : "+ date );
                                                }).catch(err => {
                                                    db.query(`UPDATE pesan SET status = 'GAGAL' where id = ${d.id}`)
                                                    const date = new Date().toLocaleString()
                                                    console.log("Pesan Media untuk "+ number +" gagal terkirim pada : "+ date );
                                                });
                                            } else if (filetype == 'pdf') {
                                                await wabestie.sendMessage(number, { document: { url: `${d.media}` }, mimetype: 'application/pdf', fileName: `${d.pesan}` }).then(response => {
                                                    db.query(`UPDATE pesan SET status = 'TERKIRIM' where id = ${d.id}`)
                                                    const date = new Date().toLocaleString()
                                                    console.log("Pesan PDF untuk "+ number +" berhasil terkirim pada : "+ date );
                                                }).catch(err => {
                                                    db.query(`UPDATE pesan SET status = 'GAGAL' where id = ${d.id}`)
                                                    const date = new Date().toLocaleString()
                                                    console.log("Pesan PDF untuk "+ number +" gagal terkirim pada : "+ date );
                                                });
                                            } else {
                                                res.status(500).json({
                                                    status: false,
                                                    response: 'Filetype tidak dikenal'
                                                });
                                            }
                                            break
                                        case "Quick Reply Button":
                                            const buttons = [
                                                { buttonId: d.btn1, buttonText: { displayText: d.btn1 }, type: 1 },
                                                { buttonId: d.btn2, buttonText: { displayText: d.btn2 }, type: 1 },
                                                { buttonId: d.btn3, buttonText: { displayText: d.btn3 }, type: 1 }
                                            ]
                                            const buttonMessage = {
                                                text: d.pesan,
                                                footer: d.footer,
                                                buttons: buttons,
                                                headerType: 1
                                            }
                                            await wabestie.sendMessage(number, buttonMessage).then(response => {
                                                db.query(`UPDATE pesan SET status = 'TERKIRIM' where id = ${d.id}`)
                                                const date = new Date().toLocaleString()
                                                console.log("Pesan Button untuk "+ number +" berhasil terkirim pada : "+ date );
                                                
                                            }).catch(err => {
                                                db.query(`UPDATE pesan SET status = 'GAGAL' where id = ${d.id}`)
                                                const date = new Date().toLocaleString()
                                                console.log("Pesan Button untuk "+ number +" gagal terkirim pada : "+ date );
                                            });
                                            break
                                        case "Url & Call Button":
                                            const templateButtons = [
                                                { index: 1, urlButton: { displayText: d.btn1, url: d.btnid1 } },
                                                { index: 2, callButton: { displayText: d.btn2, phoneNumber: d.btnid2 } }
                                            ]
                                            const templateMessage = {
                                                text: d.pesan,
                                                footer: d.footer,
                                                templateButtons: templateButtons
                                            }
                                            await wabestie.sendMessage(number, templateMessage).then(response => {
                                                db.query(`UPDATE pesan SET status = 'TERKIRIM' where id = ${d.id}`)
                                                const date = new Date().toLocaleString()
                                                console.log("Pesan Url untuk "+ number +" berhasil terkirim pada : "+ date );
                                            }).catch(err => {
                                                db.query(`UPDATE pesan SET status = 'GAGAL' where id = ${d.id}`)
                                                const date = new Date().toLocaleString()
                                                console.log("Pesan Url untuk "+ number +" gagal terkirim pada : "+ date );
                                            });
                                            break
                                    }
                                }
                            })
                        } else {
                            interval.clear();
                        }
                    });
                    let sql2 = `SELECT * FROM blast WHERE sender = ${de.nomor} AND status != 'terkirim' ORDER BY RAND() LIMIT 1`;
                    db.query(sql2, function (err, resultss) {
                        if (resultss != null){
                            resultss.forEach(async dw => {
                                if (dw.tujuan.length > 15) {
                                    var number = phoneNumberFormatter(dw.tujuan);
                                } else {
                                    var number = phoneNumberFormatter(dw.tujuan);
                                }
                                console.log(`Mengirim Ke Nomor ${number}`)
                                switch (dw.type) {
                                    case "Text":
                                        await wabestie.sendMessage(number, { text: dw.pesan }).then(response => {
                                            db.query(`UPDATE blast SET status = 'terkirim' where id = ${dw.id}`)
                                            const date = new Date().toLocaleString()
                                            console.log("Pesan Text untuk "+ number +" berhasil terkirim pada : "+ date );
                                        }).catch(err => {
                                            db.query(`UPDATE blast SET status = 'gagal' where id = ${dw.id}`)
                                            const date = new Date().toLocaleString()
                                            console.log("Pesan PDF untuk "+ number +" gagal terkirim pada : "+ date );
                                        });
                                        break
                                    case "Text & Media":
                                        let filename = dw.media.split('/')[dw.media.split('/').length - 1];
                                        let filetype = filename.split('.')[1]
                                        if (filetype == 'jpg' || filetype == 'png' || filetype == 'jpeg') {
                                            await wabestie.sendMessage(number, { image: { url: `${dw.media}` }, caption: `${dw.pesan}` }).then(response => {
                                                db.query(`UPDATE blast SET status = 'terkirim' where id = ${dw.id}`)
                                                const date = new Date().toLocaleString()
                                                console.log("Pesan Media untuk "+ number +" berhasil terkirim pada : "+ date );
                                            }).catch(err => {
                                                db.query(`UPDATE blast SET status = 'gagal' where id = ${dw.id}`)
                                                const date = new Date().toLocaleString()
                                                console.log("Pesan Media untuk "+ number +" berhasil terkirim pada : "+ date );
                                            });
                                        } else if (filetype == 'pdf') {
                                            await wabestie.sendMessage(number, { document: { url: `${dw.media}` }, mimetype: 'application/pdf', fileName: `${dw.pesan}` }).then(response => {
                                                db.query(`UPDATE blast SET status = 'terkirim' where id = ${dw.id}`)
                                                const date = new Date().toLocaleString()
                                                console.log("Pesan PDF untuk "+ number +" berhasil terkirim pada : "+ date );
                                            }).catch(err => {
                                                db.query(`UPDATE blast SET status = 'gagal' where id = ${dw.id}`)
                                                const date = new Date().toLocaleString()
                                                console.log("Pesan PDF untuk "+ number +" gagal terkirim pada : "+ date );
                                            });
                                        }
                                        break
                                    case "Quick Reply Button":
                                        const buttons = [
                                            { buttonId: dw.btn1, buttonText: { displayText: dw.btn1 }, type: 1 },
                                            { buttonId: dw.btn2, buttonText: { displayText: dw.btn2 }, type: 1 },
                                            { buttonId: dw.btn3, buttonText: { displayText: dw.btn3 }, type: 1 }
                                        ]
                                        const buttonMessage = {
                                            text: dw.pesan,
                                            footer: dw.footer,
                                            buttons: buttons,
                                            headerType: 1
                                        }
                                        await wabestie.sendMessage(number, buttonMessage).then(response => {
                                            db.query(`UPDATE blast SET status = 'terkirim' where id = ${dw.id}`)
                                            const date = new Date().toLocaleString()
                                            console.log("Pesan Button untuk "+ number +" berhasil terkirim pada : "+ date );
                                        }).catch(err => {
                                            db.query(`UPDATE blast SET status = 'gagal' where id = ${dw.id}`)
                                            const date = new Date().toLocaleString()
                                            console.log("Pesan Button untuk "+ number +" gagal terkirim pada : "+ date );
                                        });
                                        break
                                    case "Url & Call Button":
                                        const templateButtons = [
                                            { index: 1, urlButton: { displayText: dw.btn1, url: dw.btnid1 } },
                                            { index: 2, callButton: { displayText: dw.btn2, phoneNumber: dw.btnid2 } }
                                        ]
                                        const templateMessage = {
                                            text: dw.pesan,
                                            footer: dw.footer,
                                            templateButtons: templateButtons
                                        }
                                        await wabestie.sendMessage(number, templateMessage).then(response => {
                                            db.query(`UPDATE blast SET status = 'terkirim' where id = ${dw.id}`)
                                            const date = new Date().toLocaleString()
                                            console.log("Pesan URL untuk "+ number +" berhasil terkirim pada : "+ date );
                                        }).catch(err => {
                                            db.query(`UPDATE blast SET status = 'gagal' where id = ${dw.id}`)
                                            const date = new Date().toLocaleString()
                                            console.log("Pesan URL untuk "+ number +" gagal terkirim pada : "+ date );
                                        });
                                        break
                                }
                            })
                        } else {
                            interval.clear();
                        }
                    });
                }
            })
        })
    }, 40000, 50000);

    cron.schedule('*/10 * * * * *', function () {
        console.log('cronjob reconnect device')
        let sqlde = `SELECT *  FROM device`;
        db.query(sqlde, function (err, results) {
            results.forEach(async de => {
                if (fs.existsSync(`./app_node/session/device-${parseInt(de.nomor)}.json`)) {
                    if (!sessionMap.has(parseInt(de.nomor))) {
                        console.log(parseInt(de.nomor))
                        startDEVICE(parseInt(de.nomor))
                    }
                }
            })
        })
    });
};