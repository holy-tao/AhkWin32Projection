#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SUB_Q_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class SUB_Q_TRACK_ISRC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {SUB_Q_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := SUB_Q_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    FormatCode {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    Track {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    TrackIsrc{
        get {
            if(!this.HasProp("__TrackIsrcProxyArray"))
                this.__TrackIsrcProxyArray := Win32FixedArray(this.ptr + 9, 15, Primitive, "char")
            return this.__TrackIsrcProxyArray
        }
    }
}
