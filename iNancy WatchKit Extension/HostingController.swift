//
//  HostingController.swift
//  iNancy WatchKit Extension
//
//  Created by Massimo Maddaluno on 17/01/2020.
//  Copyright © 2020 Massimo Maddaluno. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<SettingView> {
    override var body: SettingView {
        return SettingView()
    }
}
