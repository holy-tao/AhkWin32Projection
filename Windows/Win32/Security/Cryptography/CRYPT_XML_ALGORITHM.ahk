#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\CRYPT_XML_BLOB.ahk

/**
 * Specifies the algorithm used to sign or transform the message.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_algorithm
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_ALGORITHM extends Win32Struct
{
    static sizeof => 32

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
     * A pointer to a null-terminated Unicode string that contains the <b>Algorithm</b> attribute. 
     *     When the <b>Encoded</b> member contains an element that is proved by an application, this member is set to <b>NULL</b>.XML
     * @type {PWSTR}
     */
    wszAlgorithm{
        get {
            if(!this.HasProp("__wszAlgorithm"))
                this.__wszAlgorithm := PWSTR(this.ptr + 8)
            return this.__wszAlgorithm
        }
    }

    /**
     * Optional.  The XML encoded element. 
     *     This member  is set when an element tag is present in the XML signature.
     * @type {CRYPT_XML_BLOB}
     */
    Encoded{
        get {
            if(!this.HasProp("__Encoded"))
                this.__Encoded := CRYPT_XML_BLOB(this.ptr + 16)
            return this.__Encoded
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 32
    }
}
