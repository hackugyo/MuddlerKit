//
//  UIApplicationExtensions.swift
//  MuddlerKit
//
//  Created by Kosuke Matsuda on 2015/12/28.
//  Copyright © 2015年 Kosuke Matsuda. All rights reserved.
//

import UIKit

extension UIApplication {
    public func activateUserNotificationSettings() {
        let types: UIUserNotificationType = [.badge, .alert, .sound]
        let settings = UIUserNotificationSettings(types: types, categories: nil)
        self.registerUserNotificationSettings(settings)
    }

    public func isEnableRemoteNotifications() -> Bool {
        guard self.isRegisteredForRemoteNotifications else { return false }
        guard let settings = self.currentUserNotificationSettings else { return false }
        return settings.types != UIUserNotificationType()
    }

    public func applicationIconBadgeNumberSafely(_ badgeNumber: Int) {
        guard let settings = currentUserNotificationSettings else { return }
        if settings.types.contains(.badge) {
            applicationIconBadgeNumber = badgeNumber
        }
    }
}
