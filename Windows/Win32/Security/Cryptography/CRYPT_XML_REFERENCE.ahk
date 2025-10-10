#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_XML_BLOB.ahk
#Include .\CRYPT_XML_ALGORITHM.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains information used to populate the Reference element.
 * @see https://docs.microsoft.com/windows/win32/api//cryptxml/ns-cryptxml-crypt_xml_reference
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_REFERENCE extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The handle of the <b>Reference</b> element.
     * @type {Pointer<Void>}
     */
    hReference {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Optional. A pointer to a null-terminated Unicode string that contains the value of the <b>Id</b> attribute.
     * @type {Pointer<Char>}
     */
    wszId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains a <b>URI</b> attribute.
     * @type {Pointer<Char>}
     */
    wszUri {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the value of the <b>Type</b> attribute.
     * @type {Pointer<Char>}
     */
    wszType {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm">CRYPT_XML_ALGORITHM</a> structure that specifies the digest method.
     * @type {CRYPT_XML_ALGORITHM}
     */
    DigestMethod{
        get {
            if(!this.HasProp("__DigestMethod"))
                this.__DigestMethod := CRYPT_XML_ALGORITHM(this.ptr + 40)
            return this.__DigestMethod
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CRYPT_DATA_BLOB</a> structure that specifies the hash value.
     * @type {CRYPT_INTEGER_BLOB}
     */
    DigestValue{
        get {
            if(!this.HasProp("__DigestValue"))
                this.__DigestValue := CRYPT_INTEGER_BLOB(this.ptr + 72)
            return this.__DigestValue
        }
    }

    /**
     * The number of elements in the array pointed to by the <b>rgTransform</b> member.
     * @type {Integer}
     */
    cTransform {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_transform_info">CRYPT_XML_TRANSFORM_INFO</a> structures  that contain information about the transform applied to the signed data.
     * @type {Pointer<CRYPT_XML_ALGORITHM>}
     */
    rgTransform {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 104
    }
}
