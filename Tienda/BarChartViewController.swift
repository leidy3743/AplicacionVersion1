//
//  BarChartViewController.swift
//  AplicacionDeportes
//
//  Created by leidy carvajal on 1/07/16.
//  Copyright © 2016 leidy carvajal. All rights reserved.
//

import UIKit
import Charts
import CoreGraphics


class BarChartViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var barChartView: BarChartView!
    var arrDataArticulos: NSMutableArray!
    @IBOutlet weak var tableArticulos: UITableView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barChartView.delegate = self
        
        disciplina = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        let cantidad = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        setChart(disciplina, values: cantidad)
        
        self.getAllArticles()
    }
    
    
    var disciplina: [String]!
    
    
    
    //Funciones propias
    func getAllArticles()
    {
        arrDataArticulos = NSMutableArray()
        arrDataArticulos = ModeloBD.getInstance().getAllArticles()
        barChartView.reloadInputViews()
        
        
        let arrString = arrDataArticulos.objectEnumerator().allObjects as? [String]
        print(arrString)
      
    }
    
    
    /*
    //Metodos para la Tabla
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDataArticulos.count
    }
    
    //func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let myCell: ArticulosCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! ArticulosCell*/
        
        //let articulo: ArticulosData = arrDataArticulos. as! ArticulosData
        //print(articulo.cantidad)
        //disciplina = articulo.disciplina
        //let cantidad = articulo.cantidad
       /* //myCell.labelExistencias.text = "Existencias: \(articulo.exitArticulo)"
        
        return myCell
    }*/
    
    
    //funcion para crear el grafico
    func setChart(dataPoints: [String], values: [Double]) {
        
        barChartView.noDataText = "You need to provide data for the chart."
        
        //El inicializador BarChartDataEntry toma el valor de cada entrada de datos, el índice de la entrada del valor corresponde y una etiqueta opcional.
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let chartData = BarChartData(xVals: disciplina, dataSet: chartDataSet)
        
        //color del grafico, un solo color.
        
        //chartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
        chartDataSet.colors = ChartColorTemplates.joyful()
        
        //cambiar la posicion de las etiquteas del eje x
        //barChartView.xAxis.labelPosition = .Bottom
        
        //cambiar el color del fondo de la tabla
        barChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        
        //ANIMACION: para los dos ejes
        //barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        
        //agregar una linea limite al grafico
        //let ll = ChartLimitLine(limit: 10.0, label: "Target")
        //barChartView.rightAxis.addLimitLine(ll)
        
        barChartView.data = chartData
        
       }
}