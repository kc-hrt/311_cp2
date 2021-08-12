require('dotenv').config()
const express = require("express");
const bodyParser = require("body-parser");

const app = express();
const port = process.env.PORT || 4001;

app.use(bodyParser.json());
app.use(express.static('public'));

app.use(require('./routers/crops'));
app.use(require('./routers/locations'));
app.use(require('./routers/plants'));
app.use(require('./routers/pots'));
app.use(require('./routers/users'));
// 
app.get('/', (req, res) => {
  res.send('Welcome to our server!')
})

app.listen(port, () => {
 console.log(`Web server is listening on port ${port}!`);
});
