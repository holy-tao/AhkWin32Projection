#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectServiceProvisioningInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains provisioning information about a Wi-Fi Direct Service.
 * @remarks
 * Your code does not instantiate this class directly. You can retrieve an instance using either the [WiFiDirectServiceSessionRequest.ProvisioningInfo](wifidirectservicesessionrequest_provisioninginfo.md) property or the [WiFiDirectService.GetProvisioningInfoAsync](wifidirectservice_getprovisioninginfoasync_628266286.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceprovisioninginfo
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceProvisioningInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectServiceProvisioningInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectServiceProvisioningInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value describing the configuration method in use.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceprovisioninginfo.selectedconfigurationmethod
     * @type {Integer} 
     */
    SelectedConfigurationMethod {
        get => this.get_SelectedConfigurationMethod()
    }

    /**
     * Gets a value indicating whether Wi-Fi Direct Point to Point (P2P) group formation is needed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceprovisioninginfo.isgroupformationneeded
     * @type {Boolean} 
     */
    IsGroupFormationNeeded {
        get => this.get_IsGroupFormationNeeded()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedConfigurationMethod() {
        if (!this.HasProp("__IWiFiDirectServiceProvisioningInfo")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceProvisioningInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceProvisioningInfo := IWiFiDirectServiceProvisioningInfo(outPtr)
        }

        return this.__IWiFiDirectServiceProvisioningInfo.get_SelectedConfigurationMethod()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGroupFormationNeeded() {
        if (!this.HasProp("__IWiFiDirectServiceProvisioningInfo")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectServiceProvisioningInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectServiceProvisioningInfo := IWiFiDirectServiceProvisioningInfo(outPtr)
        }

        return this.__IWiFiDirectServiceProvisioningInfo.get_IsGroupFormationNeeded()
    }

;@endregion Instance Methods
}
