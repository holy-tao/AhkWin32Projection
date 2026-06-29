#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Cryptography\ALG_ID.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\SAFER_HASH_IDENTIFICATION.ahk
#Include .\SAFER_IDENTIFICATION_TYPES.ahk
#Include .\SAFER_IDENTIFICATION_HEADER.ahk

/**
 * @namespace Windows.Win32.Security.AppLocker
 */
class SAFER_HASH_IDENTIFICATION2 extends Win32Struct {
    static sizeof => 1216

    static packingSize => 8

    /**
     * @type {SAFER_HASH_IDENTIFICATION}
     */
    hashIdentification {
        get {
            if(!this.HasProp("__hashIdentification"))
                this.__hashIdentification := SAFER_HASH_IDENTIFICATION(0, this)
            return this.__hashIdentification
        }
    }

    /**
     * @type {Integer}
     */
    HashSize {
        get => NumGet(this, 1144, "uint")
        set => NumPut("uint", value, this, 1144)
    }

    /**
     * @type {Array<Integer>}
     */
    ImageHash {
        get {
            if(!this.HasProp("__ImageHashProxyArray"))
                this.__ImageHashProxyArray := Win32FixedArray(this.ptr + 1148, 64, Primitive, "char")
            return this.__ImageHashProxyArray
        }
    }

    /**
     * @type {ALG_ID}
     */
    HashAlgorithm {
        get => NumGet(this, 1212, "uint")
        set => NumPut("uint", value, this, 1212)
    }
}
