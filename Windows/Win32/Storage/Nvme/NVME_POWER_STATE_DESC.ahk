#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains fields that describe the attributes of each power state.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_power_state_desc
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_POWER_STATE_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Indicates the maximum power consumed by the NVM subsystem in this power state.
     * 
     * The power in Watts is equal to the value in this field multiplied by the scale specified in the Max Power Scale (**MPS**) field.
     * @type {Integer}
     */
    MP {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Bits 16:23 are reserved.
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * This bitfield backs the following members:
     * - MPS
     * - NOPS
     * - Reserved1
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Indicates the scale for the Maximum Power field (**MP**).
     * 
     * When this field is cleared to `0`, the scale of the **MP** field is in 0.01 Watts. When this field is set to `1`, the scale of the **MP** field is in 0.0001 Watts.
     * @type {Integer}
     */
    MPS {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * Indicates whether the controller processes I/O commands in this power state.
     * 
     * When this field is cleared to `0`, the controller processes I/O commands in this power state. When this field is set to `1`, the controller does not process I/O commands in this power state.
     * @type {Integer}
     */
    NOPS {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * Bits 26:31 are reserved.
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield1 >> 2) & 0x3F
        set => this._bitfield1 := ((value & 0x3F) << 2) | (this._bitfield1 & ~(0x3F << 2))
    }

    /**
     * Indicates the maximum entry latency in microseconds associated with entering this power state.
     * @type {Integer}
     */
    ENLAT {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Indicates the maximum exit latency in microseconds associated with exiting this power state.
     * @type {Integer}
     */
    EXLAT {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * This bitfield backs the following members:
     * - RRT
     * - Reserved2
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * Indicates the relative read throughput associated with this power state.
     * 
     * The value in this field should be less than the number of supported power states. For example, if the controller supports 16 power states, then the valid values for this field are 0 through 15. A lower value indicates a higher read throughput.
     * @type {Integer}
     */
    RRT {
        get => (this._bitfield2 >> 0) & 0x1F
        set => this._bitfield2 := ((value & 0x1F) << 0) | (this._bitfield2 & ~(0x1F << 0))
    }

    /**
     * Bits 101:103 are reserved.
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield2 >> 5) & 0x7
        set => this._bitfield2 := ((value & 0x7) << 5) | (this._bitfield2 & ~(0x7 << 5))
    }

    /**
     * This bitfield backs the following members:
     * - RRL
     * - Reserved3
     * @type {Integer}
     */
    _bitfield3 {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * Indicates the relative read latency associated with this power state.
     * 
     * The value in this field should be less than the number of supported power states. For example, if the controller supports 16 power states, then the valid values for this field are 0 through 15. A lower value indicates a lower read latency.
     * @type {Integer}
     */
    RRL {
        get => (this._bitfield3 >> 0) & 0x1F
        set => this._bitfield3 := ((value & 0x1F) << 0) | (this._bitfield3 & ~(0x1F << 0))
    }

    /**
     * Bits 109:111 are reserved.
     * @type {Integer}
     */
    Reserved3 {
        get => (this._bitfield3 >> 5) & 0x7
        set => this._bitfield3 := ((value & 0x7) << 5) | (this._bitfield3 & ~(0x7 << 5))
    }

    /**
     * This bitfield backs the following members:
     * - RWT
     * - Reserved4
     * @type {Integer}
     */
    _bitfield4 {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * Indicates the relative write throughput associated with this power state.
     * 
     * The value in this field should be less than the number of supported power states. For example, if the controller supports 16 power states, then the valid values for this field are 0 through 15. A lower value indicates a higher write throughput.
     * @type {Integer}
     */
    RWT {
        get => (this._bitfield4 >> 0) & 0x1F
        set => this._bitfield4 := ((value & 0x1F) << 0) | (this._bitfield4 & ~(0x1F << 0))
    }

    /**
     * Bits 117:119 are reserved.
     * @type {Integer}
     */
    Reserved4 {
        get => (this._bitfield4 >> 5) & 0x7
        set => this._bitfield4 := ((value & 0x7) << 5) | (this._bitfield4 & ~(0x7 << 5))
    }

    /**
     * This bitfield backs the following members:
     * - RWL
     * - Reserved5
     * @type {Integer}
     */
    _bitfield5 {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * Indicates the relative write latency associated with this power state. 
     * 
     * The value in this field should be less than the number of supported power states. For example, if the controller supports 16 power states, then the valid values for this field are 0 through 15. A lower value indicates a lower write latency.
     * @type {Integer}
     */
    RWL {
        get => (this._bitfield5 >> 0) & 0x1F
        set => this._bitfield5 := ((value & 0x1F) << 0) | (this._bitfield5 & ~(0x1F << 0))
    }

    /**
     * Bits 125:127 are reserved.
     * @type {Integer}
     */
    Reserved5 {
        get => (this._bitfield5 >> 5) & 0x7
        set => this._bitfield5 := ((value & 0x7) << 5) | (this._bitfield5 & ~(0x7 << 5))
    }

    /**
     * Indicates the typical power consumed by the NVM subsystem over 30 seconds in this power state when idle (for instance, there are no pending commands, register
     * accesses, or background processes).
     * 
     * The measurement starts after the NVM subsystem has been idle for 10 seconds. The power in Watts is equal to the value in this field multiplied by the scale indicated in the Idle Power Scale (**IPS**) field. A value of `0000h` indicates Idle Power is not reported.
     * @type {Integer}
     */
    IDLP {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * This bitfield backs the following members:
     * - Reserved6
     * - IPS
     * @type {Integer}
     */
    _bitfield6 {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * Bits 144:149 are reserved.
     * @type {Integer}
     */
    Reserved6 {
        get => (this._bitfield6 >> 0) & 0x3F
        set => this._bitfield6 := ((value & 0x3F) << 0) | (this._bitfield6 & ~(0x3F << 0))
    }

    /**
     * This field indicates the scale for the Idle Power (**IDLP**) field.
     * 
     * The **IPS** field uses the following values:
     * 
     * | Value | Definition                         |
     * |-------|------------------------------------|
     * | 00b   | Not reported for this power state. |
     * | 01b   | 0.0001 W                           |
     * | 10b   | 0.01 W                             |
     * | 11b   | Reserved                           |
     * @type {Integer}
     */
    IPS {
        get => (this._bitfield6 >> 6) & 0x3
        set => this._bitfield6 := ((value & 0x3) << 6) | (this._bitfield6 & ~(0x3 << 6))
    }

    /**
     * Bits 152:159 are reserved.
     * @type {Integer}
     */
    Reserved7 {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }

    /**
     * Indicates the largest average power consumed by the NVM subsystem over a 10 second period in this power state with the workload indicated in the Active
     * Power Workload (**APW**) field.
     * 
     * The power in Watts is equal to the value in this field multiplied by the scale indicated in the Active Power Scale (**APS**) field. A value of `0000h` indicates Active Power is not reported.
     * @type {Integer}
     */
    ACTP {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * This bitfield backs the following members:
     * - APW
     * - Reserved8
     * - APS
     * @type {Integer}
     */
    _bitfield7 {
        get => NumGet(this, 22, "char")
        set => NumPut("char", value, this, 22)
    }

    /**
     * Indicates the workload used to calculate maximum power for this power state.
     * 
     * The **APW** field uses the following values:
     * 
     * | Value | Definition                                                                                             |
     * |-------|--------------------------------------------------------------------------------------------------------|
     * | 00b   | No Workload. The workload is unknown or not provided.                                                  |
     * | 01b   | Workload #1. Extended Idle Period with a Burst of Random Writes. Workload #1 consists of five (5) minutes of idle followed by thirty-two (32) random write commands of size 1MB submitted to a single controller while all other controllers in the NVM subsystem are idle, and then thirty (30) seconds of idle.                                                                                                            |
     * | 10b   | Workload #2: Heavy Sequential Writes. Workload #2 consists of 80,000 sequential write commands of size 128KB submitted to a single controller while all other controllers in the NVM subsystem are idle. The submission queue(s) should be sufficiently large allowing the host to ensure there are multiple commands pending at all times during the workload.                                                                                |
     * | 11b   | Reserved                                                                                               |
     * 
     * This field will not have a value of **No Workload** unless **ACTP** is `0000h`.
     * @type {Integer}
     */
    APW {
        get => (this._bitfield7 >> 0) & 0x7
        set => this._bitfield7 := ((value & 0x7) << 0) | (this._bitfield7 & ~(0x7 << 0))
    }

    /**
     * Bits 179:181 are reserved.
     * @type {Integer}
     */
    Reserved8 {
        get => (this._bitfield7 >> 3) & 0x7
        set => this._bitfield7 := ((value & 0x7) << 3) | (this._bitfield7 & ~(0x7 << 3))
    }

    /**
     * Indicates the scale for the Active Power (**ACTP**) field. If an Active Power Workload (**APW**) is reported for a power state, then the Active Power Scale (**APS**) will also be reported for that power state.
     * 
     * The **APS** field uses the following values:
     * 
     * | Value | Definition                         |
     * |-------|------------------------------------|
     * | 00b   | Not reported for this power state. |
     * | 01b   | 0.0001 W                           |
     * | 10b   | 0.01 W                             |
     * | 11b   | Reserved                           |
     * @type {Integer}
     */
    APS {
        get => (this._bitfield7 >> 6) & 0x3
        set => this._bitfield7 := ((value & 0x3) << 6) | (this._bitfield7 & ~(0x3 << 6))
    }

    /**
     * Bits 184:255 are reserved.
     * @type {Array<Byte>}
     */
    Reserved9{
        get {
            if(!this.HasProp("__Reserved9ProxyArray"))
                this.__Reserved9ProxyArray := Win32FixedArray(this.ptr + 23, 9, Primitive, "char")
            return this.__Reserved9ProxyArray
        }
    }
}
