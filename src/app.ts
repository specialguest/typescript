import express from 'express';

const app = express();
const port = 3000;

app.get('/', (req, res) => {
    res.send('Youpi');
});

app.listen(port, () => {
    console.info(`Ready on port ${port}`);
});
