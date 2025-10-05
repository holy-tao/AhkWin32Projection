#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Indicates whether a token has elevated privileges.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_elevation
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_ELEVATION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * A nonzero value if the token has elevated privileges; otherwise, a zero value.
     * @type {Integer}
     */
    TokenIsElevated {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
