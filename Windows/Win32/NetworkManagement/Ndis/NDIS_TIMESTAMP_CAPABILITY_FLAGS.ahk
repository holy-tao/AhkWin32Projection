#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_TIMESTAMP_CAPABILITY_FLAGS extends Win32Struct
{
    static sizeof => 14

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv4EventMsgReceiveHw {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv4AllMsgReceiveHw {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv4EventMsgTransmitHw {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv4AllMsgTransmitHw {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6EventMsgReceiveHw {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6AllMsgReceiveHw {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6EventMsgTransmitHw {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6AllMsgTransmitHw {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {BOOLEAN}
     */
    AllReceiveHw {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    AllTransmitHw {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {BOOLEAN}
     */
    TaggedTransmitHw {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {BOOLEAN}
     */
    AllReceiveSw {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * @type {BOOLEAN}
     */
    AllTransmitSw {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {BOOLEAN}
     */
    TaggedTransmitSw {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }
}
