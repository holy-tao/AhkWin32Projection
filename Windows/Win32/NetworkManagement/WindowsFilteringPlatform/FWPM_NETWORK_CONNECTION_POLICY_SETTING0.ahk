#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\FWP_VALUE0.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NETWORK_CONNECTION_POLICY_SETTING0 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {FWP_VALUE0}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := FWP_VALUE0(this.ptr + 8)
            return this.__value
        }
    }
}
