#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_ATTRIBUTE.ahk

/**
 * Used in the CMC_DATA_INFO and CMC_RESPONSE_INFO structures.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cmc_tagged_attribute
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMC_TAGGED_ATTRIBUTE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <b>DWORD</b> value that identifies the tagged attribute.
     * @type {Integer}
     */
    dwBodyPartID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structure that contains the attribute.
     * @type {CRYPT_ATTRIBUTE}
     */
    Attribute{
        get {
            if(!this.HasProp("__Attribute"))
                this.__Attribute := CRYPT_ATTRIBUTE(this.ptr + 8)
            return this.__Attribute
        }
    }
}
