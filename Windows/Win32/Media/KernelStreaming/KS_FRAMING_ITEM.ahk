#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KS_FRAMING_RANGE_WEIGHTED.ahk
#Include .\KS_FRAMING_RANGE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_FRAMING_ITEM extends Win32Struct {
    static sizeof => 88

    static packingSize => 4

    /**
     * @type {Guid}
     */
    MemoryType {
        get {
            if(!this.HasProp("__MemoryType"))
                this.__MemoryType := Guid(0, this)
            return this.__MemoryType
        }
    }

    /**
     * @type {Guid}
     */
    BusType {
        get {
            if(!this.HasProp("__BusType"))
                this.__BusType := Guid(16, this)
            return this.__BusType
        }
    }

    /**
     * @type {Integer}
     */
    MemoryFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    BusFlags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    Frames {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    FileAlignment {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    FramePitch {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    MemoryTypeWeight {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {KS_FRAMING_RANGE}
     */
    PhysicalRange {
        get {
            if(!this.HasProp("__PhysicalRange"))
                this.__PhysicalRange := KS_FRAMING_RANGE(56, this)
            return this.__PhysicalRange
        }
    }

    /**
     * @type {KS_FRAMING_RANGE_WEIGHTED}
     */
    FramingRange {
        get {
            if(!this.HasProp("__FramingRange"))
                this.__FramingRange := KS_FRAMING_RANGE_WEIGHTED(68, this)
            return this.__FramingRange
        }
    }
}
