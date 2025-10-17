#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CMSG_SIGNED_ENCODE_INFO.ahk
#Include .\HCRYPTPROV_LEGACY.ahk
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
                this.__SignedInfo := CMSG_SIGNED_ENCODE_INFO(8, this)
            return this.__SignedInfo
        }
    }

    /**
     * @type {CMSG_ENVELOPED_ENCODE_INFO}
     */
    EnvelopedInfo{
        get {
            if(!this.HasProp("__EnvelopedInfo"))
                this.__EnvelopedInfo := CMSG_ENVELOPED_ENCODE_INFO(56, this)
            return this.__EnvelopedInfo
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 120
    }
}
