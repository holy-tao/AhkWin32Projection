#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_ENCRYPTED_ENCODE_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    ContentEncryptionAlgorithm{
        get {
            if(!this.HasProp("__ContentEncryptionAlgorithm"))
                this.__ContentEncryptionAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 8)
            return this.__ContentEncryptionAlgorithm
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    pvEncryptionAuxInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
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
