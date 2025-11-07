#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a set of flags that indicate the offload capabilities for an IP interface.
 * @remarks
 * 
 * The <b>NL_INTERFACE_OFFLOAD_ROD</b> structure is defined on Windows Vista and later.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//nldef/ns-nldef-nl_interface_offload_rod
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_INTERFACE_OFFLOAD_ROD extends Win32Struct
{
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
     * Type: <b>BOOLEAN</b>
     * 
     * The network adapter for this network interface supports the offload of IP checksum calculations.
     * @type {Integer}
     */
    NlChecksumSupported {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * The network adapter for this network interface supports the offload of IP checksum calculations for IPv4 packets with IP options.
     * @type {Integer}
     */
    NlOptionsSupported {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * The network adapter for this network interface supports the offload of UDP checksum calculations.
     * @type {Integer}
     */
    TlDatagramChecksumSupported {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * The network adapter for this network interface supports the offload of TCP checksum calculations.
     * @type {Integer}
     */
    TlStreamChecksumSupported {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * The network adapter for this network interface supports the offload of TCP checksum calculations for IPv4 packets containing IP options.
     * @type {Integer}
     */
    TlStreamOptionsSupported {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * Reserved for internal use.
     * @type {Integer}
     */
    FastPathCompatible {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * The network adapter for this network interface supports TCP Large Send Offload Version 1. With this capability, TCP can pass a buffer to be transmitted that is bigger than the maximum transmission unit (MTU) supported by the medium.  Version 1 allows TCP to pass a buffer up to 64K to be transmitted.
     * @type {Integer}
     */
    TlLargeSendOffloadSupported {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * The network adapter for this network interface supports TCP Large Send Offload Version 2. With this capability, TCP can pass a buffer to be transmitted that is bigger than the maximum transmission unit (MTU) supported by the medium.  Version 2 allows TCP to pass a buffer up to 256K to be transmitted.
     * @type {Integer}
     */
    TlGiantSendOffloadSupported {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
}
