#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_FRAMING_RANGE.ahk
#Include .\KS_FRAMING_RANGE_WEIGHTED.ahk
#Include .\KS_COMPRESSION.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class PIPE_TERMINATION extends Win32Struct
{
    static sizeof => 56

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    OutsideFactors {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Weigth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {KS_FRAMING_RANGE}
     */
    PhysicalRange{
        get {
            if(!this.HasProp("__PhysicalRange"))
                this.__PhysicalRange := KS_FRAMING_RANGE(12, this)
            return this.__PhysicalRange
        }
    }

    /**
     * @type {KS_FRAMING_RANGE_WEIGHTED}
     */
    OptimalRange{
        get {
            if(!this.HasProp("__OptimalRange"))
                this.__OptimalRange := KS_FRAMING_RANGE_WEIGHTED(24, this)
            return this.__OptimalRange
        }
    }

    /**
     * @type {KS_COMPRESSION}
     */
    Compression{
        get {
            if(!this.HasProp("__Compression"))
                this.__Compression := KS_COMPRESSION(44, this)
            return this.__Compression
        }
    }
}
