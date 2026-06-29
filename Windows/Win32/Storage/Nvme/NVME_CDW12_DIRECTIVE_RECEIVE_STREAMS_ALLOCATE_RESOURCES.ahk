#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a parameter for requesting namespace streams that is used for allocating stream resources in the Directive Receive command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw12_directive_receive_streams_allocate_resources
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - NSR
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    NSR {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
