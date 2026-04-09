#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a set of flags that indicate the offload capabilities for an IP interface.
 * @remarks
 * The <b>NL_INTERFACE_OFFLOAD_ROD</b> structure is defined on Windows Vista and later.
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ns-nldef-nl_interface_offload_rod
 * @namespace Windows.Win32.Networking.WinSock
 */
class NL_INTERFACE_OFFLOAD_ROD extends Win32Struct {
    static sizeof => 1

    static packingSize => 1

    /**
     * This bitfield backs the following members:
     * - NlChecksumSupported
     * - NlOptionsSupported
     * - TlDatagramChecksumSupported
     * - TlStreamChecksumSupported
     * - TlStreamOptionsSupported
     * - FastPathCompatible
     * - TlLargeSendOffloadSupported
     * - TlGiantSendOffloadSupported
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NlChecksumSupported {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    NlOptionsSupported {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    TlDatagramChecksumSupported {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    TlStreamChecksumSupported {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    TlStreamOptionsSupported {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    FastPathCompatible {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    TlLargeSendOffloadSupported {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    TlGiantSendOffloadSupported {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
}
