#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes security authentication information for content access.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ns-searchapi-authentication_info
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class AUTHENTICATION_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Size of the structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-auth_type">AUTH_TYPE</a></b>
     * 
     * Flag to describe the type of authentication. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-auth_type">AUTH_TYPE</a> enumerated type.
     * @type {Integer}
     */
    atAuthenticationType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the user name.
     * @type {Pointer<PWSTR>}
     */
    pcwszUser {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the password for <b> pcwszUser</b>.
     * @type {Pointer<PWSTR>}
     */
    pcwszPassword {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
