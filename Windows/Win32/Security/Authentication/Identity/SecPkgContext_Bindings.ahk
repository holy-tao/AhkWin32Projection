#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies a structure that contains channel binding information for a security context.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_bindings
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_Bindings extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes, of the structure specified by the <b>Bindings</b> member
     * @type {Integer}
     */
    BindingsLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_channel_bindings">SEC_CHANNEL_BINDINGS</a> structure that specifies channel binding information.
     * @type {Pointer<SEC_CHANNEL_BINDINGS>}
     */
    Bindings {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
