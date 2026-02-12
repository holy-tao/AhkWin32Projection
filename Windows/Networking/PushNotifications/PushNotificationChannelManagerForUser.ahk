#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPushNotificationChannelManagerForUser.ahk
#Include .\IPushNotificationChannelManagerForUser2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Creates objects that you use to retrieve push notification channels from the Windows Push Notification Services (WNS). These channels are bound to the current user through an app or [secondary tile](../windows.ui.startscreen/secondarytile.md).
 * @remarks
 * This class does not have a constructor. For more information about usage, see the examples section.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannelmanagerforuser
 * @namespace Windows.Networking.PushNotifications
 * @version WindowsRuntime 1.4
 */
class PushNotificationChannelManagerForUser extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPushNotificationChannelManagerForUser

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPushNotificationChannelManagerForUser.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the user.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannelmanagerforuser.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Creates an object, bound to a specified app, through which you retrieve a push notification channel from Windows Push Notification Services (WNS). The specified app must be in the same package as the calling app.
     * @returns {IAsyncOperation<PushNotificationChannel>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannelmanagerforuser.createpushnotificationchannelforapplicationasync
     */
    CreatePushNotificationChannelForApplicationAsync() {
        if (!this.HasProp("__IPushNotificationChannelManagerForUser")) {
            if ((queryResult := this.QueryInterface(IPushNotificationChannelManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationChannelManagerForUser := IPushNotificationChannelManagerForUser(outPtr)
        }

        return this.__IPushNotificationChannelManagerForUser.CreatePushNotificationChannelForApplicationAsync()
    }

    /**
     * Creates an object, bound to the calling app, through which you retrieve a push notification channel from Windows Push Notification Services (WNS).
     * @param {HSTRING} applicationId 
     * @returns {IAsyncOperation<PushNotificationChannel>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannelmanagerforuser.createpushnotificationchannelforapplicationasync
     */
    CreatePushNotificationChannelForApplicationAsyncWithId(applicationId) {
        if (!this.HasProp("__IPushNotificationChannelManagerForUser")) {
            if ((queryResult := this.QueryInterface(IPushNotificationChannelManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationChannelManagerForUser := IPushNotificationChannelManagerForUser(outPtr)
        }

        return this.__IPushNotificationChannelManagerForUser.CreatePushNotificationChannelForApplicationAsyncWithId(applicationId)
    }

    /**
     * Creates an object, bound to a [secondary tile](../windows.ui.startscreen/secondarytile.md), through which you retrieve a push notification channel from Windows Push Notification Services (WNS). The tile can be a secondary tile of the calling app or any other app in the same package.
     * @remarks
     * > [!NOTE]
     * > Channels bound to secondary tiles only accept push notifications for **Tile** and **Badge** update types.
     * @param {HSTRING} tileId The ID of the secondary tile to bind to the push notification channel.
     * @returns {IAsyncOperation<PushNotificationChannel>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannelmanagerforuser.createpushnotificationchannelforsecondarytileasync
     */
    CreatePushNotificationChannelForSecondaryTileAsync(tileId) {
        if (!this.HasProp("__IPushNotificationChannelManagerForUser")) {
            if ((queryResult := this.QueryInterface(IPushNotificationChannelManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationChannelManagerForUser := IPushNotificationChannelManagerForUser(outPtr)
        }

        return this.__IPushNotificationChannelManagerForUser.CreatePushNotificationChannelForSecondaryTileAsync(tileId)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IPushNotificationChannelManagerForUser")) {
            if ((queryResult := this.QueryInterface(IPushNotificationChannelManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationChannelManagerForUser := IPushNotificationChannelManagerForUser(outPtr)
        }

        return this.__IPushNotificationChannelManagerForUser.get_User()
    }

    /**
     * Creates an object bound to a specified app through which you retrieve a push notification channel from Windows Push Notification Services (WNS). The specified app must be in the same package as the calling app.
     * @remarks
     * All raw notifications sent over this channel will have the channelID attached before being delivered to the app. This allows for apps to create multiple channels and differentiate where the notifications come from.
     * 
     * > [!NOTE] 
     * > Most applications (including all third party apps) should use the [CreateRawPushNotificationChannelWithAlternateKeyForApplicationAsync](pushnotificationchannelmanagerforuser_createrawpushnotificationchannelwithalternatekeyforapplicationasync_769979127.md) without the appID parameter.
     * @param {IBuffer} appServerKey An uncompressed key in ANSI X9.62 format. This value is from the P-256 curve defined in the [Secure Hash Standard specification](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf).
     * @param {HSTRING} channelId The ID of the push notification channel.
     * @returns {IAsyncOperation<PushNotificationChannel>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannelmanagerforuser.createrawpushnotificationchannelwithalternatekeyforapplicationasync
     */
    CreateRawPushNotificationChannelWithAlternateKeyForApplicationAsync(appServerKey, channelId) {
        if (!this.HasProp("__IPushNotificationChannelManagerForUser2")) {
            if ((queryResult := this.QueryInterface(IPushNotificationChannelManagerForUser2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationChannelManagerForUser2 := IPushNotificationChannelManagerForUser2(outPtr)
        }

        return this.__IPushNotificationChannelManagerForUser2.CreateRawPushNotificationChannelWithAlternateKeyForApplicationAsync(appServerKey, channelId)
    }

    /**
     * Creates an object bound to a specified app through which you retrieve a push notification channel from Windows Push Notification Services (WNS). The specified app must be in the same package as the calling app.
     * @remarks
     * Note that all raw notifications sent over this channel will have the channelID attached before being delivered to the app. This allows for apps to create multiple channels and differentiate where the notifications come from.
     * @param {IBuffer} appServerKey An uncompressed key in ANSI X9.62 format. This value is from the P-256 curve defined in the [Secure Hash Standard specification](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf).
     * @param {HSTRING} channelId The ID of the push notification channel.
     * @param {HSTRING} appId 
     * @returns {IAsyncOperation<PushNotificationChannel>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannelmanagerforuser.createrawpushnotificationchannelwithalternatekeyforapplicationasync
     */
    CreateRawPushNotificationChannelWithAlternateKeyForApplicationAsyncWithId(appServerKey, channelId, appId) {
        if (!this.HasProp("__IPushNotificationChannelManagerForUser2")) {
            if ((queryResult := this.QueryInterface(IPushNotificationChannelManagerForUser2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationChannelManagerForUser2 := IPushNotificationChannelManagerForUser2(outPtr)
        }

        return this.__IPushNotificationChannelManagerForUser2.CreateRawPushNotificationChannelWithAlternateKeyForApplicationAsyncWithId(appServerKey, channelId, appId)
    }

;@endregion Instance Methods
}
