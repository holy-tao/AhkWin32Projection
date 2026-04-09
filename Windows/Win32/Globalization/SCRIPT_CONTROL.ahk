#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains script control flags for several Uniscribe functions, for example, ScriptItemize.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_control
 * @namespace Windows.Win32.Globalization
 */
class SCRIPT_CONTROL extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - uDefaultLanguage
     * - fContextDigits
     * - fInvertPreBoundDir
     * - fInvertPostBoundDir
     * - fLinkStringBefore
     * - fLinkStringAfter
     * - fNeutralOverride
     * - fNumericOverride
     * - fLegacyBidiClass
     * - fMergeNeutralItems
     * - fUseStandardBidi
     * - fReserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uDefaultLanguage {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    fContextDigits {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    fInvertPreBoundDir {
        get => (this._bitfield >> 17) & 0x1
        set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
    }

    /**
     * @type {Integer}
     */
    fInvertPostBoundDir {
        get => (this._bitfield >> 18) & 0x1
        set => this._bitfield := ((value & 0x1) << 18) | (this._bitfield & ~(0x1 << 18))
    }

    /**
     * @type {Integer}
     */
    fLinkStringBefore {
        get => (this._bitfield >> 19) & 0x1
        set => this._bitfield := ((value & 0x1) << 19) | (this._bitfield & ~(0x1 << 19))
    }

    /**
     * @type {Integer}
     */
    fLinkStringAfter {
        get => (this._bitfield >> 20) & 0x1
        set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
    }

    /**
     * @type {Integer}
     */
    fNeutralOverride {
        get => (this._bitfield >> 21) & 0x1
        set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
    }

    /**
     * @type {Integer}
     */
    fNumericOverride {
        get => (this._bitfield >> 22) & 0x1
        set => this._bitfield := ((value & 0x1) << 22) | (this._bitfield & ~(0x1 << 22))
    }

    /**
     * @type {Integer}
     */
    fLegacyBidiClass {
        get => (this._bitfield >> 23) & 0x1
        set => this._bitfield := ((value & 0x1) << 23) | (this._bitfield & ~(0x1 << 23))
    }

    /**
     * @type {Integer}
     */
    fMergeNeutralItems {
        get => (this._bitfield >> 24) & 0x1
        set => this._bitfield := ((value & 0x1) << 24) | (this._bitfield & ~(0x1 << 24))
    }

    /**
     * @type {Integer}
     */
    fUseStandardBidi {
        get => (this._bitfield >> 25) & 0x1
        set => this._bitfield := ((value & 0x1) << 25) | (this._bitfield & ~(0x1 << 25))
    }

    /**
     * @type {Integer}
     */
    fReserved {
        get => (this._bitfield >> 26) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 26) | (this._bitfield & ~(0x3F << 26))
    }
}
