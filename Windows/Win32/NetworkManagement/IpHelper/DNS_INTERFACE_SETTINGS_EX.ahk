#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DNS_INTERFACE_SETTINGS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class DNS_INTERFACE_SETTINGS_EX extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {DNS_INTERFACE_SETTINGS}
     */
    SettingsV1{
        get {
            if(!this.HasProp("__SettingsV1"))
                this.__SettingsV1 := DNS_INTERFACE_SETTINGS(this.ptr + 0)
            return this.__SettingsV1
        }
    }

    /**
     * @type {Integer}
     */
    DisableUnconstrainedQueries {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    SupplementalSearchList {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
