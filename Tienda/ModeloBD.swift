//
//  ModeloBD.swift
//  AplicacionDeportes
//
//  Created by leidy carvajal on 1/07/16.
//  Copyright © 2016 leidy carvajal. All rights reserved.
//

import UIKit

let sharedInstance = ModeloBD()

class ModeloBD: NSObject {

    var database: FMDatabase? = nil
    
    
    class func getInstance() -> ModeloBD
    {
        if(sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path: Utilities.getPath("converted.sqlite"))
        }
        
        return sharedInstance
    }
    
    
    func getAllArticles() -> NSMutableArray {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT descripcion AS disciplina, SUM(tipodisciplinadeportiva_id) AS cantidad FROM visualizacion_deportista_disciplinas JOIN visualizacion_tipodisciplinadeportiva ON visualizacion_deportista_disciplinas.tipodisciplinadeportiva_id = visualizacion_tipodisciplinadeportiva.id GROUP BY tipodisciplinadeportiva_id", withArgumentsInArray: nil)
        let arrDataArticulos : NSMutableArray = NSMutableArray()
        
        if (resultSet != nil) {
            while resultSet.next() {
                let articulosInfo : ArticulosData = ArticulosData()
                articulosInfo.disciplina = resultSet.stringForColumn("disciplina")
                articulosInfo.cantidad = resultSet.longForColumn("cantidad")
                arrDataArticulos.addObject(articulosInfo)
            }
        }
        
        sharedInstance.database!.close()
        return arrDataArticulos
    }
    
}
