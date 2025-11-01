#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ifdef/ns-ifdef-if_counted_string_lh
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class IF_COUNTED_STRING_LH extends Win32Struct
{
    static sizeof => 516

    static packingSize => 2

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {String}
     */
    String {
        get => StrGet(this.ptr + 2, 256, "UTF-16")
        set => StrPut(value, this.ptr + 2, 256, "UTF-16")
    }
}
