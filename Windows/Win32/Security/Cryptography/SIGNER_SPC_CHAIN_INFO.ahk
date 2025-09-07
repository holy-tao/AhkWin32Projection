#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\HCERTSTORE.ahk

/**
 * Specifies a Software Publisher Certificate (SPC) and certificate chain used to sign a document.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-spc-chain-info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SIGNER_SPC_CHAIN_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size, in bytes, of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The name of the SPC file to use to sign a document.
     * @type {PWSTR}
     */
    pwszSpcFile{
        get {
            if(!this.HasProp("__pwszSpcFile"))
                this.__pwszSpcFile := PWSTR(this.ptr + 8)
            return this.__pwszSpcFile
        }
    }

    /**
     * Specifies how certificates are added to the signature. To find the certificate chain, the MY, CA, ROOT, and SPC stores, in addition to the store specified by the **hCertStore** member, are checked. This member can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                                                                   | Meaning                                                                                                                                                                                   |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="SIGNER_CERT_POLICY_CHAIN"></span><span id="signer_cert_policy_chain"></span><dl> <dt>**SIGNER\_CERT\_POLICY\_CHAIN**</dt> <dt>2 (0x2)</dt> </dl>                           | Add only certificates in the certificate chain.<br/>                                                                                                                                |
     * | <span id="SIGNER_CERT_POLICY_CHAIN_NO_ROOT"></span><span id="signer_cert_policy_chain_no_root"></span><dl> <dt>**SIGNER\_CERT\_POLICY\_CHAIN\_NO\_ROOT**</dt> <dt>8 (0x8)</dt> </dl> | Add only certificates in the certificate chain, excluding the root certificate.<br/>                                                                                                |
     * | <span id="SIGNER_CERT_POLICY_STORE"></span><span id="signer_cert_policy_store"></span><dl> <dt>**SIGNER\_CERT\_POLICY\_STORE**</dt> <dt>1 (0x1)</dt> </dl>                           | Add all certificates in the store specified by the **hCertStore** member. This flag can be a bitwise-**OR** combination with any of the other possible values for this member.<br/> |
     * @type {Integer}
     */
    dwCertPolicy {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Optional. A handle to an additional certificate store.
     * @type {HCERTSTORE}
     */
    hCertStore{
        get {
            if(!this.HasProp("__hCertStore"))
                this.__hCertStore := HCERTSTORE(this.ptr + 24)
            return this.__hCertStore
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 32
    }
}
