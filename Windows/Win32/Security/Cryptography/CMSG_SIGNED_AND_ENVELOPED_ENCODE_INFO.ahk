#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CMSG_SIGNED_ENCODE_INFO.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CMSG_ENVELOPED_ENCODE_INFO.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_SIGNED_AND_ENVELOPED_ENCODE_INFO extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {CMSG_SIGNED_ENCODE_INFO}
     */
    SignedInfo{
        get {
            if(!this.HasProp("__SignedInfo"))
                this.__SignedInfo := CMSG_SIGNED_ENCODE_INFO(this.ptr + 8)
            return this.__SignedInfo
        }
    }

    /**
     * @type {CMSG_ENVELOPED_ENCODE_INFO}
     */
    EnvelopedInfo{
        get {
            if(!this.HasProp("__EnvelopedInfo"))
                this.__EnvelopedInfo := CMSG_ENVELOPED_ENCODE_INFO(this.ptr + 56)
            return this.__EnvelopedInfo
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 120
    }
}
