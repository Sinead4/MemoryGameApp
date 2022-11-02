//
//  ArrayExt.swift
//  Memory
//
//  Created by Sinead on 13.10.22.
//

import Foundation

extension Array where Element: Identifiable {
    
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count{
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }

}

extension Array {
    
    var only: Element?{
        count == 1 ? self.first: nil
    }
}

/*extension Equatable{
 
     static func == (lhs: Star, rhs: Star) -> Bool {
     return lhs.corners == rhs.corners && lhs.smoothness == rhs.smoothness
     }
 }//Greatness anschauen
 
*/
