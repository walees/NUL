const functions = require('firebase-functions');
const admin = require('firebase-admin');
const nodemailer = require('nodemailer');
const cors = require('cors')({origin: true});
admin.initializeApp();
let transporter = nodemailer.createTransport({
 
service: 'gmail',
auth: {
user: 'digitalphoenix00@gmail.com',
pass: 'Digital@50'  //you your password
}
});
exports.sendMail = functions.https.onRequest((req, res) => {
cors(req, res, () => {
// getting dest email by query string
const dest = req.query.dest;
const p_add = req.query.p_add;
const d_add = req.query.d_add;
const f_add = req.query.f_add;
const p1_add = req.query.p1_add;

const mailOptions = {
from: 'Nul Xpress App<digitalphoenix00@gmail.com>', // 
to: dest,
subject: 'New Order Received', // email subject
html: '<h1 style="color:#D23110;">Your Have Received a New Pickup Request</h1><br><br><ul  style="list-style-type:none; white-space: nowrap;margin: 30px;padding-left: 30px;width: 500px;height: 200px;border: 10px solid grey;"><li height: 144px;width: 144px;float: left;><h3><strong style="align: 50px; " >Order Details</strong></h3></li><li height: 144px;width: 144px;float: left;><b>Pickup Address:</b>'+f_add+'</li><li height: 144px;width: 144px;float: left;><b>Pickup PhoneNumber:</b>'+d_add+
'</li><li height: 144px;width: 144px;float: left;><b>Dropoff Address:</b>'+p_add+'</li><li height: 144px;width: 144px;float: left;><b>Dropoff PhoneNumber:</b>'+p1_add+'</li></ul>'  
};
// returning result
return transporter.sendMail(mailOptions, (erro, info) => {
if(erro){ 
return res.send(erro.toString());
}
return res.send('Sended');
});
});
});
exports.sendEmail = functions.https.onRequest((req, res) => {
    cors(req, res, () => {
    // getting dest email by query string
    const dest = req.query.dest;
    const p_add = req.query.p_add;
    const d_add = req.query.d_add;
    const f_add = req.query.f_add;
    const p1_add = req.query.p1_add;
    
    const mailOptions = {
    from: 'Nul Xpress App<digitalphoenix00@gmail.com>', // 
    to: dest,
    subject: 'New Order Received', // email subject
    html: '<h1 style="color:#D23110;">Your Have Received a New Pickup Request</h1><br><br><ul  style="list-style-type:none; white-space: nowrap;margin: 30px;padding-left: 30px;width: 500px;height: 200px;border: 10px solid grey;"><li height: 144px;width: 144px;float: left;><h3><strong style="align: 50px; " >Order Details</strong></h3></li><li height: 144px;width: 144px;float: left;><h3><strong style="align: 50px; " >Payment Via Card</strong></h3></li><li height: 144px;width: 144px;float: left;><b>Pickup Address:</b>'+f_add+'</li><li height: 144px;width: 144px;float: left;><b>Pickup PhoneNumber:</b>'+d_add+
    '</li><li height: 144px;width: 144px;float: left;><b>Dropoff Address:</b>'+p_add+'</li><li height: 144px;width: 144px;float: left;><b>Dropoff PhoneNumber:</b>'+p1_add+'</li></ul>'  
    };
    // returning result
    return transporter.sendMail(mailOptions, (erro, info) => {
    if(erro){ 
    return res.send(erro.toString());
    }
    return res.send('Sent');
    });
    });
    });