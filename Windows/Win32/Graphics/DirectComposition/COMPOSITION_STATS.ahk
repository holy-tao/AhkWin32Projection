#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class COMPOSITION_STATS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    presentCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    refreshCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    virtualRefreshCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    time {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
