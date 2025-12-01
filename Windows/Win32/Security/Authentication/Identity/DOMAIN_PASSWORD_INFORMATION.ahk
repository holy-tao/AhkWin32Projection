#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a domain's password policy, such as the minimum length for passwords and how unique passwords must be.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-domain_password_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class DOMAIN_PASSWORD_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the minimum length, in characters, of a valid password.
     * @type {Integer}
     */
    MinPasswordLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Indicates the number of previous passwords saved in the history list. A user cannot reuse a password in the history list.
     * @type {Integer}
     */
    PasswordHistoryLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * 
     * @type {Integer}
     */
    PasswordProperties {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the maximum length of time that a password can remain the same. Passwords older than this must be changed. Because SAM stores relative times as negative values and absolute times as positive numbers, the time is stored as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure with negative values.
     * 
     * The data type for this member is OLD_LARGE_INTEGER if MIDL_PASS is defined.
     * @type {Integer}
     */
    MaxPasswordAge {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Specifies the minimum length of time before a password can be changed. Because SAM stores relative times as negative values and absolute times as positive numbers, the time is stored as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure with negative values.
     * 
     * The data type for this member is OLD_LARGE_INTEGER if MIDL_PASS is defined.
     * @type {Integer}
     */
    MinPasswordAge {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }
}
