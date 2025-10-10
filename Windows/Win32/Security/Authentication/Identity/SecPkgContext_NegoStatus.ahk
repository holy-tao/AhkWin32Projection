#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies the error status of the last attempt to create a client context.
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcontext_negostatus
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_NegoStatus extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The error status of the last attempt to create a client context.
     * @type {Integer}
     */
    LastStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
