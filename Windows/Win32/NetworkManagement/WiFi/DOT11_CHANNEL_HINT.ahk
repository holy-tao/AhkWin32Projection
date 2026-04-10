#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_PHY_TYPE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_CHANNEL_HINT extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {DOT11_PHY_TYPE}
     */
    Dot11PhyType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uChannelNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
