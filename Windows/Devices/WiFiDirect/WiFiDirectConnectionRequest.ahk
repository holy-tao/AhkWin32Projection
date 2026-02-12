#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectConnectionRequest.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * A Wi-Fi Direct connection request received by a [WiFiDirectConnectionListener](wifidirectconnectionlistener.md).
 * @remarks
 * A WiFiDirectConnectionRequest instance is retrieved by the [GetConnectionRequest](wifidirectconnectionrequestedeventargs_getconnectionrequest_2044958184.md) method on the [WiFiDirectConnectionRequestedEventArgs](wifidirectconnectionrequestedeventargs.md) object when the [ConnectionRequested](wifidirectconnectionlistener_connectionrequested.md) event occurs on a [WiFiDirectConnectionListener](wifidirectconnectionlistener.md).
 * 
 * Retrieve information about the requesting device using [DeviceInformation](wifidirectconnectionrequest_deviceinformation.md).
 * 
 * The [Close](wifidirectconnectionrequest_close_811482585.md) method releases all unmanaged resources associated with the WiFiDirectConnectionRequest object.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectconnectionrequest
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectConnectionRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectConnectionRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectConnectionRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets device information for the endpoint making the Wi-Fi Direct connection request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectconnectionrequest.deviceinformation
     * @type {DeviceInformation} 
     */
    DeviceInformation {
        get => this.get_DeviceInformation()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_DeviceInformation() {
        if (!this.HasProp("__IWiFiDirectConnectionRequest")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectConnectionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectConnectionRequest := IWiFiDirectConnectionRequest(outPtr)
        }

        return this.__IWiFiDirectConnectionRequest.get_DeviceInformation()
    }

    /**
     * Closes the [WiFiDirectConnectionRequest](wifidirectconnectionrequest.md) object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectconnectionrequest.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
