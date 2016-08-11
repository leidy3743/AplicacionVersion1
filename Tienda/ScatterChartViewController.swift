//
//  ScatterChartViewController.swift
//  Tienda
//
//  Created by leidy carvajal on 3/08/16.
//  Copyright © 2016 Juan Carlos Salazar Mesa. All rights reserved.
//

import UIKit
import Charts
import CoreGraphics

class ScatterChartViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var scatterChartView: ScatterChartView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scatterChartView.delegate = self
        
        disciplina = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        let cantidad1 = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        let cantidad2 = [10.0, 5.0, 5.0, 13.0, 2.0, 6.0, 41.0, 8.0, 22.0, 14.0, 15.0, 5.0]
        let cantidad3 = [30.0, 6.0, 4.0, 30.0, 1.0, 1.0, 14.0, 8.0, 12.0, 4.0, 15.0, 7.0]
        
        //setChart(disciplina, values1: cantidad1, values2: cantidad2, values3: cantidad3)
        setChart(disciplina, values1: cantidad1, values2: cantidad2, values3: cantidad3)
    }
    
    
    var disciplina: [String]!
    
    
    
    
    //funcion para crear el grafico
    func setChart(dataPoints: [String], values1: [Double], values2: [Double], values3: [Double]) {
        
        scatterChartView.noDataText = "You need to provide data for the chart."
        
        
        /*El inicializador BarChartDataEntry toma el valor de cada entrada de datos, el índice de la entrada del valor corresponde  y una etiqueta opcional*/
        
        var dataEntries1: [BubbleChartDataEntry] = []
        var dataEntries2: [BubbleChartDataEntry] = []
        var dataEntries3: [BubbleChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BubbleChartDataEntry(xIndex: i, value: values1[i], size: CGFloat(values1[i]*100))
            dataEntries1.append(dataEntry)
        }
        
        for i in 0..<dataPoints.count {
            let dataEntry = BubbleChartDataEntry(xIndex: i, value: values2[i], size: CGFloat(values2[i]*100))
            dataEntries2.append(dataEntry)
        }
        for i in 0..<dataPoints.count {
            let dataEntry = BubbleChartDataEntry(xIndex: i, value: values3[i], size: CGFloat(values3[i]*100))
            //print(dataEntry)
            dataEntries3.append(dataEntry)
        }
        
        let chartData1 = ScatterChartDataSet(yVals: dataEntries1, label: "Datos1")
        chartData1.scatterShape = ScatterChartDataSet.Shape.Triangle
        
        let chartData2 = ScatterChartDataSet(yVals: dataEntries2, label: "Datos2")
        chartData2.scatterShape = ScatterChartDataSet.Shape.Square
        
        let chartData3 = ScatterChartDataSet(yVals: dataEntries3, label: "Datos3")
        chartData3.scatterShape = ScatterChartDataSet.Shape.Circle
        
        let chartDataSet: [ScatterChartDataSet] = [chartData1, chartData2, chartData3]
        let chartData = ScatterChartData(xVals: disciplina, dataSets: chartDataSet)
        
        
        
        chartData1.colors = [UIColor(red: 153/255, green: 153/255, blue: 255/255, alpha: 1)]
        chartData2.colors = [UIColor(red: 153/255, green: 0/255, blue: 153/255, alpha: 1)]
        chartData3.colors = [UIColor(red: 255/255, green: 20/255, blue: 147/255, alpha: 1)]
        
        //ANIMACION: para los dos ejes
        scatterChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        
        scatterChartView.data = chartData
        
    }
}
