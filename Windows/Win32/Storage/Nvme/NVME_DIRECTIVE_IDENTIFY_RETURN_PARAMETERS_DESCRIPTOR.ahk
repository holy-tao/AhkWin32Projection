#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that describe return parameters for the Identify Directive.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_directive_identify_return_parameters_descriptor
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - Identify
     * - Streams
     * - Reserved0
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Identify {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Streams {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 2) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 2) | (this._bitfield & ~(0x3F << 2))
    }
    Reserved1 : Int8[31]

}
