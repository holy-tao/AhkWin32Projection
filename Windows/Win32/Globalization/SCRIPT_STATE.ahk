#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains script state information.
 * @remarks
 * This structure is used to initialize the Unicode algorithm state as an input to <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemize">ScriptItemize</a>. It is also used as a component of the analysis retrieved by <b>ScriptItemize</b>.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_state
 * @namespace Windows.Win32.Globalization
 */
class SCRIPT_STATE extends Win32Struct {
    static sizeof => 2

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - uBidiLevel
     * - fOverrideDirection
     * - fInhibitSymSwap
     * - fCharShape
     * - fDigitSubstitute
     * - fInhibitLigate
     * - fDisplayZWG
     * - fArabicNumContext
     * - fGcpClusters
     * - fReserved
     * - fEngineReserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uBidiLevel {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    fOverrideDirection {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    fInhibitSymSwap {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    fCharShape {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    fDigitSubstitute {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    fInhibitLigate {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    fDisplayZWG {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    fArabicNumContext {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * @type {Integer}
     */
    fGcpClusters {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * @type {Integer}
     */
    fReserved {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * @type {Integer}
     */
    fEngineReserved {
        get => (this._bitfield >> 14) & 0x3
        set => this._bitfield := ((value & 0x3) << 14) | (this._bitfield & ~(0x3 << 14))
    }
}
