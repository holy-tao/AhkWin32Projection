#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_PROPERTY_ID.ahk" { CRYPT_XML_PROPERTY_ID }

/**
 * Contains information about a CryptXML property.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_property
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_PROPERTY {
    #StructPack 8

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ne-cryptxml-crypt_xml_property_id">CRYPT_XML_PROPERTY_ID</a> enumeration that specifies the property type.
     */
    dwPropId : CRYPT_XML_PROPERTY_ID

    /**
     * A pointer to a buffer that contains the property value.
     */
    pvValue : IntPtr

    /**
     * The size, in bytes, of the property value buffer pointed to by the <b>pvValue</b> member.
     */
    cbValue : UInt32

}
