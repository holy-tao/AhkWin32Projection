#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The LSA_AUTH_INFORMATION structure contains authentication information for a trusted domain.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-lsa_auth_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_AUTH_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a> structure that uses the Coordinated Universal Time (Greenwich Mean Time) format to indicate the time that this value was set. For more information about Coordinated Universal Time, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @type {Integer}
     */
    LastUpdateTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    AuthType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the size, in bytes, of the <b>AuthInfo</b> member.
     * @type {Integer}
     */
    AuthInfoLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Pointer to an array of bytes that contains the type of authentication information indicated by the <b>AuthType</b> member.
     * @type {Pointer<Byte>}
     */
    AuthInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
