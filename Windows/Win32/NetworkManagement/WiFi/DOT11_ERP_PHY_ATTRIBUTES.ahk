#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
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
     * @type {BOOLEAN}
     */
    bERPPBCCOptionImplemented{
        get {
            if(!this.HasProp("__bERPPBCCOptionImplemented"))
                this.__bERPPBCCOptionImplemented := BOOLEAN(this.ptr + 8)
            return this.__bERPPBCCOptionImplemented
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bDSSSOFDMOptionImplemented{
        get {
            if(!this.HasProp("__bDSSSOFDMOptionImplemented"))
                this.__bDSSSOFDMOptionImplemented := BOOLEAN(this.ptr + 9)
            return this.__bDSSSOFDMOptionImplemented
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bShortSlotTimeOptionImplemented{
        get {
            if(!this.HasProp("__bShortSlotTimeOptionImplemented"))
                this.__bShortSlotTimeOptionImplemented := BOOLEAN(this.ptr + 10)
            return this.__bShortSlotTimeOptionImplemented
        }
    }
}
