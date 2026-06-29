#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used as the string interface for kernel operations and is a clone of the UNICODE_STRING structure.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-security_string
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECURITY_STRING {
    #StructPack 8

    /**
     * Specifies the length, in bytes, of the string pointed to by the **Buffer** member, not including the terminating **NULL** character, if any.
     */
    Length : UInt16

    /**
     * Specifies the total size, in bytes, of memory allocated for **Buffer**. Up to **MaximumLength** bytes may be written into the buffer without trampling memory.
     */
    MaximumLength : UInt16

    /**
     * Pointer to a wide-character string. Note that the strings returned by the various LSA functions might not be **NULL**-terminated.
     */
    Buffer : IntPtr

}
