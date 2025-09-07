#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBROWWATCHCHANGE extends Win32Struct
{
    static sizeof => 28

    static packingSize => 2

    /**
     * @type {Pointer}
     */
    hRegion {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    eChangeKind {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    hRow {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Pointer}
     */
    iRow {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }
}
