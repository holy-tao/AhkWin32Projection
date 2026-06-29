#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_X509DATA_ITEM.ahk" { CRYPT_XML_X509DATA_ITEM }

/**
 * Represents the sequence of choices in the X509Data element.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_x509data
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_X509DATA {
    #StructPack 8

    /**
     * The size, in bytes, of the buffer pointed to by the <b>rgX509Data</b> member.
     */
    cX509Data : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_x509data_item">CRYPT_XML_X509DATA_ITEM</a> structure that contains data to encode.
     */
    rgX509Data : CRYPT_XML_X509DATA_ITEM.Ptr

}
