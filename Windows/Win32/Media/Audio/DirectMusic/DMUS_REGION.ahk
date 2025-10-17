#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\RGNRANGE.ahk
#Include .\WAVELINK.ahk
#Include .\WSMPL.ahk
#Include .\WLOOP.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class DMUS_REGION extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {RGNRANGE}
     */
    RangeKey{
        get {
            if(!this.HasProp("__RangeKey"))
                this.__RangeKey := RGNRANGE(0, this)
            return this.__RangeKey
        }
    }

    /**
     * @type {RGNRANGE}
     */
    RangeVelocity{
        get {
            if(!this.HasProp("__RangeVelocity"))
                this.__RangeVelocity := RGNRANGE(4, this)
            return this.__RangeVelocity
        }
    }

    /**
     * @type {Integer}
     */
    fusOptions {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    usKeyGroup {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    ulRegionArtIdx {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ulNextRegionIdx {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ulFirstExtCkIdx {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {WAVELINK}
     */
    WaveLink{
        get {
            if(!this.HasProp("__WaveLink"))
                this.__WaveLink := WAVELINK(24, this)
            return this.__WaveLink
        }
    }

    /**
     * @type {WSMPL}
     */
    WSMP{
        get {
            if(!this.HasProp("__WSMP"))
                this.__WSMP := WSMPL(40, this)
            return this.__WSMP
        }
    }

    /**
     * @type {Array<WLOOP>}
     */
    WLOOP{
        get {
            if(!this.HasProp("__WLOOPProxyArray"))
                this.__WLOOPProxyArray := Win32FixedArray(this.ptr + 64, 1, WLOOP, "")
            return this.__WLOOPProxyArray
        }
    }
}
