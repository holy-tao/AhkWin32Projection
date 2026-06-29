#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Is used by the CryptXmlSign function to specify the members of the KeyInfo element to be encoded.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_keyinfo_param
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_KEYINFO_PARAM {
    #StructPack 8

    /**
     * A pointer to a null-terminated wide character string that contains the <b>Id</b> attribute of the <b>KeyInfo</b> element.
     */
    wszId : PWSTR

    /**
     * A pointer to a null-terminated wide character string that contains the value in the <b>KeyName</b> element.
     */
    wszKeyName : PWSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CERT_BLOB</a> structure that contains the value of the <b>X509SKI</b> element.
     */
    SKI : CRYPT_INTEGER_BLOB

    /**
     * A pointer to a null-terminated wide character string that  contains the value of the <b>X509SubjectName</b> element.
     */
    wszSubjectName : PWSTR

    /**
     * The number of elements in the array pointed to by the <b>rgCertificate</b> member.
     */
    cCertificate : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CERT_BLOB</a> structures that are used to populate the <b>X509Certificate</b> elements.
     */
    rgCertificate : CRYPT_INTEGER_BLOB.Ptr

    /**
     * The number of elements in the array pointed to by the <b>rgCRL</b> member.
     */
    cCRL : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CERT_BLOB</a> structures that are used to populate the <b>X509CRL</b> elements.
     */
    rgCRL : CRYPT_INTEGER_BLOB.Ptr

}
