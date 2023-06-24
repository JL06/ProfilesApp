//
//  BatteryInfo.swift
//  Perfiles
//
//  Created by Juan Luis Hernández López on 23/06/23.
//

import UIKit
import BackgroundTasks

class BatteryInfo {
    private let backgroundTaskIdentifier = "com.juanhernandez.Perfiles.batteryinfo"
    
    func registerBackgroundTask() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: backgroundTaskIdentifier, using: nil) { task in
            if let task = task as? BGProcessingTask {
                self.handleBackgroundTask(task: task)
            }
            task.setTaskCompleted(success: true)
            self.scheduleBackgroundTask()
        }
    }
    
    func scheduleBackgroundTask() {
        BGTaskScheduler.shared.cancelAllTaskRequests()
        
        let request = BGProcessingTaskRequest(identifier: self.backgroundTaskIdentifier)
        request.requiresNetworkConnectivity = false
        request.requiresExternalPower = false
        request.earliestBeginDate = Date(timeIntervalSinceNow: 60)
        
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Failed to schedule background task: \(error)")
        }
    }
    
    func handleBackgroundTask(task: BGProcessingTask) {
        self.getBatteryInfo()
        task.setTaskCompleted(success: true)
    }
    
    func getBatteryInfo() {
        let device = UIDevice.current
        let databaseConexion = DataBaseProfile()
        
        device.isBatteryMonitoringEnabled = true
        let batteryLevel = device.batteryLevel
        
        databaseConexion.addNewBatteryValue(date: Date().toStringISO(), value: batteryLevel)
    }
}

