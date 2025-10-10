#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgContext_EarlyStart structure contains information about whether to attempt to use the False Start feature in a security context.
 * @see https://docs.microsoft.com/windows/win32/api//schannel/ns-schannel-secpkgcontext_earlystart
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_EarlyStart extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Determines whether to attempt client-side False Start. Set the value to <b>ENABLE_TLS_CLIENT_EARLY_START</b> (1) to use False Start.
     * @type {Integer}
     */
    dwEarlyStartFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
