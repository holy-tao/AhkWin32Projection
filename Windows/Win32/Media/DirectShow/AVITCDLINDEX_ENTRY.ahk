#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\TIMECODE.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AVITCDLINDEX_ENTRY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 2

    /**
     * @type {Integer}
     */
    dwTick {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {TIMECODE}
     */
    time{
        get {
            if(!this.HasProp("__time"))
                this.__time := TIMECODE(this.ptr + 4)
            return this.__time
        }
    }

    /**
     * @type {Integer}
     */
    dwSMPTEflags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwUser {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<SByte>}
     */
    szReelId{
        get {
            if(!this.HasProp("__szReelIdProxyArray"))
                this.__szReelIdProxyArray := Win32FixedArray(this.ptr + 28, 12, Primitive, "char")
            return this.__szReelIdProxyArray
        }
    }
}
