#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_FRAMING_RANGE.ahk
#Include .\KS_FRAMING_RANGE_WEIGHTED.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_FRAMING_ITEM extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    MemoryType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    BusType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    MemoryFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    BusFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Frames {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    FileAlignment {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    FramePitch {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    MemoryTypeWeight {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {KS_FRAMING_RANGE}
     */
    PhysicalRange{
        get {
            if(!this.HasProp("__PhysicalRange"))
                this.__PhysicalRange := KS_FRAMING_RANGE(this.ptr + 40)
            return this.__PhysicalRange
        }
    }

    /**
     * @type {KS_FRAMING_RANGE_WEIGHTED}
     */
    FramingRange{
        get {
            if(!this.HasProp("__FramingRange"))
                this.__FramingRange := KS_FRAMING_RANGE_WEIGHTED(this.ptr + 56)
            return this.__FramingRange
        }
    }
}
