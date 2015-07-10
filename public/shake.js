(function() {
  addEventListener('devicemotion', function(e) {
    shakeIt(e);
  });

  function shakeIt(e) {
    var x = e.accelerationIncludingGravity.x; // X方向の加速度
    var y = e.accelerationIncludingGravity.y; // Y方向の加速度
    var z = e.accelerationIncludingGravity.z; // Z方向の加速度

    // 加速度が一定以上のとき
    if (Math.abs(x) > 15 || Math.abs(y) > 15 || Math.abs(z) > 15) {
      // ここに振っているときの動作を入れる
      $.get("/shake")
    }
  }
})();