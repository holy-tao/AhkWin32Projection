#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Used as the string interface for kernel operations and is a clone of the UNICODE_STRING structure.
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-security_string
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECURITY_STRING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the length, in bytes, of the string pointed to by the <b>Buffer</b> member, not including the terminating <b>NULL</b> character, if any.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Specifies the total size, in bytes, of memory allocated for <b>Buffer</b>. Up to <b>MaximumLength</b> bytes may be written into the buffer without trampling memory.
     * @type {Integer}
     */
    MaximumLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Pointer to a wide-character string. Note that the strings returned by the various LSA functions might not be <b>null</b>-terminated.
     * @type {Pointer<Integer>}
     */
    Buffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
