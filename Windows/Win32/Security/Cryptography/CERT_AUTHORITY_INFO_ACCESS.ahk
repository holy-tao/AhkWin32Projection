#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_ACCESS_DESCRIPTION.ahk" { CERT_ACCESS_DESCRIPTION }

/**
 * Represents authority information access and subject information access certificate extensions and specifies how to access additional information and services for the subject or the issuer of a certificate.
 * @remarks
 * The type of information represented by this structure depends on the access methods specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_access_description">CERT_ACCESS_DESCRIPTION</a> structures in the <i>rgAccDescr</i> array. For more information about access methods, the authority information access extension, and the subject information access extension, see <a href="https://www.ietf.org/rfc/rfc3280.txt">RFC 3280</a>.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptdecodeobject">CryptDecodeObject</a> function creates an instance of this structure when decoding a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structure's <b>Value</b> member and the <b>pszObjId</b> member of the <b>CERT_EXTENSION</b> structure is set to szOID_AUTHORITY_INFO_ACCESS or szOID_SUBJECT_INFO_ACCESS.
 * 
 * An instance of this structure can be used as input to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptencodeobject">CryptEncodeObject</a> function to create an appropriate <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_authority_info_access
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_AUTHORITY_INFO_ACCESS {
    #StructPack 8

    /**
     * The number of elements in the <b>rgAccDescr</b> array.
     */
    cAccDescr : UInt32

    /**
     * An array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_access_description">CERT_ACCESS_DESCRIPTION</a> structures that describes the format and location of additional information about the certificate. Each <b>CERT_ACCESS_DESCRIPTION</b> structure has as its members a <b>pszAccessMethod</b> string that indicates an access method and a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_entry">CERT_ALT_NAME_ENTRY</a> structure that indicates the location of the additional information.
     */
    rgAccDescr : CERT_ACCESS_DESCRIPTION.Ptr

}
