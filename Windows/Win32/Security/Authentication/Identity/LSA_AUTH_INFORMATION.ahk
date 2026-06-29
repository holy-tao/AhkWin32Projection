#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_AUTH_INFORMATION_AUTH_TYPE.ahk" { LSA_AUTH_INFORMATION_AUTH_TYPE }

/**
 * The LSA_AUTH_INFORMATION structure contains authentication information for a trusted domain.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_auth_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_AUTH_INFORMATION {
    #StructPack 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a> structure that uses the Coordinated Universal Time (Greenwich Mean Time) format to indicate the time that this value was set. For more information about Coordinated Universal Time, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     */
    LastUpdateTime : Int64

    AuthType : LSA_AUTH_INFORMATION_AUTH_TYPE

    /**
     * Specifies the size, in bytes, of the <b>AuthInfo</b> member.
     */
    AuthInfoLength : UInt32

    /**
     * Pointer to an array of bytes that contains the type of authentication information indicated by the <b>AuthType</b> member.
     */
    AuthInfo : IntPtr

}
