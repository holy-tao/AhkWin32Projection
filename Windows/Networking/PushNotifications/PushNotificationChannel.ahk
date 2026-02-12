#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPushNotificationChannel.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PushNotificationChannel.ahk
#Include .\PushNotificationReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a delivery vehicle and addressing mechanism for push notifications.
  * 
  * The channel Uniform Resource Identifier (URI)represented by this interface is used by a third-party application server to communicate with the Windows Push Notification Services (WNS). The push notification channel is used by the client to intercept notifications.
 * @remarks
 * This object is returned through an instance of the [IAsyncOperation](../windows.foundation/iasyncoperation_1.md) interface which is returned through the [CreatePushNotificationChannelForApplicationAsync](pushnotificationchannelmanager_createpushnotificationchannelforapplicationasync_1900738870.md) method. When the asynchronous operation completes successfully, it returns the PushNotificationChannel object through a **then** or **done** method.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannel
 * @namespace Windows.Networking.PushNotifications
 * @version WindowsRuntime 1.4
 */
class PushNotificationChannel extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPushNotificationChannel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPushNotificationChannel.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uniform Resource Identifier (URI) to which an app server sends a push notification intended for an application or secondary tile bound to this channel. This Uniform Resource Identifier (URI) is transmitted to and stored by the third-party app server.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannel.uri
     * @type {HSTRING} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets the time at which the channel expires. Notifications sent to this channel after this time are rejected.
     * @remarks
     * To prevent a channel from expiring, apps should request a new push notification channel every time that the app is run.
     * 
     * An expired channel behaves as though it was closed. Because channels cannot be renewed, after a channel expires, a secondary tile or application must request a new push notification channel.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannel.expirationtime
     * @type {DateTime} 
     */
    ExpirationTime {
        get => this.get_ExpirationTime()
    }

    /**
     * Raised when a push notification arrives on this channel.
     * @remarks
     * Windows Push Notification Services (WNS) sends this event only when the notification's target app is in the foreground. If the app is suspended, it does not receive the event.
     * @type {TypedEventHandler<PushNotificationChannel, PushNotificationReceivedEventArgs>}
    */
    OnPushNotificationReceived {
        get {
            if(!this.HasProp("__OnPushNotificationReceived")){
                this.__OnPushNotificationReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{55fa217d-1fc3-5863-b980-7094d4379694}"),
                    PushNotificationChannel,
                    PushNotificationReceivedEventArgs
                )
                this.__OnPushNotificationReceivedToken := this.add_PushNotificationReceived(this.__OnPushNotificationReceived.iface)
            }
            return this.__OnPushNotificationReceived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPushNotificationReceivedToken")) {
            this.remove_PushNotificationReceived(this.__OnPushNotificationReceivedToken)
            this.__OnPushNotificationReceived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Uri() {
        if (!this.HasProp("__IPushNotificationChannel")) {
            if ((queryResult := this.QueryInterface(IPushNotificationChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationChannel := IPushNotificationChannel(outPtr)
        }

        return this.__IPushNotificationChannel.get_Uri()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ExpirationTime() {
        if (!this.HasProp("__IPushNotificationChannel")) {
            if ((queryResult := this.QueryInterface(IPushNotificationChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationChannel := IPushNotificationChannel(outPtr)
        }

        return this.__IPushNotificationChannel.get_ExpirationTime()
    }

    /**
     * Explicitly invalidates this channel. Any notifications pushed to this channel after this method is called are not delivered.
     * @remarks
     * After it has been closed, the channel can never be used again. Channels that are closed through this method are no different than channels that have expired. To resume sending push notifications to this app, the app must request a new channel.
     * 
     * Calling Close on a channel invalidates the underlying URI as well as any non-expired, non-closed URIs previously created for the app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannel.close
     */
    Close() {
        if (!this.HasProp("__IPushNotificationChannel")) {
            if ((queryResult := this.QueryInterface(IPushNotificationChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationChannel := IPushNotificationChannel(outPtr)
        }

        return this.__IPushNotificationChannel.Close()
    }

    /**
     * 
     * @param {TypedEventHandler<PushNotificationChannel, PushNotificationReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PushNotificationReceived(handler) {
        if (!this.HasProp("__IPushNotificationChannel")) {
            if ((queryResult := this.QueryInterface(IPushNotificationChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationChannel := IPushNotificationChannel(outPtr)
        }

        return this.__IPushNotificationChannel.add_PushNotificationReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PushNotificationReceived(token) {
        if (!this.HasProp("__IPushNotificationChannel")) {
            if ((queryResult := this.QueryInterface(IPushNotificationChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationChannel := IPushNotificationChannel(outPtr)
        }

        return this.__IPushNotificationChannel.remove_PushNotificationReceived(token)
    }

;@endregion Instance Methods
}
