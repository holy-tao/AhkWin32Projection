#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\CHAR.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class s_RIFFWAVE_inst extends Win32Struct
{
    static sizeof => 7

    static packingSize => 1

    /**
     * @type {Integer}
     */
    bUnshiftedNote {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {CHAR}
     */
    chFineTune{
        get {
            if(!this.HasProp("__chFineTune"))
                this.__chFineTune := CHAR(this.ptr + 1)
            return this.__chFineTune
        }
    }

    /**
     * @type {CHAR}
     */
    chGain{
        get {
            if(!this.HasProp("__chGain"))
                this.__chGain := CHAR(this.ptr + 2)
            return this.__chGain
        }
    }

    /**
     * @type {Integer}
     */
    bLowNote {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    bHighNote {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    bLowVelocity {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    bHighVelocity {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }
}
