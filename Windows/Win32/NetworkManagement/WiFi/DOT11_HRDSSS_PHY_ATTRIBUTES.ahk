#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_HRDSSS_PHY_ATTRIBUTES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOLEAN}
     */
    bShortPreambleOptionImplemented{
        get {
            if(!this.HasProp("__bShortPreambleOptionImplemented"))
                this.__bShortPreambleOptionImplemented := BOOLEAN(this.ptr + 0)
            return this.__bShortPreambleOptionImplemented
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bPBCCOptionImplemented{
        get {
            if(!this.HasProp("__bPBCCOptionImplemented"))
                this.__bPBCCOptionImplemented := BOOLEAN(this.ptr + 1)
            return this.__bPBCCOptionImplemented
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bChannelAgilityPresent{
        get {
            if(!this.HasProp("__bChannelAgilityPresent"))
                this.__bChannelAgilityPresent := BOOLEAN(this.ptr + 2)
            return this.__bChannelAgilityPresent
        }
    }

    /**
     * @type {Integer}
     */
    uHRCCAModeSupported {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
