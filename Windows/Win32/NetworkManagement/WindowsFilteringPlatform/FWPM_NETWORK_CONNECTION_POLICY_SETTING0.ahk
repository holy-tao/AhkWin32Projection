#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_ARRAY6.ahk
#Include .\FWP_BYTE_BLOB.ahk
#Include .\FWP_TOKEN_INFORMATION.ahk
#Include .\FWP_NETWORK_CONNECTION_POLICY_SETTING_TYPE.ahk
#Include .\FWP_BYTE_ARRAY16.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\FWP_VALUE0.ahk
#Include .\FWP_DATA_TYPE.ahk
#Include ..\..\Security\SID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_NETWORK_CONNECTION_POLICY_SETTING0 extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {FWP_NETWORK_CONNECTION_POLICY_SETTING_TYPE}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {FWP_VALUE0}
     */
    value {
        get {
            if(!this.HasProp("__value"))
                this.__value := FWP_VALUE0(8, this)
            return this.__value
        }
    }
}
