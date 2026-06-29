#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters that are used in the Admin commands Security Send and Security Receive.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_security_send_receive
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_SECURITY_SEND_RECEIVE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - SPSP
     * - SECP
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    SPSP {
        get => (this._bitfield >> 8) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 8) | (this._bitfield & ~(0xFFFF << 8))
    }

    /**
     * @type {Integer}
     */
    SECP {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
