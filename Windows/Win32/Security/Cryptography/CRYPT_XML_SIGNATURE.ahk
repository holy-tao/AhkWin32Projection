#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_XML_BLOB.ahk
#Include .\CRYPT_XML_ALGORITHM.ahk
#Include .\CRYPT_XML_SIGNED_INFO.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains information used to populate the Signature element.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_signature
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_SIGNATURE extends Win32Struct
{
    static sizeof => 176

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
     * The handle of the signature to encode.
     * @type {Pointer<Void>}
     */
    hSignature {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the value of the <b>Id</b> attribute.
     * @type {PWSTR}
     */
    wszId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_signed_info">CRYPT_XML_SIGNED_INFO</a> structure that contains the canonicalization algorithm, 
     *     a signature algorithm, and one or more references. 
     *     The <b>SignedInfo</b> element can contain an optional ID attribute that will allow 
     *     the structure to be referenced by other signatures and objects.
     * @type {CRYPT_XML_SIGNED_INFO}
     */
    SignedInfo{
        get {
            if(!this.HasProp("__SignedInfo"))
                this.__SignedInfo := CRYPT_XML_SIGNED_INFO(24, this)
            return this.__SignedInfo
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains a cryptographic signature value  used to populate the <b>Signature</b> element.
     * @type {CRYPT_INTEGER_BLOB}
     */
    SignatureValue{
        get {
            if(!this.HasProp("__SignatureValue"))
                this.__SignatureValue := CRYPT_INTEGER_BLOB(136, this)
            return this.__SignatureValue
        }
    }

    /**
     * Optional. A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_key_info">CRYPT_XML_KEY_INFO</a> structure that contains information that is encoded in the <b>KeyInfo</b> element.
     * @type {Pointer<CRYPT_XML_KEY_INFO>}
     */
    pKeyInfo {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * The number of  items in the array pointed to by the <b>rgpObject</b> member.
     * @type {Integer}
     */
    cObject {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * Optional. A pointer to an array of  pointers to <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_object">CRYPT_XML_OBJECT</a> structures that  contain information that is encoded in <b>Object</b> elements.
     * @type {Pointer<Pointer<CRYPT_XML_OBJECT>>}
     */
    rgpObject {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 176
    }
}
