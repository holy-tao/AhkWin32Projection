#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_FORTEZZA_DATA_PROP extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    /**
     * @type {Array<Byte>}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumberProxyArray"))
                this.__SerialNumberProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__SerialNumberProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CertIndex {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    CertLabel{
        get {
            if(!this.HasProp("__CertLabelProxyArray"))
                this.__CertLabelProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__CertLabelProxyArray
        }
    }
}
