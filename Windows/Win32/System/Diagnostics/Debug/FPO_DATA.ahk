#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the stack frame layout for a function on an x86 computer when frame pointer omission (FPO) optimization is used. The structure is used to locate the base of the call frame.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-fpo_data
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct FPO_DATA {
    #StructPack 4

    /**
     * The offset of the first byte of the function code.
     */
    ulOffStart : UInt32

    /**
     * The number of bytes in the function.
     */
    cbProcSize : UInt32

    /**
     * The number of local variables.
     */
    cdwLocals : UInt32

    /**
     * The size of the parameters, in <b>DWORD</b>s.
     */
    cdwParams : UInt16

    /**
     * This bitfield backs the following members:
     * - cbProlog
     * - cbRegs
     * - fHasSEH
     * - fUseBP
     * - reserved
     * - cbFrame
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    cbProlog {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    cbRegs {
        get => (this._bitfield >> 8) & 0x7
        set => this._bitfield := ((value & 0x7) << 8) | (this._bitfield & ~(0x7 << 8))
    }

    /**
     * @type {Integer}
     */
    fHasSEH {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * @type {Integer}
     */
    fUseBP {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * @type {Integer}
     */
    cbFrame {
        get => (this._bitfield >> 14) & 0x3
        set => this._bitfield := ((value & 0x3) << 14) | (this._bitfield & ~(0x3 << 14))
    }
}
