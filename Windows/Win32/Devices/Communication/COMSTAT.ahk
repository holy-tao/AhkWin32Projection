#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a communications device.
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-comstat
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class COMSTAT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

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
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If this member is <b>TRUE</b>, transmission is waiting for the CTS (clear-to-send) signal to be sent.
     * @type {Integer}
     */
    fCtsHold {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * If this member is <b>TRUE</b>, transmission is waiting for the DSR (data-set-ready) signal to be sent.
     * @type {Integer}
     */
    fDsrHold {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * If this member is <b>TRUE</b>, transmission is waiting for the RLSD (receive-line-signal-detect) signal to be sent.
     * @type {Integer}
     */
    fRlsdHold {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * If this member is <b>TRUE</b>, transmission is waiting because the XOFF character was received.
     * @type {Integer}
     */
    fXoffHold {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * If this member is <b>TRUE</b>, transmission is waiting because the XOFF character was transmitted. (Transmission halts when the XOFF character is transmitted to a system that takes the next character as XON, regardless of the actual character.)
     * @type {Integer}
     */
    fXoffSent {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * If this member is <b>TRUE</b>, the end-of-file (EOF) character has been received.
     * @type {Integer}
     */
    fEof {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * If this member is <b>TRUE</b>, there is a character queued for transmission that has come to the communications device by way of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-transmitcommchar">TransmitCommChar</a> function. The communications device transmits such a character ahead of other characters in the device's output buffer.
     * @type {Integer}
     */
    fTxim {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    fReserved {
        get => (this._bitfield >> 7) & 0x1FFFFFF
        set => this._bitfield := ((value & 0x1FFFFFF) << 7) | (this._bitfield & ~(0x1FFFFFF << 7))
    }

    /**
     * The number of bytes received by the serial provider but not yet read by a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> operation.
     * @type {Integer}
     */
    cbInQue {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of bytes of user data remaining to be transmitted for all write operations. This value will be zero for a nonoverlapped write.
     * @type {Integer}
     */
    cbOutQue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
