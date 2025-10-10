#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the sequence of choices in the X509Data element.
 * @see https://docs.microsoft.com/windows/win32/api//cryptxml/ns-cryptxml-crypt_xml_x509data
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_X509DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes, of the buffer pointed to by the <b>rgX509Data</b> member.
     * @type {Integer}
     */
    cX509Data {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_x509data_item">CRYPT_XML_X509DATA_ITEM</a> structure that contains data to encode.
     * @type {Pointer<CRYPT_XML_X509DATA_ITEM>}
     */
    rgX509Data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
