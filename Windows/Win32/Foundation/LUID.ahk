#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * The LUID structure is an opaque structure that specifies an identifier that is guaranteed to be unique on the local machine. For more information, see the reference page for LUID in the Microsoft Windows SDK documentation.
 * @see https://learn.microsoft.com/windows/win32/api/ntdef/ns-ntdef-luid
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class LUID extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    LowPart {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    HighPart {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
