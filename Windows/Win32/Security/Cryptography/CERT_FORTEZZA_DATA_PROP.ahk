#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_FORTEZZA_DATA_PROP extends Win32Struct {
    static sizeof => 48

    static packingSize => 4

    /**
     * @type {Array<Integer>}
     */
    SerialNumber {
        get {
            if(!this.HasProp("__SerialNumberProxyArray"))
                this.__SerialNumberProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
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
     * @type {Array<Integer>}
     */
    CertLabel {
        get {
            if(!this.HasProp("__CertLabelProxyArray"))
                this.__CertLabelProxyArray := Win32FixedArray(this.ptr + 12, 36, Primitive, "char")
            return this.__CertLabelProxyArray
        }
    }
}
