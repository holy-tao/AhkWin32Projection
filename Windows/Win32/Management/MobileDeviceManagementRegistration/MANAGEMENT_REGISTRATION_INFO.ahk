#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Management.MobileDeviceManagementRegistration
 * @version v4.0.30319
 */
class MANAGEMENT_REGISTRATION_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    fDeviceRegisteredWithManagement {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwDeviceRegistionKind {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PWSTR}
     */
    pszUPN{
        get {
            if(!this.HasProp("__pszUPN"))
                this.__pszUPN := PWSTR(this.ptr + 8)
            return this.__pszUPN
        }
    }

    /**
     * @type {PWSTR}
     */
    pszMDMServiceUri{
        get {
            if(!this.HasProp("__pszMDMServiceUri"))
                this.__pszMDMServiceUri := PWSTR(this.ptr + 16)
            return this.__pszMDMServiceUri
        }
    }
}
