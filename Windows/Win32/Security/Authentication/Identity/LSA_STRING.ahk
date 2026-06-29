#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used by Local Security Authority (LSA) functions to specify an ANSI string.
 * @see https://learn.microsoft.com/windows/win32/api/lsalookup/ns-lsalookup-lsa_string
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_STRING {
    #StructPack 8

    /**
     * Specifies the length, in bytes, of the string in <b>Buffer</b>. This value does not include the terminating null character, if any.
     * 
     * When the <b>Length</b> structure member is zero and the <b>MaximumLength</b> structure member is 1, the <b>Buffer</b> structure member must not be an empty string or contain solely a null character.
     * 
     * <b>Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>When the <b>Length</b> structure member is zero and the <b>MaximumLength</b> structure member is 1, the <b>Buffer</b> structure member can be an empty string or contain solely a null character. This behavior changed beginning with Windows Server 2008 R2 and Windows 7 with SP1.
     */
    Length : UInt16

    /**
     * Specifies the total size, in bytes, of <b>Buffer</b>. Up to <b>MaximumLength</b> bytes may be written into the buffer without trampling memory.
     * 
     * When the <b>Length</b> structure member is zero and the <b>MaximumLength</b> structure member is 1, the <b>Buffer</b> structure member must not be an empty string or contain solely a null character.
     * 
     * <b>Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>When the <b>Length</b> structure member is zero and the <b>MaximumLength</b> structure member is 1, the <b>Buffer</b> structure member can be an empty string or contain solely a null character. This behavior changed beginning with Windows Server 2008 R2 and Windows 7 with SP1.
     */
    MaximumLength : UInt16

    /**
     * Pointer to an array of characters. Note that strings returned by the LSA may not be null-terminated.
     * 
     * When the <b>Length</b> structure member is zero and the <b>MaximumLength</b> structure member is 1, the <b>Buffer</b> structure member must not be an empty string or contain solely a null character.
     * 
     * <b>Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>When the <b>Length</b> structure member is zero and the <b>MaximumLength</b> structure member is 1, the <b>Buffer</b> structure member can be an empty string or contain solely a null character. This behavior changed beginning with Windows Server 2008 R2 and Windows 7 with SP1.
     */
    Buffer : PSTR

}
