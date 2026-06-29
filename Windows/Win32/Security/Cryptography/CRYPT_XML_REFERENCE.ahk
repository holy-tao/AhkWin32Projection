#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_XML_CHARSET.ahk" { CRYPT_XML_CHARSET }
#Import ".\CRYPT_XML_BLOB.ahk" { CRYPT_XML_BLOB }
#Import ".\CRYPT_XML_ALGORITHM.ahk" { CRYPT_XML_ALGORITHM }

/**
 * Contains information used to populate the Reference element.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_reference
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_REFERENCE {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The handle of the <b>Reference</b> element.
     */
    hReference : IntPtr

    /**
     * Optional. A pointer to a null-terminated Unicode string that contains the value of the <b>Id</b> attribute.
     */
    wszId : PWSTR

    /**
     * A pointer to a null-terminated Unicode string that contains a <b>URI</b> attribute.
     */
    wszUri : PWSTR

    /**
     * A pointer to a null-terminated Unicode string that contains the value of the <b>Type</b> attribute.
     */
    wszType : PWSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm">CRYPT_XML_ALGORITHM</a> structure that specifies the digest method.
     */
    DigestMethod : CRYPT_XML_ALGORITHM

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CRYPT_DATA_BLOB</a> structure that specifies the hash value.
     */
    DigestValue : CRYPT_INTEGER_BLOB

    /**
     * The number of elements in the array pointed to by the <b>rgTransform</b> member.
     */
    cTransform : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_transform_info">CRYPT_XML_TRANSFORM_INFO</a> structures  that contain information about the transform applied to the signed data.
     */
    rgTransform : CRYPT_XML_ALGORITHM.Ptr

}
