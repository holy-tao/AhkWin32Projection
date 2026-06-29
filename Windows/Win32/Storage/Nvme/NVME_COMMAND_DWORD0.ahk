#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters that are common for all Admin commands and NVM commands.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_command_dword0
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_COMMAND_DWORD0 {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - OPC
     * - FUSE
     * - Reserved0
     * - PSDT
     * - CID
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    OPC {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    FUSE {
        get => (this._bitfield >> 8) & 0x3
        set => this._bitfield := ((value & 0x3) << 8) | (this._bitfield & ~(0x3 << 8))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 10) & 0xF
        set => this._bitfield := ((value & 0xF) << 10) | (this._bitfield & ~(0xF << 10))
    }

    /**
     * @type {Integer}
     */
    PSDT {
        get => (this._bitfield >> 14) & 0x3
        set => this._bitfield := ((value & 0x3) << 14) | (this._bitfield & ~(0x3 << 14))
    }

    /**
     * @type {Integer}
     */
    CID {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
