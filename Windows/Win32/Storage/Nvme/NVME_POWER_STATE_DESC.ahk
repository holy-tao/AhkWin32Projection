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
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
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
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    _bitfield3 {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * @type {Integer}
     */
    _bitfield4 {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    _bitfield5 {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
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
     * @type {Integer}
     */
    _bitfield6 {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
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
     * @type {Integer}
     */
    _bitfield7 {
        get => NumGet(this, 22, "char")
        set => NumPut("char", value, this, 22)
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
