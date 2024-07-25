const http = require('http');
const server = http.createServer((req, res) => {
 res.writeHead(200, { 'Content-Type': 'text/plain' });
 res.end('Estou funcionando tcho!\n');
});
const port = 80;
server.listen(port, () => {
 console.log(`Server running at http://localhost:${port}`);
});