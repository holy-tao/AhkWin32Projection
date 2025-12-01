#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The MPEG_HEADER_VERSION_BITS structure contains the first 8 bits following the TSID in an MPEG-2 PSI section. These bits contain the version number and the current/next indicator.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2bits/ns-mpeg2bits-mpeg_header_version_bits
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_HEADER_VERSION_BITS extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * This bitfield backs the following members:
     * - CurrentNextIndicator
     * - VersionNumber
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The current_next_indicator field.
     * @type {Integer}
     */
    CurrentNextIndicator {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * The version_number field.
     * @type {Integer}
     */
    VersionNumber {
        get => (this._bitfield >> 1) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 1) | (this._bitfield & ~(0x1F << 1))
    }
}
