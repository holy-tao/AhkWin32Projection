#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The LSA_UNICODE_STRING structure is used by various Local Security Authority (LSA) functions to specify a Unicode string.
 * @see https://learn.microsoft.com/windows/win32/api/lsalookup/ns-lsalookup-lsa_unicode_string
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_UNICODE_STRING {
    #StructPack 8

    /**
     * Specifies the length, in bytes, of the string pointed to by the <b>Buffer</b> member, not including the terminating null character, if any.
     */
    Length : UInt16

    /**
     * Specifies the total size, in bytes, of the memory allocated for <b>Buffer</b>. Up to <b>MaximumLength</b> bytes can be written into the buffer without trampling memory.
     */
    MaximumLength : UInt16

    /**
     * Pointer to a wide character string. Note that the strings returned by the various LSA functions might not be null-terminated.
     */
    Buffer : PWSTR

}
