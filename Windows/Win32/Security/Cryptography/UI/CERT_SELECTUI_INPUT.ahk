#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\HCERTSTORE.ahk

/**
 * Used by the CertSelectionGetSerializedBlob function to serialize the certificates contained in a store or an array of certificate chains. The returned serialized BLOB can be passed to the CredUIPromptForWindowsCredentials function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cert_selectui_input
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CERT_SELECTUI_INPUT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The  handle of a certificate store created by the caller. The store contains the set of  application preselected certificates.
     * @type {HCERTSTORE}
     */
    hStore{
        get {
            if(!this.HasProp("__hStore"))
                this.__hStore := HCERTSTORE(this.ptr + 0)
            return this.__hStore
        }
    }

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_context">CERT_CHAIN_CONTEXT</a> structures. Applications provision this array by preselecting certificate chains using the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certselectcertificatechains">CertSelectCertificateChains</a> function.
     * @type {Pointer<CERT_CHAIN_CONTEXT>}
     */
    prgpChain {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_context">CERT_CHAIN_CONTEXT</a> structures that are in the array pointed to by the <b>prgpChain</b> member.
     * @type {Integer}
     */
    cChain {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
