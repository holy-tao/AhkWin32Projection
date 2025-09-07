#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class AACS_CHALLENGE_KEY extends Win32Struct
{
    static sizeof => 80

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    EllipticCurvePoint{
        get {
            if(!this.HasProp("__EllipticCurvePointProxyArray"))
                this.__EllipticCurvePointProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__EllipticCurvePointProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Signature{
        get {
            if(!this.HasProp("__SignatureProxyArray"))
                this.__SignatureProxyArray := Win32FixedArray(this.ptr + 40, 1, Primitive, "char")
            return this.__SignatureProxyArray
        }
    }
}
