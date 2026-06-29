#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct DISPATCHER_HEADER {
    #StructPack 8

    Lock : Int32


    /**
     * @type {Integer}
     */
    Absolute {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Wake {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    EncodedTolerableDelay {
        get => (this._bitfield >> 2) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 2) | (this._bitfield & ~(0x3F << 2))
    }

    /**
     * @type {Integer}
     */
    Index {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Processor {
        get => (this._bitfield1 >> 1) & 0x1F
        set => this._bitfield1 := ((value & 0x1F) << 1) | (this._bitfield1 & ~(0x1F << 1))
    }

    /**
     * @type {Integer}
     */
    Inserted {
        get => (this._bitfield1 >> 6) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 6) | (this._bitfield1 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    Expired {
        get => (this._bitfield1 >> 7) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 7) | (this._bitfield1 & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    Timer2Inserted {
        get => (this._bitfield2 >> 0) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 0) | (this._bitfield2 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Timer2Expiring {
        get => (this._bitfield2 >> 1) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 1) | (this._bitfield2 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Timer2CancelPending {
        get => (this._bitfield2 >> 2) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 2) | (this._bitfield2 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Timer2SetPending {
        get => (this._bitfield2 >> 3) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 3) | (this._bitfield2 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Timer2Running {
        get => (this._bitfield2 >> 4) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 4) | (this._bitfield2 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    Timer2Disabled {
        get => (this._bitfield2 >> 5) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 5) | (this._bitfield2 & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    Timer2ReservedFlags {
        get => (this._bitfield2 >> 6) & 0x3
        set => this._bitfield2 := ((value & 0x3) << 6) | (this._bitfield2 & ~(0x3 << 6))
    }

    /**
     * @type {Integer}
     */
    Abandoned {
        get => (this._bitfield3 >> 0) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 0) | (this._bitfield3 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    DisableIncrement {
        get => (this._bitfield3 >> 1) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 1) | (this._bitfield3 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    QueueReservedControlFlags {
        get => (this._bitfield3 >> 2) & 0x3F
        set => this._bitfield3 := ((value & 0x3F) << 2) | (this._bitfield3 & ~(0x3F << 2))
    }

    /**
     * @type {Integer}
     */
    CycleProfiling {
        get => (this._bitfield4 >> 0) & 0x1
        set => this._bitfield4 := ((value & 0x1) << 0) | (this._bitfield4 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    CounterProfiling {
        get => (this._bitfield4 >> 1) & 0x1
        set => this._bitfield4 := ((value & 0x1) << 1) | (this._bitfield4 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    GroupScheduling {
        get => (this._bitfield4 >> 2) & 0x1
        set => this._bitfield4 := ((value & 0x1) << 2) | (this._bitfield4 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    AffinitySet {
        get => (this._bitfield4 >> 3) & 0x1
        set => this._bitfield4 := ((value & 0x1) << 3) | (this._bitfield4 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Tagged {
        get => (this._bitfield4 >> 4) & 0x1
        set => this._bitfield4 := ((value & 0x1) << 4) | (this._bitfield4 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    EnergyProfiling {
        get => (this._bitfield4 >> 5) & 0x1
        set => this._bitfield4 := ((value & 0x1) << 5) | (this._bitfield4 & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    SchedulerAssist {
        get => (this._bitfield4 >> 6) & 0x1
        set => this._bitfield4 := ((value & 0x1) << 6) | (this._bitfield4 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    Instrumented {
        get => (this._bitfield4 >> 7) & 0x1
        set => this._bitfield4 := ((value & 0x1) << 7) | (this._bitfield4 & ~(0x1 << 7))
    }
    SignalState : Int32

    WaitListHead : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'LockNV', { type: Int32, offset: 0 })
        DefineProp(this.Prototype, 'Type', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'Signalling', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, 'Size', { type: Int8, offset: 2 })
        DefineProp(this.Prototype, 'Reserved1', { type: Int8, offset: 3 })
        DefineProp(this.Prototype, 'TimerType', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'TimerControlFlags', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, 'Hand', { type: Int8, offset: 2 })
        DefineProp(this.Prototype, 'TimerMiscFlags', { type: Int8, offset: 3 })
        DefineProp(this.Prototype, '_bitfield1', { type: Int8, offset: 3 })
        DefineProp(this.Prototype, 'Timer2Type', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'Timer2Flags', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, '_bitfield2', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, 'Timer2ComponentId', { type: Int8, offset: 2 })
        DefineProp(this.Prototype, 'Timer2RelativeId', { type: Int8, offset: 3 })
        DefineProp(this.Prototype, 'QueueType', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'QueueControlFlags', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, '_bitfield3', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, 'QueueSize', { type: Int8, offset: 2 })
        DefineProp(this.Prototype, 'QueueReserved', { type: Int8, offset: 3 })
        DefineProp(this.Prototype, 'ThreadType', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'ThreadReserved', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, 'ThreadControlFlags', { type: Int8, offset: 2 })
        DefineProp(this.Prototype, '_bitfield4', { type: Int8, offset: 2 })
        DefineProp(this.Prototype, 'DebugActive', { type: Int8, offset: 3 })
        DefineProp(this.Prototype, 'MutantType', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'MutantSize', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, 'DpcActive', { type: BOOLEAN, offset: 2 })
        DefineProp(this.Prototype, 'MutantReserved', { type: Int8, offset: 3 })
        this.DeleteProp("__New")
    }
}
