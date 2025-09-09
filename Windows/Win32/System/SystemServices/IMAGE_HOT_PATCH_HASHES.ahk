#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_HOT_PATCH_HASHES extends Win32Struct
{
    static sizeof => 52

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    SHA256{
        get {
            if(!this.HasProp("__SHA256ProxyArray"))
                this.__SHA256ProxyArray := Win32FixedArray(this.ptr + 0, 32, Primitive, "char")
            return this.__SHA256ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    SHA1{
        get {
            if(!this.HasProp("__SHA1ProxyArray"))
                this.__SHA1ProxyArray := Win32FixedArray(this.ptr + 32, 20, Primitive, "char")
            return this.__SHA1ProxyArray
        }
    }
}
