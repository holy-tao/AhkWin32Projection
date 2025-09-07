#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies the pseudorandom function (PRF) and extracts key data used by the Extensible Authentication Protocol (EAP) Transport Layer Security protocol (TLS) Authentication Protocol.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_eapprfinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_EapPrfInfo extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reserved. Must be set to zero.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in bytes, of the <i>pbPrfData</i> array.
     * @type {Integer}
     */
    cbPrfData {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Pointer<Byte>}
     */
    pbPrfData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
