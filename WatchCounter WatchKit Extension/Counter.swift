//
//  Counter.swift
//  WatchCounter WatchKit Extension
//
//  Created by Kevin Escobedo on 4/9/21.
//

import Foundation

class Counter
{
    var count:Int = 0
    var step: Int = 1
    var fileName:String = "save.cnt"
    var checkpoint:Int = 5

    init(count:Int, step:Int, fileName:String, checkpoint:Int)
    {
        self.count = count
        self.step = step
        self.fileName = fileName
        self.checkpoint = checkpoint
    }

    func up() -> Void
    {
        self.count += self.step
    }

    func down() -> Void
    {
        self.count -= self.step
        if self.count < 0
        {
            self.setCount(newCount:0)
        }
    }

    func checkSave() -> Bool
    {
        return self.count % self.checkpoint == 0
    }
    
    func validSave() -> Void
    {
        if self.checkSave()
        {
            self.save()
        }
    }

    func getCount() -> Int
    {
        return self.count
    }

    func setCount(newCount:Int) -> Void
    {
        self.count = newCount
    }

    func save() -> Void
    {
        let text = String(self.getCount())
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            let fileURL = dir.appendingPathComponent(self.fileName)
            do
            {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }

            catch
            {

            }
        }
    }

    func read() -> Void
    {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            let fileURL = dir.appendingPathComponent(self.fileName)
            do
            {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                self.setCount(newCount: Int(text)!)
            }

            catch
            {

            }
        }
    }
}
