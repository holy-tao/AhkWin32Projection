#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IF_COUNTED_STRING structure specifies a counted string for NDIS interfaces.
 * @remarks
 * The <b>IF_COUNTED_STRING</b> structure is the data type for various NDIS string structures, such as <b>NDIS_IF_COUNTED_STRING</b>.
 * 
 * If the string is NULL-terminated, the <b>Length</b> member must not include the terminating NULL character.
 * @see https://learn.microsoft.com/windows/win32/api/ifdef/ns-ifdef-if_counted_string_lh
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class IF_COUNTED_STRING_LH extends Win32Struct
{
    static sizeof => 516

    static packingSize => 2

    /**
     * A USHORT value that contains the length, in bytes, of the string.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A WCHAR buffer that contains the string. The string does not need to be null-terminated.
     * @type {String}
     */
    String {
        get => StrGet(this.ptr + 2, 256, "UTF-16")
        set => StrPut(value, this.ptr + 2, 256, "UTF-16")
    }
}
