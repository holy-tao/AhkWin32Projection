#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\AUTH_TYPE.ahk" { AUTH_TYPE }

/**
 * Describes security authentication information for content access.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ns-searchapi-authentication_info
 * @namespace Windows.Win32.System.Search
 */
export default struct AUTHENTICATION_INFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Size of the structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-auth_type">AUTH_TYPE</a></b>
     * 
     * Flag to describe the type of authentication. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-auth_type">AUTH_TYPE</a> enumerated type.
     */
    atAuthenticationType : AUTH_TYPE

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the user name.
     */
    pcwszUser : PWSTR

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the password for <b> pcwszUser</b>.
     */
    pcwszPassword : PWSTR

}
