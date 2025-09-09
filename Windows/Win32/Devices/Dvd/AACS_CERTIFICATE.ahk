#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class AACS_CERTIFICATE extends Win32Struct
{
    static sizeof => 112

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Nonce{
        get {
            if(!this.HasProp("__NonceProxyArray"))
                this.__NonceProxyArray := Win32FixedArray(this.ptr + 0, 20, Primitive, "char")
            return this.__NonceProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Certificate{
        get {
            if(!this.HasProp("__CertificateProxyArray"))
                this.__CertificateProxyArray := Win32FixedArray(this.ptr + 20, 92, Primitive, "char")
            return this.__CertificateProxyArray
        }
    }
}
