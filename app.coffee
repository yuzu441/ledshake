j5 = require('johnny-five')
express = require('express')
app = express()

arduino = new j5.Board();

LedModule = require('./LedModule')

arduino.on('ready', () =>
  @led = new LedModule(13, 12, 8)

  ledOffTimerHandle = () =>
    @led.offLight()

  setInterval(ledOffTimerHandle, 2000)
)

app.use(express.static('public'))

app.get('/', (req, res) =>
  res.sendFile("#{__dirname}/public/index.html")
)

shakeCnt = 0;
app.get('/shake', (req, res) =>
  if shakeCnt++ >= 50
    @led.onLight()
    shakeCnt = 0

  res.send 'success'
)

app.listen(3000)