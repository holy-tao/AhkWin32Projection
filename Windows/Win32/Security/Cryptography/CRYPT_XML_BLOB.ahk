#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an arbitrary array of bytes.
 * @see https://docs.microsoft.com/windows/win32/api//cryptxml/ns-cryptxml-crypt_xml_blob
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_BLOB extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the character set used to encode the signature.
     * @type {Integer}
     */
    dwCharset {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The size, in bytes, of this structure.
     * 
     * Range: 0–CRYPT_XML_BLOB_MAX) (value is 0x7FFFFFF8)
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to encoded XML data.
     * @type {Pointer<Byte>}
     */
    pbData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
