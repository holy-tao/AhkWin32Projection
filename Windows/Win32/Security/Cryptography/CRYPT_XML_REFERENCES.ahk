#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_REFERENCE.ahk" { CRYPT_XML_REFERENCE }

/**
 * Defines an array of CRYPT_XML_REFERENCE structures.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_references
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_REFERENCES {
    #StructPack 8

    /**
     * The number of elements in the array pointed to by the <b>rgpReference</b> member.
     */
    cReference : UInt32

    /**
     * A pointer to an array of  <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_reference">PCRYPT_XML_REFERENCE</a> structures.
     */
    rgpReference : IntPtr

}
