#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgContext_KeyingMaterialInfo structure contains information about the exportable keying material in a security context.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_keyingmaterialinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_KeyingMaterialInfo extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The length, in bytes, of the disambiguating ASCII label, including NUL terminator.
     * @type {Integer}
     */
    cbLabel {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A NUL-terminated ASCII string. The NUL terminator will be removed by schannel before mixing in pszLabel. 
     * 
     * IANA-registered labels should begin with "EXPORTER" to  avoid collisions with existing PRF labels. Labels beginning with "EXPERIMENTAL" may be used without registration.
     * @type {Pointer<Byte>}
     */
    pszLabel {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    cbContextValue {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * The pointer to the application context. Must be <b>NULL</b> if <i>cbContextValue</i> is zero.
     * @type {Pointer<Byte>}
     */
    pbContextValue {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The length, in bytes, of the keying material to be generated. Must be greater than zero.
     * @type {Integer}
     */
    cbKeyingMaterial {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
