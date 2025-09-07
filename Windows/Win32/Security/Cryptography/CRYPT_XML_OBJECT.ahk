#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\CRYPT_XML_REFERENCES.ahk
#Include .\CRYPT_XML_BLOB.ahk

/**
 * Describes an Object element in the signature.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_object
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_OBJECT extends Win32Struct
{
    static sizeof => 72

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
     * The handle of the object.
     * @type {Pointer<Void>}
     */
    hObject {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Optional. A pointer to a null-terminated wide character string that contains the value of the unique identifier attribute of the <b>Object</b> element.
     * @type {PWSTR}
     */
    wszId{
        get {
            if(!this.HasProp("__wszId"))
                this.__wszId := PWSTR(this.ptr + 16)
            return this.__wszId
        }
    }

    /**
     * Optional. A pointer to a null-terminated wide character string that contains the value of the MIME-type attribute of the <b>Object</b> element.
     * @type {PWSTR}
     */
    wszMimeType{
        get {
            if(!this.HasProp("__wszMimeType"))
                this.__wszMimeType := PWSTR(this.ptr + 24)
            return this.__wszMimeType
        }
    }

    /**
     * Optional. A pointer to a null-terminated wide character string that contains the value of the encoding method attribute of the <b>Object</b> element.
     * @type {PWSTR}
     */
    wszEncoding{
        get {
            if(!this.HasProp("__wszEncoding"))
                this.__wszEncoding := PWSTR(this.ptr + 32)
            return this.__wszEncoding
        }
    }

    /**
     * Optional. A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_references">CRYPT_XML_REFERENCES</a> structure that specifies an array of references.
     * @type {CRYPT_XML_REFERENCES}
     */
    Manifest{
        get {
            if(!this.HasProp("__Manifest"))
                this.__Manifest := CRYPT_XML_REFERENCES(this.ptr + 40)
            return this.__Manifest
        }
    }

    /**
     * Optional. A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_blob">CRYPT_XML_BLOB</a> structure that contains the XML part of the entire <b>Object</b> element.
     * 
     * <div class="alert"><b>Note</b>  This field is empty when the <b>Object</b> element does not contain
     *     any elements.
     *     Applications can use the <b>CRYPT_XML_FLAG_ALWAYS_RETURN_ENCODED_OBJECT</b> flag
     *     to always receive an encoded <b>Object</b> element.</div>
     * <div> </div>
     * @type {CRYPT_XML_BLOB}
     */
    Encoded{
        get {
            if(!this.HasProp("__Encoded"))
                this.__Encoded := CRYPT_XML_BLOB(this.ptr + 56)
            return this.__Encoded
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 72
    }
}
