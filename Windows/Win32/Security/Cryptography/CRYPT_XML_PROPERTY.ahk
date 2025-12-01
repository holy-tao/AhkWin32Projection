#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a CryptXML property.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_property
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_PROPERTY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ne-cryptxml-crypt_xml_property_id">CRYPT_XML_PROPERTY_ID</a> enumeration that specifies the property type.
     * @type {Integer}
     */
    dwPropId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A pointer to a buffer that contains the property value.
     * @type {Pointer<Void>}
     */
    pvValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size, in bytes, of the property value buffer pointed to by the <b>pvValue</b> member.
     * @type {Integer}
     */
    cbValue {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
