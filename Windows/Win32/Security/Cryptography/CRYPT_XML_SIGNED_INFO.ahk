#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_XML_BLOB.ahk
#Include .\CRYPT_XML_ALGORITHM.ahk

/**
 * Describes an XML encoded SignedInfo element.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_signed_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_SIGNED_INFO extends Win32Struct
{
    static sizeof => 112

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
     * Optional.  A pointer to a null-terminated Unicode string that contains the <b>Id</b> attribute.
     * @type {PWSTR}
     */
    wszId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm">CRYPT_XML_ALGORITHM</a> structure that specifies the canonicalization algorithm.
     * @type {CRYPT_XML_ALGORITHM}
     */
    Canonicalization{
        get {
            if(!this.HasProp("__Canonicalization"))
                this.__Canonicalization := CRYPT_XML_ALGORITHM(16, this)
            return this.__Canonicalization
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm">CRYPT_XML_ALGORITHM</a> structure that specifies the signature algorithm.
     * @type {CRYPT_XML_ALGORITHM}
     */
    SignatureMethod{
        get {
            if(!this.HasProp("__SignatureMethod"))
                this.__SignatureMethod := CRYPT_XML_ALGORITHM(48, this)
            return this.__SignatureMethod
        }
    }

    /**
     * The number of elements in the array pointed to by the <b>rgpReference</b> member.
     * @type {Integer}
     */
    cReference {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * A pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_reference">CRYPT_XML_REFERENCE</a> structures   that contain information that is encoded in <b>Reference</b> elements.
     * @type {Pointer<Pointer<CRYPT_XML_REFERENCE>>}
     */
    rgpReference {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_blob">CRYPT_XML_BLOB</a> structure that contains the XML encoded <b>SignedInfo</b> element.
     * @type {CRYPT_XML_BLOB}
     */
    Encoded{
        get {
            if(!this.HasProp("__Encoded"))
                this.__Encoded := CRYPT_XML_BLOB(96, this)
            return this.__Encoded
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 112
    }
}
