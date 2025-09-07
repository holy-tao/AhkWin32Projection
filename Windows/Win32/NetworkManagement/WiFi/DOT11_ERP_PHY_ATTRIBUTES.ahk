#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_HRDSSS_PHY_ATTRIBUTES.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_ERP_PHY_ATTRIBUTES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {DOT11_HRDSSS_PHY_ATTRIBUTES}
     */
    HRDSSSAttributes{
        get {
            if(!this.HasProp("__HRDSSSAttributes"))
                this.__HRDSSSAttributes := DOT11_HRDSSS_PHY_ATTRIBUTES(this.ptr + 0)
            return this.__HRDSSSAttributes
        }
    }

    /**
     * @type {Integer}
     */
    bERPPBCCOptionImplemented {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    bDSSSOFDMOptionImplemented {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    bShortSlotTimeOptionImplemented {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }
}
