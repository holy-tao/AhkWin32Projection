#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_CAPABILITY_REGISTER extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - PayloadSize
     * - MBDoorbellInterruptCapable
     * - BackgroundCommandCompleteInterruptCapable
     * - InterruptMessageNumber
     * - MailboxReadyTime
     * - Type
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PayloadSize {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    MBDoorbellInterruptCapable {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    BackgroundCommandCompleteInterruptCapable {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    InterruptMessageNumber {
        get => (this._bitfield >> 7) & 0xF
        set => this._bitfield := ((value & 0xF) << 7) | (this._bitfield & ~(0xF << 7))
    }

    /**
     * @type {Integer}
     */
    MailboxReadyTime {
        get => (this._bitfield >> 11) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 11) | (this._bitfield & ~(0xFF << 11))
    }

    /**
     * @type {Integer}
     */
    Type {
        get => (this._bitfield >> 19) & 0xF
        set => this._bitfield := ((value & 0xF) << 19) | (this._bitfield & ~(0xF << 19))
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
