#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class DISPATCHER_HEADER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Lock {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    LockNV {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Signalling {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    TimerType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TimerControlFlags {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * This bitfield backs the following members:
     * - Absolute
     * - Wake
     * - EncodedTolerableDelay
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

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
    Hand {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    TimerMiscFlags {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * This bitfield backs the following members:
     * - Index
     * - Processor
     * - Inserted
     * - Expired
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
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
    Timer2Type {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Timer2Flags {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * This bitfield backs the following members:
     * - Timer2Inserted
     * - Timer2Expiring
     * - Timer2CancelPending
     * - Timer2SetPending
     * - Timer2Running
     * - Timer2Disabled
     * - Timer2ReservedFlags
     * @type {Integer}
     */
    _bitfield12 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    Timer2Inserted {
        get => (this._bitfield12 >> 0) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 0) | (this._bitfield12 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Timer2Expiring {
        get => (this._bitfield12 >> 1) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 1) | (this._bitfield12 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Timer2CancelPending {
        get => (this._bitfield12 >> 2) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 2) | (this._bitfield12 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Timer2SetPending {
        get => (this._bitfield12 >> 3) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 3) | (this._bitfield12 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Timer2Running {
        get => (this._bitfield12 >> 4) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 4) | (this._bitfield12 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    Timer2Disabled {
        get => (this._bitfield12 >> 5) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 5) | (this._bitfield12 & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    Timer2ReservedFlags {
        get => (this._bitfield12 >> 6) & 0x3
        set => this._bitfield12 := ((value & 0x3) << 6) | (this._bitfield12 & ~(0x3 << 6))
    }

    /**
     * @type {Integer}
     */
    Timer2ComponentId {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Timer2RelativeId {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    QueueType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    QueueControlFlags {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * This bitfield backs the following members:
     * - Abandoned
     * - DisableIncrement
     * - QueueReservedControlFlags
     * @type {Integer}
     */
    _bitfield123 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    Abandoned {
        get => (this._bitfield123 >> 0) & 0x1
        set => this._bitfield123 := ((value & 0x1) << 0) | (this._bitfield123 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    DisableIncrement {
        get => (this._bitfield123 >> 1) & 0x1
        set => this._bitfield123 := ((value & 0x1) << 1) | (this._bitfield123 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    QueueReservedControlFlags {
        get => (this._bitfield123 >> 2) & 0x3F
        set => this._bitfield123 := ((value & 0x3F) << 2) | (this._bitfield123 & ~(0x3F << 2))
    }

    /**
     * @type {Integer}
     */
    QueueSize {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    QueueReserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    ThreadType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ThreadReserved {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    ThreadControlFlags {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * This bitfield backs the following members:
     * - CycleProfiling
     * - CounterProfiling
     * - GroupScheduling
     * - AffinitySet
     * - Tagged
     * - EnergyProfiling
     * - SchedulerAssist
     * - Instrumented
     * @type {Integer}
     */
    _bitfield1234 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    CycleProfiling {
        get => (this._bitfield1234 >> 0) & 0x1
        set => this._bitfield1234 := ((value & 0x1) << 0) | (this._bitfield1234 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    CounterProfiling {
        get => (this._bitfield1234 >> 1) & 0x1
        set => this._bitfield1234 := ((value & 0x1) << 1) | (this._bitfield1234 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    GroupScheduling {
        get => (this._bitfield1234 >> 2) & 0x1
        set => this._bitfield1234 := ((value & 0x1) << 2) | (this._bitfield1234 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    AffinitySet {
        get => (this._bitfield1234 >> 3) & 0x1
        set => this._bitfield1234 := ((value & 0x1) << 3) | (this._bitfield1234 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Tagged {
        get => (this._bitfield1234 >> 4) & 0x1
        set => this._bitfield1234 := ((value & 0x1) << 4) | (this._bitfield1234 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    EnergyProfiling {
        get => (this._bitfield1234 >> 5) & 0x1
        set => this._bitfield1234 := ((value & 0x1) << 5) | (this._bitfield1234 & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    SchedulerAssist {
        get => (this._bitfield1234 >> 6) & 0x1
        set => this._bitfield1234 := ((value & 0x1) << 6) | (this._bitfield1234 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    Instrumented {
        get => (this._bitfield1234 >> 7) & 0x1
        set => this._bitfield1234 := ((value & 0x1) << 7) | (this._bitfield1234 & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    DebugActive {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    MutantType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MutantSize {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {BOOLEAN}
     */
    DpcActive {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    MutantReserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    SignalState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {LIST_ENTRY}
     */
    WaitListHead{
        get {
            if(!this.HasProp("__WaitListHead"))
                this.__WaitListHead := LIST_ENTRY(8, this)
            return this.__WaitListHead
        }
    }
}
