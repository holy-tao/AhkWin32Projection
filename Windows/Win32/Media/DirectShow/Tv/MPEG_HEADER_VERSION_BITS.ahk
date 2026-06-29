#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MPEG_HEADER_VERSION_BITS structure contains the first 8 bits following the TSID in an MPEG-2 PSI section. These bits contain the version number and the current/next indicator.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2bits/ns-mpeg2bits-mpeg_header_version_bits
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG_HEADER_VERSION_BITS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - CurrentNextIndicator
     * - VersionNumber
     * - Reserved
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    CurrentNextIndicator {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    VersionNumber {
        get => (this._bitfield >> 1) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 1) | (this._bitfield & ~(0x1F << 1))
    }
}
