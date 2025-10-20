#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/console/coord-str
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class COORD extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }
}
