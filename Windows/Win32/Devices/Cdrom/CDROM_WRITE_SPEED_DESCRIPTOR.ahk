#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_WRITE_SPEED_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    EndLba{
        get {
            if(!this.HasProp("__EndLbaProxyArray"))
                this.__EndLbaProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__EndLbaProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ReadSpeed{
        get {
            if(!this.HasProp("__ReadSpeedProxyArray"))
                this.__ReadSpeedProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "char")
            return this.__ReadSpeedProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    WriteSpeed{
        get {
            if(!this.HasProp("__WriteSpeedProxyArray"))
                this.__WriteSpeedProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "char")
            return this.__WriteSpeedProxyArray
        }
    }
}
