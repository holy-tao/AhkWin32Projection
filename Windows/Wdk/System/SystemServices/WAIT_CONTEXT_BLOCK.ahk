#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\KDPC.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WAIT_CONTEXT_BLOCK extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    WaitQueueEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    DmaWaitEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumberOfChannels {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * This bitfield backs the following members:
     * - SyncCallback
     * - DmaContext
     * - ZeroMapRegisters
     * - Reserved
     * - NumberOfRemapPages
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    SyncCallback {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    DmaContext {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    ZeroMapRegisters {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    NumberOfRemapPages {
        get => (this._bitfield >> 12) & 0xFFFFF
        set => this._bitfield := ((value & 0xFFFFF) << 12) | (this._bitfield & ~(0xFFFFF << 12))
    }

    /**
     * @type {Pointer<DRIVER_CONTROL>}
     */
    DeviceRoutine {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    DeviceContext {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    NumberOfMapRegisters {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Void>}
     */
    DeviceObject {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Void>}
     */
    CurrentIrp {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<KDPC>}
     */
    BufferChainingDpc {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
