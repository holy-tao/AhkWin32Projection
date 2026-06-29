#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PWSTR.ahk" { PWSTR }

/**
 * Used by various Local Security Authority (LSA) functions to specify a Unicode string.
 * @see https://learn.microsoft.com/windows/win32/api/subauth/ns-subauth-unicode_string
 * @namespace Windows.Win32.Foundation
 */
export default struct UNICODE_STRING {
    #StructPack 8

    /**
     * Specifies the length, in bytes, of the string pointed to by the <b>Buffer</b> member, not including the terminating <b>NULL</b> character, if any.
     * 
     * <b>Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>When the <b>Length</b> structure member is zero and the <b>MaximumLength</b> structure member is 1, the <b>Buffer</b> structure member can be an empty string or contain solely a null character. This behavior changed beginning with Windows Server 2008 R2 and Windows 7 with SP1.
     */
    Length : UInt16

    /**
     * Specifies the total size, in bytes, of memory allocated for <b>Buffer</b>. Up to <b>MaximumLength</b> bytes may be written into the buffer without trampling memory.
     * 
     * <b>Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>When the <b>Length</b> structure member is zero and the <b>MaximumLength</b> structure member is 1, the <b>Buffer</b> structure member can be an empty string or contain solely a null character. This behavior changed beginning with Windows Server 2008 R2 and Windows 7 with SP1.
     */
    MaximumLength : UInt16

    /**
     * Pointer to a wide-character string. Note that the strings returned by the various LSA functions might not be <b>null</b>-terminated.
     * 
     * <b>Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>When the <b>Length</b> structure member is zero and the <b>MaximumLength</b> structure member is 1, the <b>Buffer</b> structure member can be an empty string or contain solely a null character. This behavior changed beginning with Windows Server 2008 R2 and Windows 7 with SP1.
     */
    Buffer : PWSTR

}
