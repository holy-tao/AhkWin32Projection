#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectConnectionListener.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\WiFiDirectConnectionListener.ahk
#Include .\WiFiDirectConnectionRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Class used to listen for incoming Wi-Fi Direct connection requests.
 * @remarks
 * If multiple apps are listening for [ConnectionRequested](wifidirectconnectionlistener_connectionrequested.md) event notifications, the notifications will be sent to the apps sequentially in last in first out order of when the apps registered the event handler.
 * 
 * This class is similar to the [StreamSocketListener](../windows.networking.sockets/streamsocketlistener.md) class in the [Windows.Networking.Sockets](../windows.networking.sockets/windows_networking_sockets.md) namespace. When it sees an incoming request of the appropriate kind, it raises a [ConnectionRequested](wifidirectconnectionlistener_connectionrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectconnectionlistener
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectConnectionListener extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectConnectionListener

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectConnectionListener.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates a new [WiFiDirectConnectionListener](wifidirectconnectionlistener.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.WiFiDirectConnectionListener")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnConnectionRequestedToken")) {
            this.remove_ConnectionRequested(this.__OnConnectionRequestedToken)
            this.__OnConnectionRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectConnectionListener, WiFiDirectConnectionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConnectionRequested(handler) {
        if (!this.HasProp("__IWiFiDirectConnectionListener")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectConnectionListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectConnectionListener := IWiFiDirectConnectionListener(outPtr)
        }

        return this.__IWiFiDirectConnectionListener.add_ConnectionRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ConnectionRequested(token) {
        if (!this.HasProp("__IWiFiDirectConnectionListener")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectConnectionListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectConnectionListener := IWiFiDirectConnectionListener(outPtr)
        }

        return this.__IWiFiDirectConnectionListener.remove_ConnectionRequested(token)
    }

;@endregion Instance Methods
}
