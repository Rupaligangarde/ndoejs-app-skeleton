import express from 'express';
import {app_port} from './config';
import cors from 'cors';
import bodyParser from 'body-parser';

const app = express();
app.use(cors())
app.use(bodyParser.json());

app.get('/health', (_, res) => {
    res.send({
        status: 200,
        message: 'healthy'
    });
});

app.listen(app_port, () => {
    console.log("stock-service started successfully");
});

exports.mappings = app;