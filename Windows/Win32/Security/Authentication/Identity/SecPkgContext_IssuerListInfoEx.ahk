#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgContext_IssuerListInfoEx structure holds a list of trusted certification authorities (CAs).
 * @see https://docs.microsoft.com/windows/win32/api//schannel/ns-schannel-secpkgcontext_issuerlistinfoex
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_IssuerListInfoEx extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to 
     * an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_NAME_BLOB</a> structures that contains a list of the names of CAs that the server trusts.
     * 
     * When you have finished using the data in this array, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    aIssuers {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of names in <b>aIssuers</b>.
     * @type {Integer}
     */
    cIssuers {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
