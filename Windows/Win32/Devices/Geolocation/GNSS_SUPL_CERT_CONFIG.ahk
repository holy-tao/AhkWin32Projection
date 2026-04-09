#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GNSS_SUPL_CERT_ACTION.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_SUPL_CERT_CONFIG extends Win32Struct {
    static sizeof => 792

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {GNSS_SUPL_CERT_ACTION}
     */
    CertAction {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {String}
     */
    SuplCertName {
        get => StrGet(this.ptr + 12, 259, "UTF-8")
        set => StrPut(value, this.ptr + 12, 259, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    CertSize {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * @type {Array<Integer>}
     */
    Unused {
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 276, 512, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    CertData {
        get {
            if(!this.HasProp("__CertDataProxyArray"))
                this.__CertDataProxyArray := Win32FixedArray(this.ptr + 788, 1, Primitive, "char")
            return this.__CertDataProxyArray
        }
    }
}
