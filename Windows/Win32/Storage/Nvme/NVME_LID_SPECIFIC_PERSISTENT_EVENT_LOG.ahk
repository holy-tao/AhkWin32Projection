#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_LID_SPECIFIC_PERSISTENT_EVENT_LOG {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - EstablishContextAndRead512BytesOfHeaderSupported
     * - Reserved
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    EstablishContextAndRead512BytesOfHeaderSupported {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
}
