#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TRACK_DATA.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_TOC extends Win32Struct
{
    static sizeof => 808

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    Length{
        get {
            if(!this.HasProp("__LengthProxyArray"))
                this.__LengthProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__LengthProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    FirstTrack {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    LastTrack {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Array<TRACK_DATA>}
     */
    TrackData{
        get {
            if(!this.HasProp("__TrackDataProxyArray"))
                this.__TrackDataProxyArray := Win32FixedArray(this.ptr + 8, 8, TRACK_DATA, "")
            return this.__TrackDataProxyArray
        }
    }
}
