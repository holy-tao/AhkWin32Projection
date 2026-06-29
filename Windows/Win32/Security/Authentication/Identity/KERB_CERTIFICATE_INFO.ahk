#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the certificate information.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_certificate_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_CERTIFICATE_INFO {
    #StructPack 4

    /**
     * The size, in bytes, of the <b>KERB_CERTIFICATE_INFO</b> structure including the marshaled payload which is a structure of type specified in the <i>InfoType</i> parameter and immediately follows the <b>KERB_CERTIFICATE_INFO</b> structure in contiguous memory.
     */
    CertInfoSize : UInt32

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_certificate_info_type">KERB_CERTIFICATE_INFO_TYPE</a> 	enumeration that specifies the type of certificate information that is provided.
     */
    InfoType : UInt32

}
