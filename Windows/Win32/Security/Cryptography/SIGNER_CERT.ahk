#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a certificate used to sign a document. The certificate can be stored in a Software Publisher Certificate (SPC) file or in a certificate store.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-cert
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SIGNER_CERT extends Win32Struct
{
    static sizeof => 24

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
     * Specifies how the certificate is stored. This member can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                          | Meaning                                                                                                                                                                                                                                                                           |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="SIGNER_CERT_SPC_FILE"></span><span id="signer_cert_spc_file"></span><dl> <dt>**SIGNER\_CERT\_SPC\_FILE**</dt> <dt>1</dt> </dl>    | The certificate is stored in an SPC file. The **pwszSpcFile** member contains the path and file name of the SPC file.<br/>                                                                                                                                                  |
     * | <span id="SIGNER_CERT_STORE"></span><span id="signer_cert_store"></span><dl> <dt>**SIGNER\_CERT\_STORE**</dt> <dt>2</dt> </dl>              | The certificate is stored in a certificate store. The **pCertStoreInfo** member contains a pointer to a [**SIGNER\_CERT\_STORE\_INFO**](signer-cert-store-info.md) structure that specifies the certificate store in which the certificate is stored.<br/>                 |
     * | <span id="SIGNER_CERT_SPC_CHAIN"></span><span id="signer_cert_spc_chain"></span><dl> <dt>**SIGNER\_CERT\_SPC\_CHAIN**</dt> <dt>3</dt> </dl> | The certificate is stored in an SPC file and is associated with a certificate chain. The **pSpcChainInfo** member contains a pointer to a [**SIGNER\_SPC\_CHAIN\_INFO**](signer-spc-chain-info.md) structure that contains the chain information for the certificate.<br/> |
     * @type {Integer}
     */
    dwCertChoice {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pwszSpcFile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<SIGNER_CERT_STORE_INFO>}
     */
    pCertStoreInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<SIGNER_SPC_CHAIN_INFO>}
     */
    pSpcChainInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The handle of the window to use as the owner of any dialog boxes that are displayed. This member is not currently used and is ignored.
     * @type {Pointer<HWND>}
     */
    hwnd {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}
