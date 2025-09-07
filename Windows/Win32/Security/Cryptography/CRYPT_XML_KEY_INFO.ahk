#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\BCRYPT_KEY_HANDLE.ahk

/**
 * Encapsulates key information data.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_key_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_KEY_INFO extends Win32Struct
{
    static sizeof => 40

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
     * A pointer to a null-terminated wide character string that specifies the value of the <b>ID</b> attribute of the key information element.
     * @type {PWSTR}
     */
    wszId{
        get {
            if(!this.HasProp("__wszId"))
                this.__wszId := PWSTR(this.ptr + 8)
            return this.__wszId
        }
    }

    /**
     * The number of items in the array pointed to by the <b>rgKeyInfo</b> member.
     * @type {Integer}
     */
    cKeyInfo {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_key_info_item">CRYPT_XML_KEY_INFO_ITEM</a> structures that contain key information.
     * @type {Pointer<CRYPT_XML_KEY_INFO_ITEM>}
     */
    rgKeyInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Optional. The handle of data  derived from the first key value.
     * @type {BCRYPT_KEY_HANDLE}
     */
    hVerifyKey{
        get {
            if(!this.HasProp("__hVerifyKey"))
                this.__hVerifyKey := BCRYPT_KEY_HANDLE(this.ptr + 32)
            return this.__hVerifyKey
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
