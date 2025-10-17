#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\GNSS_AGNSS_INJECTTIME.ahk
#Include .\GNSS_FIXDATA_BASIC.ahk
#Include .\GNSS_FIXDATA_ACCURACY.ahk
#Include .\GNSS_AGNSS_INJECTPOSITION.ahk
#Include .\GNSS_AGNSS_INJECTBLOB.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_AGNSS_INJECT extends Win32Struct
{
    static sizeof => 672

    static packingSize => 8

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
    InjectionType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {NTSTATUS}
     */
    InjectionStatus {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    InjectionDataSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 20, 512, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }

    /**
     * @type {GNSS_AGNSS_INJECTTIME}
     */
    Time{
        get {
            if(!this.HasProp("__Time"))
                this.__Time := GNSS_AGNSS_INJECTTIME(536, this)
            return this.__Time
        }
    }

    /**
     * @type {GNSS_AGNSS_INJECTPOSITION}
     */
    Position{
        get {
            if(!this.HasProp("__Position"))
                this.__Position := GNSS_AGNSS_INJECTPOSITION(536, this)
            return this.__Position
        }
    }

    /**
     * @type {GNSS_AGNSS_INJECTBLOB}
     */
    BlobData{
        get {
            if(!this.HasProp("__BlobData"))
                this.__BlobData := GNSS_AGNSS_INJECTBLOB(536, this)
            return this.__BlobData
        }
    }
}
