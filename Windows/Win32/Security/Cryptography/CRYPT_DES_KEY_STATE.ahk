#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_DES_KEY_STATE extends Win32Struct {
    static sizeof => 24

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    Key {
        get {
            if(!this.HasProp("__KeyProxyArray"))
                this.__KeyProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__KeyProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    IV {
        get {
            if(!this.HasProp("__IVProxyArray"))
                this.__IVProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "char")
            return this.__IVProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Feedback {
        get {
            if(!this.HasProp("__FeedbackProxyArray"))
                this.__FeedbackProxyArray := Win32FixedArray(this.ptr + 16, 8, Primitive, "char")
            return this.__FeedbackProxyArray
        }
    }
}
