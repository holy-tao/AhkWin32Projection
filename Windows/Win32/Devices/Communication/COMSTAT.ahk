#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a communications device.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-comstat
 * @namespace Windows.Win32.Devices.Communication
 */
export default struct COMSTAT {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - fCtsHold
     * - fDsrHold
     * - fRlsdHold
     * - fXoffHold
     * - fXoffSent
     * - fEof
     * - fTxim
     * - fReserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    fCtsHold {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    fDsrHold {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    fRlsdHold {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    fXoffHold {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    fXoffSent {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    fEof {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    fTxim {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    fReserved {
        get => (this._bitfield >> 7) & 0x1FFFFFF
        set => this._bitfield := ((value & 0x1FFFFFF) << 7) | (this._bitfield & ~(0x1FFFFFF << 7))
    }
    /**
     * The number of bytes received by the serial provider but not yet read by a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> operation.
     */
    cbInQue : UInt32

    /**
     * The number of bytes of user data remaining to be transmitted for all write operations. This value will be zero for a nonoverlapped write.
     */
    cbOutQue : UInt32

}
