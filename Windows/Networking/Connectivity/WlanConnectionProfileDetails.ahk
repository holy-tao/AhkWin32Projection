#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWlanConnectionProfileDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to access information specific to a WLAN connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.wlanconnectionprofiledetails
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class WlanConnectionProfileDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWlanConnectionProfileDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWlanConnectionProfileDetails.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves the Service Set Identifier (SSID) for a WLAN connection.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.wlanconnectionprofiledetails.getconnectedssid
     */
    GetConnectedSsid() {
        if (!this.HasProp("__IWlanConnectionProfileDetails")) {
            if ((queryResult := this.QueryInterface(IWlanConnectionProfileDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWlanConnectionProfileDetails := IWlanConnectionProfileDetails(outPtr)
        }

        return this.__IWlanConnectionProfileDetails.GetConnectedSsid()
    }

;@endregion Instance Methods
}
