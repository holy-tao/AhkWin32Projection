#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an array of CRYPT_XML_REFERENCE structures.
 * @see https://docs.microsoft.com/windows/win32/api//cryptxml/ns-cryptxml-crypt_xml_references
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_REFERENCES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of elements in the array pointed to by the <b>rgpReference</b> member.
     * @type {Integer}
     */
    cReference {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an array of  <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_reference">PCRYPT_XML_REFERENCE</a> structures.
     * @type {Pointer<CRYPT_XML_REFERENCE>}
     */
    rgpReference {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
