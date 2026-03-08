#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Specifies a Unicode or ANSI character and its attributes. This structure is used by console functions to read from and write to a console screen buffer.
 * @see https://learn.microsoft.com/windows/console/char-info-str
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class CHAR extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
