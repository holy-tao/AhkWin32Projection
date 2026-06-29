#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Write Atomicity Normal Feature that controls the operation of the Atomic Write Unit Normal (**AWUN**) and Namespace Atomic Write Unit Normal (**NAWUN**) parameters that define the controller’s support for atomic operations.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_feature_write_atomicity_normal
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_WRITE_ATOMICITY_NORMAL {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - DN
     * - Reserved0
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    DN {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 1) & 0x7FFFFFFF
        set => this._bitfield := ((value & 0x7FFFFFFF) << 1) | (this._bitfield & ~(0x7FFFFFFF << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
