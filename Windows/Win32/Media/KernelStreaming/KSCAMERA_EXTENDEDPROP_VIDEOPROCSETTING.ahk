#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSCAMERA_EXTENDEDPROP_VALUE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSCAMERA_EXTENDEDPROP_VIDEOPROCSETTING extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Min {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Max {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Step {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {KSCAMERA_EXTENDEDPROP_VALUE}
     */
    VideoProc{
        get {
            if(!this.HasProp("__VideoProc"))
                this.__VideoProc := KSCAMERA_EXTENDEDPROP_VALUE(16, this)
            return this.__VideoProc
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
