#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The logoff time of the security context.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_logofftime
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_LogoffTime extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The logoff time for the user.
     * @type {Integer}
     */
    tsLogoffTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
