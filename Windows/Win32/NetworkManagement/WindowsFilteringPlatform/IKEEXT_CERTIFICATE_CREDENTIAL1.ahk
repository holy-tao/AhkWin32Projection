#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }

/**
 * Is used to store credential information specific to certificate authentication. (IKEEXT_CERTIFICATE_CREDENTIAL1)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_certificate_credential1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CERTIFICATE_CREDENTIAL1 {
    #StructPack 8

    /**
     * Encoded subject name of the certificate used for authentication. Use <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certnametostra">CertNameToStr</a> to convert the encoded name to string.
     * 
     * See [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) for more information.
     */
    subjectName : FWP_BYTE_BLOB

    /**
     * SHA thumbprint of the certificate.
     * 
     * See [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) for more information.
     */
    certHash : FWP_BYTE_BLOB

    /**
     * Possible values:
     * 
     * <a id="IKEEXT_CERT_CREDENTIAL_FLAG_NAP_CERT"></a>
     * <a id="ikeext_cert_credential_flag_nap_cert"></a>
     */
    flags : UInt32

    /**
     * The encoded certificate. Use <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcreatecertificatecontext">CertCreateCertificateContext</a> to create a certificate context from the encoded certificate.
     * 
     * See [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) for more information.
     */
    certificate : FWP_BYTE_BLOB

}
