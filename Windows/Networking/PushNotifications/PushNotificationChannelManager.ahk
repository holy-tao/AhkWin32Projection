#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPushNotificationChannelManagerStatics3.ahk
#Include .\IPushNotificationChannelManagerStatics2.ahk
#Include .\IPushNotificationChannelManagerStatics.ahk
#Include .\IPushNotificationChannelManagerStatics4.ahk
#Include ..\..\..\Guid.ahk

/**
 * Creates objects that you use to retrieve push notification channels from the Windows Push Notification Services (WNS). These channels are bound to an app or [secondary tile](../windows.ui.startscreen/secondarytile.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannelmanager
 * @namespace Windows.Networking.PushNotifications
 * @version WindowsRuntime 1.4
 */
class PushNotificationChannelManager extends IInspectable {
;@region Static Methods
    /**
     * Gets the manager for the active user.
     * @returns {PushNotificationChannelManagerForUser} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannelmanager.getdefault
     */
    static GetDefault() {
        if (!PushNotificationChannelManager.HasProp("__IPushNotificationChannelManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Networking.PushNotifications.PushNotificationChannelManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPushNotificationChannelManagerStatics3.IID)
            PushNotificationChannelManager.__IPushNotificationChannelManagerStatics3 := IPushNotificationChannelManagerStatics3(factoryPtr)
        }

        return PushNotificationChannelManager.__IPushNotificationChannelManagerStatics3.GetDefault()
    }

    /**
     * Gets the push notifications for the specified user.
     * @param {User} user_ The user account for the push notifications.
     * @returns {PushNotificationChannelManagerForUser} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannelmanager.getforuser
     */
    static GetForUser(user_) {
        if (!PushNotificationChannelManager.HasProp("__IPushNotificationChannelManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Networking.PushNotifications.PushNotificationChannelManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPushNotificationChannelManagerStatics2.IID)
            PushNotificationChannelManager.__IPushNotificationChannelManagerStatics2 := IPushNotificationChannelManagerStatics2(factoryPtr)
        }

        return PushNotificationChannelManager.__IPushNotificationChannelManagerStatics2.GetForUser(user_)
    }

    /**
     * Creates an object, bound to a specified app, through which you retrieve a push notification channel from Windows Push Notification Services (WNS). The specified app must be in the same package as the calling app. This overload should only be called from a multi-app package, most apps should use the method with no parameter.
     * @remarks
     * Tile update, toast, and badge notifications that arrive on this channel are delivered to the app's main or default tile.
     * 
     * An exception is thrown if you attempt to register a WNS push notification channel when there is no data connection.
     * @returns {IAsyncOperation<PushNotificationChannel>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannelmanager.createpushnotificationchannelforapplicationasync
     */
    static CreatePushNotificationChannelForApplicationAsync() {
        if (!PushNotificationChannelManager.HasProp("__IPushNotificationChannelManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.PushNotifications.PushNotificationChannelManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPushNotificationChannelManagerStatics.IID)
            PushNotificationChannelManager.__IPushNotificationChannelManagerStatics := IPushNotificationChannelManagerStatics(factoryPtr)
        }

        return PushNotificationChannelManager.__IPushNotificationChannelManagerStatics.CreatePushNotificationChannelForApplicationAsync()
    }

    /**
     * Creates an object, bound to the calling app, through which you retrieve a push notification channel from Windows Push Notification Services (WNS).
     * @remarks
     * Tile update, toast, and badge notifications that arrive on this channel are delivered to the app's main or default tile.
     * 
     * An exception is thrown if you attempt to register a WNS push notification channel when there is no data connection.
     * @param {HSTRING} applicationId 
     * @returns {IAsyncOperation<PushNotificationChannel>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannelmanager.createpushnotificationchannelforapplicationasync
     */
    static CreatePushNotificationChannelForApplicationAsyncWithId(applicationId) {
        if (!PushNotificationChannelManager.HasProp("__IPushNotificationChannelManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.PushNotifications.PushNotificationChannelManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPushNotificationChannelManagerStatics.IID)
            PushNotificationChannelManager.__IPushNotificationChannelManagerStatics := IPushNotificationChannelManagerStatics(factoryPtr)
        }

        return PushNotificationChannelManager.__IPushNotificationChannelManagerStatics.CreatePushNotificationChannelForApplicationAsyncWithId(applicationId)
    }

    /**
     * Creates an object, bound to a [secondary tile](../windows.ui.startscreen/secondarytile.md), through which you retrieve a push notification channel from Windows Push Notification Services (WNS). The tile can be a secondary tile of the calling app or any other app in the same package.
     * @remarks
     * > [!NOTE]
     * > Channels bound to secondary tiles only accept push notifications for **Tile** and **Badge** update types.
     * @param {HSTRING} tileId The ID of the secondary tile to bind to the push notification channel.
     * @returns {IAsyncOperation<PushNotificationChannel>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannelmanager.createpushnotificationchannelforsecondarytileasync
     */
    static CreatePushNotificationChannelForSecondaryTileAsync(tileId) {
        if (!PushNotificationChannelManager.HasProp("__IPushNotificationChannelManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.PushNotifications.PushNotificationChannelManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPushNotificationChannelManagerStatics.IID)
            PushNotificationChannelManager.__IPushNotificationChannelManagerStatics := IPushNotificationChannelManagerStatics(factoryPtr)
        }

        return PushNotificationChannelManager.__IPushNotificationChannelManagerStatics.CreatePushNotificationChannelForSecondaryTileAsync(tileId)
    }

    /**
     * 
     * @param {EventHandler<PushNotificationChannelsRevokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_ChannelsRevoked(handler) {
        if (!PushNotificationChannelManager.HasProp("__IPushNotificationChannelManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Networking.PushNotifications.PushNotificationChannelManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPushNotificationChannelManagerStatics4.IID)
            PushNotificationChannelManager.__IPushNotificationChannelManagerStatics4 := IPushNotificationChannelManagerStatics4(factoryPtr)
        }

        return PushNotificationChannelManager.__IPushNotificationChannelManagerStatics4.add_ChannelsRevoked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_ChannelsRevoked(token) {
        if (!PushNotificationChannelManager.HasProp("__IPushNotificationChannelManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Networking.PushNotifications.PushNotificationChannelManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPushNotificationChannelManagerStatics4.IID)
            PushNotificationChannelManager.__IPushNotificationChannelManagerStatics4 := IPushNotificationChannelManagerStatics4(factoryPtr)
        }

        return PushNotificationChannelManager.__IPushNotificationChannelManagerStatics4.remove_ChannelsRevoked(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
