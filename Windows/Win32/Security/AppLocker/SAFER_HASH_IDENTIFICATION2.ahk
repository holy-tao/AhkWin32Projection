#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\SAFER_IDENTIFICATION_HEADER.ahk
#Include .\SAFER_HASH_IDENTIFICATION.ahk

/**
 * @namespace Windows.Win32.Security.AppLocker
 * @version v4.0.30319
 */
class SAFER_HASH_IDENTIFICATION2 extends Win32Struct
{
    static sizeof => 1208

    static packingSize => 8

    /**
     * @type {SAFER_HASH_IDENTIFICATION}
     */
    hashIdentification{
        get {
            if(!this.HasProp("__hashIdentification"))
                this.__hashIdentification := SAFER_HASH_IDENTIFICATION(this.ptr + 0)
            return this.__hashIdentification
        }
    }

    /**
     * @type {Integer}
     */
    HashSize {
        get => NumGet(this, 1136, "uint")
        set => NumPut("uint", value, this, 1136)
    }

    /**
     * @type {Array<Byte>}
     */
    ImageHash{
        get {
            if(!this.HasProp("__ImageHashProxyArray"))
                this.__ImageHashProxyArray := Win32FixedArray(this.ptr + 1140, 1, Primitive, "char")
            return this.__ImageHashProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    HashAlgorithm {
        get => NumGet(this, 1204, "uint")
        set => NumPut("uint", value, this, 1204)
    }
}
