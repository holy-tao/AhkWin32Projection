#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_REFERENCE.ahk" { CRYPT_XML_REFERENCE }
#Import ".\CRYPT_XML_OBJECT.ahk" { CRYPT_XML_OBJECT }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_XML_SIGNED_INFO.ahk" { CRYPT_XML_SIGNED_INFO }
#Import ".\CRYPT_XML_CHARSET.ahk" { CRYPT_XML_CHARSET }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_XML_KEY_INFO.ahk" { CRYPT_XML_KEY_INFO }
#Import ".\CRYPT_XML_ALGORITHM.ahk" { CRYPT_XML_ALGORITHM }
#Import ".\CRYPT_XML_BLOB.ahk" { CRYPT_XML_BLOB }

/**
 * Contains information used to populate the Signature element.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_signature
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_SIGNATURE {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The handle of the signature to encode.
     */
    hSignature : IntPtr

    /**
     * A pointer to a null-terminated Unicode string that contains the value of the <b>Id</b> attribute.
     */
    wszId : PWSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_signed_info">CRYPT_XML_SIGNED_INFO</a> structure that contains the canonicalization algorithm, 
     *     a signature algorithm, and one or more references. 
     *     The <b>SignedInfo</b> element can contain an optional ID attribute that will allow 
     *     the structure to be referenced by other signatures and objects.
     */
    SignedInfo : CRYPT_XML_SIGNED_INFO

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains a cryptographic signature value  used to populate the <b>Signature</b> element.
     */
    SignatureValue : CRYPT_INTEGER_BLOB

    /**
     * Optional. A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_key_info">CRYPT_XML_KEY_INFO</a> structure that contains information that is encoded in the <b>KeyInfo</b> element.
     */
    pKeyInfo : CRYPT_XML_KEY_INFO.Ptr

    /**
     * The number of  items in the array pointed to by the <b>rgpObject</b> member.
     */
    cObject : UInt32

    /**
     * Optional. A pointer to an array of  pointers to <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_object">CRYPT_XML_OBJECT</a> structures that  contain information that is encoded in <b>Object</b> elements.
     */
    rgpObject : IntPtr

}
