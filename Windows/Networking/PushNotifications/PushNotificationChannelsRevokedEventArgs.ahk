#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPushNotificationChannelsRevokedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the event arguments for the [PushNotificationChannelManager.ChannelsRevoked](pushnotificationchannelmanager_channelsrevoked.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannelsrevokedeventargs
 * @namespace Windows.Networking.PushNotifications
 * @version WindowsRuntime 1.4
 */
class PushNotificationChannelsRevokedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPushNotificationChannelsRevokedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPushNotificationChannelsRevokedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
