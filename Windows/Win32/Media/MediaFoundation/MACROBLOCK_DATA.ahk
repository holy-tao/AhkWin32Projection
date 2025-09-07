#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MACROBLOCK_DATA extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    motionVectorX {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    motionVectorY {
        get => NumGet(this, 6, "short")
        set => NumPut("short", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    QPDelta {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
