#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_CAMERA_CONTROL_RANGE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    minValue {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    maxValue {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    stepValue {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    defaultValue {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
