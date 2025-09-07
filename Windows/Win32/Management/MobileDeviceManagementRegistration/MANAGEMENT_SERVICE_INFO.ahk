#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
     * @type {Pointer<Ptr>}
     */
    pszMDMServiceUri {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The URI of the Authentication service.
     * @type {Pointer<Ptr>}
     */
    pszAuthenticationUri {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
