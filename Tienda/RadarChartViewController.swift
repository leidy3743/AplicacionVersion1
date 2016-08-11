//
//  RadarChartViewController.swift
//  Tienda
//
//  Created by leidy carvajal on 29/07/16.
//  Copyright © 2016 Juan Carlos Salazar Mesa. All rights reserved.
//

import UIKit
import Charts
import CoreGraphics


class RadarChartViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var radarChartView: RadarChartView!
    var arrDataArticulos: NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        radarChartView.delegate = self
        
        disciplina = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        let cantidad = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        setChart(disciplina, values: cantidad)
        
    }
    
    
    var disciplina: [String]!
    
    
    
    
    //funcion para crear el grafico
    func setChart(dataPoints: [String], values: [Double]) {
        
        radarChartView.noDataText = "You need to provide data for the chart."
        
        //El inicializador BarChartDataEntry toma el valor de cada entrada de datos, el índice de la entrada del valor corresponde y una etiqueta opcional.
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = RadarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let chartData = RadarChartData(xVals: disciplina, dataSet: chartDataSet)
        
        //color del grafico, un solo color.
        
        //chartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
        chartDataSet.colors = ChartColorTemplates.colorful()
    
        
        //cambiar la posicion de las etiquteas del eje x
        //radarChartView.xAxis.labelPosition = .Bottom
        
        //cambiar el color del fondo de la tabla
        radarChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        
        //ANIMACION: para los dos ejes
        radarChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        radarChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        
        //agregar una linea limite al grafico
        //let ll = ChartLimitLine(limit: 10.0, label: "Target")
        //barChartView.rightAxis.addLimitLine(ll)
        
        radarChartView.data = chartData
        
    }
}