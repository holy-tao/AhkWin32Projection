#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_DES_KEY_STATE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Key{
        get {
            if(!this.HasProp("__KeyProxyArray"))
                this.__KeyProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__KeyProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    IV{
        get {
            if(!this.HasProp("__IVProxyArray"))
                this.__IVProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__IVProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Feedback{
        get {
            if(!this.HasProp("__FeedbackProxyArray"))
                this.__FeedbackProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__FeedbackProxyArray
        }
    }
}
