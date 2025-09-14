#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class XML_DRIVER_NODE_INFO extends Win32Struct
{
    static sizeof => 1184

    static packingSize => 8

    /**
     * @type {Array<SByte>}
     */
    FileName{
        get {
            if(!this.HasProp("__FileNameProxyArray"))
                this.__FileNameProxyArray := Win32FixedArray(this.ptr + 0, 64, Primitive, "char")
            return this.__FileNameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    FileSize {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CreationDate {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Array<SByte>}
     */
    Version{
        get {
            if(!this.HasProp("__VersionProxyArray"))
                this.__VersionProxyArray := Win32FixedArray(this.ptr + 80, 64, Primitive, "char")
            return this.__VersionProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    Manufacturer{
        get {
            if(!this.HasProp("__ManufacturerProxyArray"))
                this.__ManufacturerProxyArray := Win32FixedArray(this.ptr + 144, 260, Primitive, "char")
            return this.__ManufacturerProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    ProductName{
        get {
            if(!this.HasProp("__ProductNameProxyArray"))
                this.__ProductNameProxyArray := Win32FixedArray(this.ptr + 404, 260, Primitive, "char")
            return this.__ProductNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    Group{
        get {
            if(!this.HasProp("__GroupProxyArray"))
                this.__GroupProxyArray := Win32FixedArray(this.ptr + 664, 260, Primitive, "char")
            return this.__GroupProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    Altitude{
        get {
            if(!this.HasProp("__AltitudeProxyArray"))
                this.__AltitudeProxyArray := Win32FixedArray(this.ptr + 924, 260, Primitive, "char")
            return this.__AltitudeProxyArray
        }
    }
}
