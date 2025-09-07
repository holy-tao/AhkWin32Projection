#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes a string.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_string
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_STRING extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The size of the string in the <b>Buffer</b> member, in bytes. This size does not include the null-terminating character.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The null-terminated string.
     * @type {String}
     */
    Buffer {
        get => StrGet(this.ptr + 4, 0, "UTF-16")
        set => StrPut(value, this.ptr + 4, 0, "UTF-16")
    }
}
