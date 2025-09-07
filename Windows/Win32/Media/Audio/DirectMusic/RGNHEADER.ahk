#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\RGNRANGE.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class RGNHEADER extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {RGNRANGE}
     */
    RangeKey{
        get {
            if(!this.HasProp("__RangeKey"))
                this.__RangeKey := RGNRANGE(this.ptr + 0)
            return this.__RangeKey
        }
    }

    /**
     * @type {RGNRANGE}
     */
    RangeVelocity{
        get {
            if(!this.HasProp("__RangeVelocity"))
                this.__RangeVelocity := RGNRANGE(this.ptr + 4)
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
}
