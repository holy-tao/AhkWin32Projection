#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRawNotification.ahk
#Include .\IRawNotification2.ahk
#Include .\IRawNotification3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Encapsulates the app-defined content of a raw notification (a push notification that does not involve UI). Its contents can be used in an app's background task, if the app has that capability, or otherwise consumed by the app and acted on as needed.
 * @remarks
 * A RawNotification object is obtained through the [TriggerDetails](../windows.applicationmodel.background/ibackgroundtaskinstance_triggerdetails.md) property.
 * 
 * A background task that is intended to run in response to a notification must be registered with a [PushNotificationTrigger](../windows.applicationmodel.background/pushnotificationtrigger.md). If it is not registered, the task will not run when a raw notification is received. For more info, see [Raw notification overview](/windows/uwp/controls-and-patterns/tiles-and-notifications-raw-notification-overview).
 * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.rawnotification
 * @namespace Windows.Networking.PushNotifications
 * @version WindowsRuntime 1.4
 */
class RawNotification extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRawNotification

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRawNotification.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the content of the raw notification as a string. This string specifies a background task associated with the app.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.rawnotification.content
     * @type {HSTRING} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * Gets the raw header content from the notification.
     * @remarks
     * Header format:
     * ```syntax
     * Content-Encoding: aesgcm
     * Crypto-Key: dh=<PUBLICKEY>
     * Encryption: salt=<SALT>
     * ```
     * 
     * For more information and to learn how headers are defined, see [Message Encryption for Web Push](https://tools.ietf.org/html/draft-ietf-webpush-encryption-03), section 3.2. 
     * 
     * The header content is for notifications sent using a channel created with [CreateRawPushNotificationChannelWithAlternateKeyForApplicationAsync](pushnotificationchannelmanagerforuser_createrawpushnotificationchannelwithalternatekeyforapplicationasync_769979127.md) and pushed to WNS using the Webpush protocol with VAPID authentication. For any other type of push notification, the header value is null.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.rawnotification.headers
     * @type {IMapView<HSTRING, HSTRING>} 
     */
    Headers {
        get => this.get_Headers()
    }

    /**
     * Gets the Channel ID of the raw notification.
     * @remarks
     * This is only valid for notifications sent over a channel created by [CreateRawPushNotificationChannelWithAlternateKeyForApplicationAsync](pushnotificationchannelmanagerforuser_createrawpushnotificationchannelwithalternatekeyforapplicationasync_769979127.md). If notification are sent over a channel created with [CreatePushNotificationChannelForApplicationAsync](pushnotificationchannelmanagerforuser_createpushnotificationchannelforapplicationasync_1900738870.md), this will be null.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.rawnotification.channelid
     * @type {HSTRING} 
     */
    ChannelId {
        get => this.get_ChannelId()
    }

    /**
     * Gets the content of the raw notification as an [IBuffer](/uwp/api/windows.storage.streams.ibuffer).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.rawnotification.contentbytes
     * @type {IBuffer} 
     */
    ContentBytes {
        get => this.get_ContentBytes()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Content() {
        if (!this.HasProp("__IRawNotification")) {
            if ((queryResult := this.QueryInterface(IRawNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawNotification := IRawNotification(outPtr)
        }

        return this.__IRawNotification.get_Content()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, HSTRING>} 
     */
    get_Headers() {
        if (!this.HasProp("__IRawNotification2")) {
            if ((queryResult := this.QueryInterface(IRawNotification2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawNotification2 := IRawNotification2(outPtr)
        }

        return this.__IRawNotification2.get_Headers()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ChannelId() {
        if (!this.HasProp("__IRawNotification2")) {
            if ((queryResult := this.QueryInterface(IRawNotification2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawNotification2 := IRawNotification2(outPtr)
        }

        return this.__IRawNotification2.get_ChannelId()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ContentBytes() {
        if (!this.HasProp("__IRawNotification3")) {
            if ((queryResult := this.QueryInterface(IRawNotification3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawNotification3 := IRawNotification3(outPtr)
        }

        return this.__IRawNotification3.get_ContentBytes()
    }

;@endregion Instance Methods
}
