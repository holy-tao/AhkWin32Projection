#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY_XDATA_EPILOG_SCOPE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    EpilogScopeData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - EpilogStartOffset
     * - Res0
     * - EpilogStartIndex
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    EpilogStartOffset {
        get => (this._bitfield >> 0) & 0x3FFFF
        set => this._bitfield := ((value & 0x3FFFF) << 0) | (this._bitfield & ~(0x3FFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Res0 {
        get => (this._bitfield >> 18) & 0xF
        set => this._bitfield := ((value & 0xF) << 18) | (this._bitfield & ~(0xF << 18))
    }

    /**
     * @type {Integer}
     */
    EpilogStartIndex {
        get => (this._bitfield >> 22) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 22) | (this._bitfield & ~(0x3FF << 22))
    }
}
