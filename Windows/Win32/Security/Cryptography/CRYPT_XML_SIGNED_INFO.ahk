#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_XML_REFERENCE.ahk" { CRYPT_XML_REFERENCE }
#Import ".\CRYPT_XML_CHARSET.ahk" { CRYPT_XML_CHARSET }
#Import ".\CRYPT_XML_BLOB.ahk" { CRYPT_XML_BLOB }
#Import ".\CRYPT_XML_ALGORITHM.ahk" { CRYPT_XML_ALGORITHM }

/**
 * Describes an XML encoded SignedInfo element.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_signed_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_SIGNED_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Optional.  A pointer to a null-terminated Unicode string that contains the <b>Id</b> attribute.
     */
    wszId : PWSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm">CRYPT_XML_ALGORITHM</a> structure that specifies the canonicalization algorithm.
     */
    Canonicalization : CRYPT_XML_ALGORITHM

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm">CRYPT_XML_ALGORITHM</a> structure that specifies the signature algorithm.
     */
    SignatureMethod : CRYPT_XML_ALGORITHM

    /**
     * The number of elements in the array pointed to by the <b>rgpReference</b> member.
     */
    cReference : UInt32

    /**
     * A pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_reference">CRYPT_XML_REFERENCE</a> structures   that contain information that is encoded in <b>Reference</b> elements.
     */
    rgpReference : IntPtr

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_blob">CRYPT_XML_BLOB</a> structure that contains the XML encoded <b>SignedInfo</b> element.
     */
    Encoded : CRYPT_XML_BLOB

}
