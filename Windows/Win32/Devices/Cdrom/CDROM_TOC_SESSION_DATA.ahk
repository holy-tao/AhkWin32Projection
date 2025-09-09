#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TRACK_DATA.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_TOC_SESSION_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    Length{
        get {
            if(!this.HasProp("__LengthProxyArray"))
                this.__LengthProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "char")
            return this.__LengthProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    FirstCompleteSession {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    LastCompleteSession {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Array<TRACK_DATA>}
     */
    TrackData{
        get {
            if(!this.HasProp("__TrackDataProxyArray"))
                this.__TrackDataProxyArray := Win32FixedArray(this.ptr + 8, 1, TRACK_DATA, "")
            return this.__TrackDataProxyArray
        }
    }
}
