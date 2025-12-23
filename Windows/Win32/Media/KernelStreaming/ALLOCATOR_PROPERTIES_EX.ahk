#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_FRAMING_RANGE.ahk
#Include .\KS_FRAMING_RANGE_WEIGHTED.ahk
#Include .\KS_COMPRESSION.ahk
#Include .\PIPE_TERMINATION.ahk
#Include .\PIPE_DIMENSIONS.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class ALLOCATOR_PROPERTIES_EX extends Win32Struct
{
    static sizeof => 248

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cBuffers {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cbBuffer {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    cbAlign {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    cbPrefix {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Pointer<Guid>}
     */
    MemoryType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Guid>}
     */
    BusType {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {PIPE_TERMINATION}
     */
    Input{
        get {
            if(!this.HasProp("__Input"))
                this.__Input := PIPE_TERMINATION(36, this)
            return this.__Input
        }
    }

    /**
     * @type {PIPE_TERMINATION}
     */
    Output{
        get {
            if(!this.HasProp("__Output"))
                this.__Output := PIPE_TERMINATION(92, this)
            return this.__Output
        }
    }

    /**
     * @type {Integer}
     */
    Strategy {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    Weight {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * @type {Integer}
     */
    LogicalMemoryType {
        get => NumGet(this, 160, "int")
        set => NumPut("int", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    AllocatorPlace {
        get => NumGet(this, 164, "int")
        set => NumPut("int", value, this, 164)
    }

    /**
     * @type {PIPE_DIMENSIONS}
     */
    Dimensions{
        get {
            if(!this.HasProp("__Dimensions"))
                this.__Dimensions := PIPE_DIMENSIONS(168, this)
            return this.__Dimensions
        }
    }

    /**
     * @type {KS_FRAMING_RANGE}
     */
    PhysicalRange{
        get {
            if(!this.HasProp("__PhysicalRange"))
                this.__PhysicalRange := KS_FRAMING_RANGE(204, this)
            return this.__PhysicalRange
        }
    }

    /**
     * @type {IKsAllocatorEx}
     */
    PrevSegment {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    CountNextSegments {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {Pointer<IKsAllocatorEx>}
     */
    NextSegments {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {Integer}
     */
    InsideFactors {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * @type {Integer}
     */
    NumberPins {
        get => NumGet(this, 244, "uint")
        set => NumPut("uint", value, this, 244)
    }
}
