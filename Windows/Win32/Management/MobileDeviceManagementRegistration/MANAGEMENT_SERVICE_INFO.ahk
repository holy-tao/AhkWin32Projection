#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains the endpoints and information about the management service.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/ns-mdmregistration-management_service_info
 * @namespace Windows.Win32.Management.MobileDeviceManagementRegistration
 * @version v4.0.30319
 */
class MANAGEMENT_SERVICE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The URI of the Mobile Device Management service.
     * @type {PWSTR}
     */
    pszMDMServiceUri{
        get {
            if(!this.HasProp("__pszMDMServiceUri"))
                this.__pszMDMServiceUri := PWSTR(this.ptr + 0)
            return this.__pszMDMServiceUri
        }
    }

    /**
     * The URI of the Authentication service.
     * @type {PWSTR}
     */
    pszAuthenticationUri{
        get {
            if(!this.HasProp("__pszAuthenticationUri"))
                this.__pszAuthenticationUri := PWSTR(this.ptr + 8)
            return this.__pszAuthenticationUri
        }
    }
}
