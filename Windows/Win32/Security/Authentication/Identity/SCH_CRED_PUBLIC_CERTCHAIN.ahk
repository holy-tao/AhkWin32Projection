#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SCH_CRED_PUBLIC_CERTCHAIN structure contains a single certificate. A certification chain can be built from this certificate.
 * @remarks
 * This structure does not directly support certificate chains. If a server needs to use certificate chains, the intermediate certificates can be placed in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority's</a> (CA) <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a> and Schannel will automatically pick them up from there.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-sch_cred_public_certchain
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SCH_CRED_PUBLIC_CERTCHAIN extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Must always be set to SCH_CRED_X509_CERTCHAIN.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.509</a> certificate, in bytes.
     * @type {Integer}
     */
    cbCertChain {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to an X.509 leaf certificate.
     * @type {Pointer<Integer>}
     */
    pCertChain {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
