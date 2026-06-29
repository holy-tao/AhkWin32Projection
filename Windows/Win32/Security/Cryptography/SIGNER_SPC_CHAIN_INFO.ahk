#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCERTSTORE.ahk" { HCERTSTORE }

/**
 * Specifies a Software Publisher Certificate (SPC) and certificate chain used to sign a document.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-spc-chain-info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_SPC_CHAIN_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The name of the SPC file to use to sign a document.
     */
    pwszSpcFile : PWSTR

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
     */
    dwCertPolicy : UInt32

    /**
     * Optional. A handle to an additional certificate store.
     */
    hCertStore : HCERTSTORE

}
