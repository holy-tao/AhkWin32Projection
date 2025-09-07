#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The LSA_UNICODE_STRING structure is used by various Local Security Authority (LSA) functions to specify a Unicode string.
 * @see https://learn.microsoft.com/windows/win32/api/lsalookup/ns-lsalookup-lsa_unicode_string
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_UNICODE_STRING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the length, in bytes, of the string pointed to by the <b>Buffer</b> member, not including the terminating null character, if any.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Specifies the total size, in bytes, of the memory allocated for <b>Buffer</b>. Up to <b>MaximumLength</b> bytes can be written into the buffer without trampling memory.
     * @type {Integer}
     */
    MaximumLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Pointer to a wide character string. Note that the strings returned by the various LSA functions might not be null-terminated.
     * @type {Pointer<Ptr>}
     */
    Buffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
