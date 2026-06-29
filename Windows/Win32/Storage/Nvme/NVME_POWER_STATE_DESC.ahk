#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains fields that describe the attributes of each power state.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_power_state_desc
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_POWER_STATE_DESC {
    #StructPack 4

    /**
     * Indicates the maximum power consumed by the NVM subsystem in this power state.
     * 
     * The power in Watts is equal to the value in this field multiplied by the scale specified in the Max Power Scale (**MPS**) field.
     */
    MP : UInt16

    /**
     * Bits 16:23 are reserved.
     */
    Reserved0 : Int8

    /**
     * This bitfield backs the following members:
     * - MPS
     * - NOPS
     * - Reserved1
     */
    _bitfield1 : Int8


    /**
     * @type {Integer}
     */
    MPS {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    NOPS {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield1 >> 2) & 0x3F
        set => this._bitfield1 := ((value & 0x3F) << 2) | (this._bitfield1 & ~(0x3F << 2))
    }
    /**
     * Indicates the maximum entry latency in microseconds associated with entering this power state.
     */
    ENLAT : UInt32

    /**
     * Indicates the maximum exit latency in microseconds associated with exiting this power state.
     */
    EXLAT : UInt32

    /**
     * This bitfield backs the following members:
     * - RRT
     * - Reserved2
     */
    _bitfield2 : Int8


    /**
     * @type {Integer}
     */
    RRT {
        get => (this._bitfield2 >> 0) & 0x1F
        set => this._bitfield2 := ((value & 0x1F) << 0) | (this._bitfield2 & ~(0x1F << 0))
    }

    /**
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
     */
    _bitfield3 : Int8


    /**
     * @type {Integer}
     */
    RRL {
        get => (this._bitfield3 >> 0) & 0x1F
        set => this._bitfield3 := ((value & 0x1F) << 0) | (this._bitfield3 & ~(0x1F << 0))
    }

    /**
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
     */
    _bitfield4 : Int8


    /**
     * @type {Integer}
     */
    RWT {
        get => (this._bitfield4 >> 0) & 0x1F
        set => this._bitfield4 := ((value & 0x1F) << 0) | (this._bitfield4 & ~(0x1F << 0))
    }

    /**
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
     */
    _bitfield5 : Int8


    /**
     * @type {Integer}
     */
    RWL {
        get => (this._bitfield5 >> 0) & 0x1F
        set => this._bitfield5 := ((value & 0x1F) << 0) | (this._bitfield5 & ~(0x1F << 0))
    }

    /**
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
     */
    IDLP : UInt16

    /**
     * This bitfield backs the following members:
     * - Reserved6
     * - IPS
     */
    _bitfield6 : Int8


    /**
     * @type {Integer}
     */
    Reserved6 {
        get => (this._bitfield6 >> 0) & 0x3F
        set => this._bitfield6 := ((value & 0x3F) << 0) | (this._bitfield6 & ~(0x3F << 0))
    }

    /**
     * @type {Integer}
     */
    IPS {
        get => (this._bitfield6 >> 6) & 0x3
        set => this._bitfield6 := ((value & 0x3) << 6) | (this._bitfield6 & ~(0x3 << 6))
    }
    /**
     * Bits 152:159 are reserved.
     */
    Reserved7 : Int8

    /**
     * Indicates the largest average power consumed by the NVM subsystem over a 10 second period in this power state with the workload indicated in the Active
     * Power Workload (**APW**) field.
     * 
     * The power in Watts is equal to the value in this field multiplied by the scale indicated in the Active Power Scale (**APS**) field. A value of `0000h` indicates Active Power is not reported.
     */
    ACTP : UInt16

    /**
     * This bitfield backs the following members:
     * - APW
     * - Reserved8
     * - APS
     */
    _bitfield7 : Int8


    /**
     * @type {Integer}
     */
    APW {
        get => (this._bitfield7 >> 0) & 0x7
        set => this._bitfield7 := ((value & 0x7) << 0) | (this._bitfield7 & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved8 {
        get => (this._bitfield7 >> 3) & 0x7
        set => this._bitfield7 := ((value & 0x7) << 3) | (this._bitfield7 & ~(0x7 << 3))
    }

    /**
     * @type {Integer}
     */
    APS {
        get => (this._bitfield7 >> 6) & 0x3
        set => this._bitfield7 := ((value & 0x3) << 6) | (this._bitfield7 & ~(0x3 << 6))
    }
    /**
     * Bits 184:255 are reserved.
     */
    Reserved9 : Int8[9]

}
