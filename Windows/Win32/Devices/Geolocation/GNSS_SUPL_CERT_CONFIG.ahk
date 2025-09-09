#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_SUPL_CERT_CONFIG extends Win32Struct
{
    static sizeof => 1052

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
     * @type {Integer}
     */
    CertAction {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {String}
     */
    SuplCertName {
        get => StrGet(this.ptr + 12, 259, "UTF-16")
        set => StrPut(value, this.ptr + 12, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    CertSize {
        get => NumGet(this, 532, "uint")
        set => NumPut("uint", value, this, 532)
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 536, 512, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    CertData{
        get {
            if(!this.HasProp("__CertDataProxyArray"))
                this.__CertDataProxyArray := Win32FixedArray(this.ptr + 1048, 1, Primitive, "char")
            return this.__CertDataProxyArray
        }
    }
}
