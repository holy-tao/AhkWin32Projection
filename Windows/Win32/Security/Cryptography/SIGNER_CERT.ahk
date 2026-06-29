#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\SIGNER_SPC_CHAIN_INFO.ahk" { SIGNER_SPC_CHAIN_INFO }
#Import ".\SIGNER_CERT_CHOICE.ahk" { SIGNER_CERT_CHOICE }
#Import ".\SIGNER_CERT_STORE_INFO.ahk" { SIGNER_CERT_STORE_INFO }

/**
 * Specifies a certificate used to sign a document. The certificate can be stored in a Software Publisher Certificate (SPC) file or in a certificate store.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-cert
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_CERT {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

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
     */
    dwCertChoice : SIGNER_CERT_CHOICE

    pwszSpcFile : PWSTR

    /**
     * The handle of the window to use as the owner of any dialog boxes that are displayed. This member is not currently used and is ignored.
     */
    hwnd : HWND

    static __New() {
        DefineProp(this.Prototype, 'pCertStoreInfo', { type: SIGNER_CERT_STORE_INFO.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pSpcChainInfo', { type: SIGNER_SPC_CHAIN_INFO.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
