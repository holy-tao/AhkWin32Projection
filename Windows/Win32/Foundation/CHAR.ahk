#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Returns the ANSI character for a number.
 * @remarks
 * The resulting string is one character in length. The *number* parameter must be an integer between 1 and 255 (inclusive), or the function returns an error.
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/char-function
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
