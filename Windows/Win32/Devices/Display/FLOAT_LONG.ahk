#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FLOAT_LONG extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Float}
     */
    e {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    l {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
