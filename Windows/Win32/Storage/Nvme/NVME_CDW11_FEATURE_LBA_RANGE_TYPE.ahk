#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a parameter that specifies the number of LBA ranges for the LBA Range Type Feature in the Set Features command.
 * @remarks
 * LBA range information may be used by a driver to determine if it may utilize a particular LBA range; the information is not exposed to higher level software.
 * 
 * This is optional information that is not required for proper behavior of the system. However, it may be utilized to avoid unintended software issues. For example, if the LBA range indicates that it is a RAID volume then a driver that does not have RAID functionality should not utilize that LBA range (including not overwriting the LBA range). The optional information may be utilized by the driver to determine whether the LBA Range should be exposed to higher level software.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_feature_lba_range_type
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_LBA_RANGE_TYPE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - NUM
     * - Reserved0
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    NUM {
        get => (this._bitfield >> 0) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 0) | (this._bitfield & ~(0x3F << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 6) & 0x3FFFFFF
        set => this._bitfield := ((value & 0x3FFFFFF) << 6) | (this._bitfield & ~(0x3FFFFFF << 6))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
