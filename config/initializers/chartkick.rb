Chartkick.options = {
  donut: true, # ドーナツグラフ
  width: '500px',
  colors: [ "#769fcd",
            "greenyellow",
            "orange",
            "turquoise",
            "pink",
            "crimson",
            "rgba(0, 102, 255, 0.822)",
            "rgba(255, 0, 0, 0.616)",
            "burlywood",
          ],
  message: {empty: "データがありません"},
  thousands: ",", 
  suffix: "円",
  legend: false, # 凡例非表示
  library: { # ここからHighchartsのオプション
    title: { # タイトル表示(ここでは、グラフの真ん中に配置して,viewでデータを渡しています。*後述)
      align: 'center',
      verticalAlign: 'middle',
    },
    chart: {
      backgroundColor: 'none',
      plotBorderWidth: 0, 
      plotShadow: false
    },
    plotOptions: {
      pie: {
        dataLabels: {
          enabled: true, 
          distance: -40, # ラベルの位置調節
          allowOverlap: false, # ラベルが重なったとき、非表示にする
          style: { #ラベルフォントの設定
            color: '#555', 
            textAlign: 'center', 
            textOutline: 0, #デフォルトではラベルが白枠で囲まれていてダサいので消す
          }
        },
        size: '100%',
        innerSize: '60%', # ドーナツグラフの中の円の大きさ
        borderWidth: 0,
      }
    },
  }
}