#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectConnectionRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for a [ConnectionRequested](wifidirectconnectionlistener_connectionrequested.md) event on a [WiFiDirectConnectionListener](wifidirectconnectionlistener.md).
 * @remarks
 * Your code doesn't instantiate this class. Instead, a WiFiDirectConnectionRequestedEventArgs instance is created when the when the [ConnectionRequested](wifidirectconnectionlistener_connectionrequested.md) event occurs on a [WiFiDirectConnectionListener](wifidirectconnectionlistener.md).
 * 
 * Not all [WiFiDirectDevice](wifidirectdevice.md) properties are exposed on [ConnectionRequested](wifidirectconnectionlistener_connectionrequested.md) event by a [WiFiDirectConnectionListener](wifidirectconnectionlistener.md). Properties that are exposed include the following:
 * + Device Friendly Name
 * + Device Category
 * + Model ID
 * + Information elements
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectconnectionrequestedeventargs
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectConnectionRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectConnectionRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectConnectionRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves the [WiFiDirectConnectionRequest](wifidirectconnectionrequest.md) received on a [ConnectionRequested](wifidirectconnectionlistener_connectionrequested.md) event by a [WiFiDirectConnectionListener](wifidirectconnectionlistener.md).
     * @returns {WiFiDirectConnectionRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectconnectionrequestedeventargs.getconnectionrequest
     */
    GetConnectionRequest() {
        if (!this.HasProp("__IWiFiDirectConnectionRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectConnectionRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectConnectionRequestedEventArgs := IWiFiDirectConnectionRequestedEventArgs(outPtr)
        }

        return this.__IWiFiDirectConnectionRequestedEventArgs.GetConnectionRequest()
    }

;@endregion Instance Methods
}
