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
    static sizeof => 304

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
                this.__Input := PIPE_TERMINATION(40, this)
            return this.__Input
        }
    }

    /**
     * @type {PIPE_TERMINATION}
     */
    Output{
        get {
            if(!this.HasProp("__Output"))
                this.__Output := PIPE_TERMINATION(112, this)
            return this.__Output
        }
    }

    /**
     * @type {Integer}
     */
    Strategy {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * @type {Integer}
     */
    Weight {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    LogicalMemoryType {
        get => NumGet(this, 196, "int")
        set => NumPut("int", value, this, 196)
    }

    /**
     * @type {Integer}
     */
    AllocatorPlace {
        get => NumGet(this, 200, "int")
        set => NumPut("int", value, this, 200)
    }

    /**
     * @type {PIPE_DIMENSIONS}
     */
    Dimensions{
        get {
            if(!this.HasProp("__Dimensions"))
                this.__Dimensions := PIPE_DIMENSIONS(208, this)
            return this.__Dimensions
        }
    }

    /**
     * @type {KS_FRAMING_RANGE}
     */
    PhysicalRange{
        get {
            if(!this.HasProp("__PhysicalRange"))
                this.__PhysicalRange := KS_FRAMING_RANGE(256, this)
            return this.__PhysicalRange
        }
    }

    /**
     * @type {IKsAllocatorEx}
     */
    PrevSegment {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    CountNextSegments {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * @type {Pointer<IKsAllocatorEx>}
     */
    NextSegments {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {Integer}
     */
    InsideFactors {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    NumberPins {
        get => NumGet(this, 300, "uint")
        set => NumPut("uint", value, this, 300)
    }
}
