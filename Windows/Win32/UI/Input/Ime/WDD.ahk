#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class WDD extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    wDispPos {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wReadPos {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    wCompPos {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    cchDisp {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    cchRead {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    cchComp {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    WDD_nReserve1 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    nPos {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * This bitfield backs the following members:
     * - fPhrase
     * - fAutoCorrect
     * - fNumericPrefix
     * - fUserRegistered
     * - fUnknown
     * - fRecentUsed
     * - Anonymous3
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    fPhrase {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    fAutoCorrect {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    fNumericPrefix {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    fUserRegistered {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    fUnknown {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    fRecentUsed {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    Anonymous3 {
        get => (this._bitfield >> 6) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 6) | (this._bitfield & ~(0x3FF << 6))
    }

    /**
     * @type {Pointer<Void>}
     */
    pReserved {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
