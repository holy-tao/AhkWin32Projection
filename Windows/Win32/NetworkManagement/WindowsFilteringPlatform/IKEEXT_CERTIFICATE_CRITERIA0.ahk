#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_CERT_EKUS0.ahk" { IKEEXT_CERT_EKUS0 }
#Import ".\IKEEXT_CERT_NAME0.ahk" { IKEEXT_CERT_NAME0 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }

/**
 * Contains a set of criteria to applied to an authentication method.
 * @remarks
 * The <b>certData</b> member refers to the encoded name of the root certificate, while the <b>certHash</b>, <b>eku</b>, and <b>name</b> members refer to criteria on the end certificate.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_certificate_criteria0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CERTIFICATE_CRITERIA0 {
    #StructPack 8

    /**
     * Type: [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob)</b>
     * 
     * X509/ASN.1 encoded name of the root certificate. Should be empty when
     *    specifying Enterprise or trusted root store config.
     */
    certData : FWP_BYTE_BLOB

    /**
     * Type: [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob)</b>
     * 
     *   16-character hexadecimal string that represents the ID, thumbprint or HASH of the end certificate.
     */
    certHash : FWP_BYTE_BLOB

    /**
     * Type: [IKEEXT_CERT_EKUS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_cert_ekus0)*</b>
     * 
     * The specific extended key usage (EKU) object identifiers (OIDs) selected for the criteria on the end certificate.
     */
    eku : IKEEXT_CERT_EKUS0.Ptr

    /**
     * Type: [IKEEXT_CERT_NAME0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_cert_name0)*</b>
     * 
     * The name/subject selected for the criteria on the end certificate.
     */
    name : IKEEXT_CERT_NAME0.Ptr

    /**
     * Type: <b>UINT32</b>
     * 
     * Reserved for system use.
     */
    flags : UInt32

}
