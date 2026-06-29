#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PIPE_DIMENSIONS.ahk
#Include .\KS_FRAMING_RANGE_WEIGHTED.ahk
#Include .\IKsAllocatorEx.ahk
#Include .\KS_FRAMING_RANGE.ahk
#Include .\PIPE_STATE.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PIPE_ALLOCATOR_PLACE.ahk
#Include .\PIPE_TERMINATION.ahk
#Include .\KS_LogicalMemoryType.ahk
#Include .\KS_COMPRESSION.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class ALLOCATOR_PROPERTIES_EX extends Win32Struct {
    static sizeof => 264

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
     * @type {Guid}
     */
    MemoryType {
        get {
            if(!this.HasProp("__MemoryType"))
                this.__MemoryType := Guid(16, this)
            return this.__MemoryType
        }
    }

    /**
     * @type {Guid}
     */
    BusType {
        get {
            if(!this.HasProp("__BusType"))
                this.__BusType := Guid(32, this)
            return this.__BusType
        }
    }

    /**
     * @type {PIPE_STATE}
     */
    State {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {PIPE_TERMINATION}
     */
    Input {
        get {
            if(!this.HasProp("__Input"))
                this.__Input := PIPE_TERMINATION(52, this)
            return this.__Input
        }
    }

    /**
     * @type {PIPE_TERMINATION}
     */
    Output {
        get {
            if(!this.HasProp("__Output"))
                this.__Output := PIPE_TERMINATION(108, this)
            return this.__Output
        }
    }

    /**
     * @type {Integer}
     */
    Strategy {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    Weight {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * @type {KS_LogicalMemoryType}
     */
    LogicalMemoryType {
        get => NumGet(this, 176, "int")
        set => NumPut("int", value, this, 176)
    }

    /**
     * @type {PIPE_ALLOCATOR_PLACE}
     */
    AllocatorPlace {
        get => NumGet(this, 180, "int")
        set => NumPut("int", value, this, 180)
    }

    /**
     * @type {PIPE_DIMENSIONS}
     */
    Dimensions {
        get {
            if(!this.HasProp("__Dimensions"))
                this.__Dimensions := PIPE_DIMENSIONS(184, this)
            return this.__Dimensions
        }
    }

    /**
     * @type {KS_FRAMING_RANGE}
     */
    PhysicalRange {
        get {
            if(!this.HasProp("__PhysicalRange"))
                this.__PhysicalRange := KS_FRAMING_RANGE(220, this)
            return this.__PhysicalRange
        }
    }

    /**
     * @type {IKsAllocatorEx}
     */
    PrevSegment {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {Integer}
     */
    CountNextSegments {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * @type {Pointer<IKsAllocatorEx>}
     */
    NextSegments {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {Integer}
     */
    InsideFactors {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    NumberPins {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }
}
