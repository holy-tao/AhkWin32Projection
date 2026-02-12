#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectServiceSessionRequest.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes a Wi-Fi Direct Service session request.
 * @remarks
 * Your code does not instantiate this class directly. An instance of this class is inside the [WiFiDirectServiceSessionRequestedEventArgs](wifidirectservicesessionrequestedeventargs.md) object passed to your [WiFiDirectServiceAdvertiser.SessionRequested](wifidirectserviceadvertiser_sessionrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesessionrequest
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceSessionRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectServiceSessionRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectServiceSessionRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets device information for the requesting device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesessionrequest.deviceinformation
     * @type {DeviceInformation} 
     */
    DeviceInformation {
        get => this.get_DeviceInformation()
    }

    /**
     * Gets information about how provisioning should be performed if the session is established.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesessionrequest.provisioninginfo
     * @type {WiFiDirectServiceProvisioningInfo} 
     */
    ProvisioningInfo {
        get => this.get_ProvisioningInfo()
    }

    /**
     * Gets the session information blob associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesessionrequest.sessioninfo
     * @type {IBuffer} 
     */
    SessionInfo {
        get => this.get_SessionInfo()
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
        if (!this.HasProp("__IWiFiDirectServiceSessionRequest")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSessionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSessionRequest := IWiFiDirectServiceSessionRequest(outPtr)
        }

        return this.__IWiFiDirectServiceSessionRequest.get_DeviceInformation()
    }

    /**
     * 
     * @returns {WiFiDirectServiceProvisioningInfo} 
     */
    get_ProvisioningInfo() {
        if (!this.HasProp("__IWiFiDirectServiceSessionRequest")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSessionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSessionRequest := IWiFiDirectServiceSessionRequest(outPtr)
        }

        return this.__IWiFiDirectServiceSessionRequest.get_ProvisioningInfo()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SessionInfo() {
        if (!this.HasProp("__IWiFiDirectServiceSessionRequest")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceSessionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceSessionRequest := IWiFiDirectServiceSessionRequest(outPtr)
        }

        return this.__IWiFiDirectServiceSessionRequest.get_SessionInfo()
    }

    /**
     * Closes the session request. Your server code calls this method to reject a session request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesessionrequest.close
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
