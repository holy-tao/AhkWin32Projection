#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\KDPC.ahk" { KDPC }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WAIT_CONTEXT_BLOCK {
    #StructPack 8

    WaitQueueEntry : IntPtr

    NumberOfChannels : UInt32

    /**
     * This bitfield backs the following members:
     * - SyncCallback
     * - DmaContext
     * - ZeroMapRegisters
     * - Reserved
     * - NumberOfRemapPages
     */
    _bitfield : Int32


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
    DeviceRoutine : IntPtr

    DeviceContext : IntPtr

    NumberOfMapRegisters : UInt32

    DeviceObject : IntPtr

    CurrentIrp : IntPtr

    BufferChainingDpc : KDPC.Ptr

    static __New() {
        DefineProp(this.Prototype, 'DmaWaitEntry', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
