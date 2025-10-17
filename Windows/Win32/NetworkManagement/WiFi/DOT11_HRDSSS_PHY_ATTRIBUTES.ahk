#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
    bShortPreambleOptionImplemented {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    bPBCCOptionImplemented {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {BOOLEAN}
     */
    bChannelAgilityPresent {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    uHRCCAModeSupported {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
