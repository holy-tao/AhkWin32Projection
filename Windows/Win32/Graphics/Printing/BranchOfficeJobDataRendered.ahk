#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class BranchOfficeJobDataRendered extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ICMMethod {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Color {
        get => NumGet(this, 12, "short")
        set => NumPut("short", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    PrintQuality {
        get => NumGet(this, 14, "short")
        set => NumPut("short", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    YResolution {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Copies {
        get => NumGet(this, 18, "short")
        set => NumPut("short", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    TTOption {
        get => NumGet(this, 20, "short")
        set => NumPut("short", value, this, 20)
    }
}
