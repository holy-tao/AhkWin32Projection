#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

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
    PtpV2OverUdpIPv4EventMsgReceiveHw{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv4EventMsgReceiveHw"))
                this.__PtpV2OverUdpIPv4EventMsgReceiveHw := BOOLEAN(this.ptr + 0)
            return this.__PtpV2OverUdpIPv4EventMsgReceiveHw
        }
    }

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv4AllMsgReceiveHw{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv4AllMsgReceiveHw"))
                this.__PtpV2OverUdpIPv4AllMsgReceiveHw := BOOLEAN(this.ptr + 1)
            return this.__PtpV2OverUdpIPv4AllMsgReceiveHw
        }
    }

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv4EventMsgTransmitHw{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv4EventMsgTransmitHw"))
                this.__PtpV2OverUdpIPv4EventMsgTransmitHw := BOOLEAN(this.ptr + 2)
            return this.__PtpV2OverUdpIPv4EventMsgTransmitHw
        }
    }

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv4AllMsgTransmitHw{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv4AllMsgTransmitHw"))
                this.__PtpV2OverUdpIPv4AllMsgTransmitHw := BOOLEAN(this.ptr + 3)
            return this.__PtpV2OverUdpIPv4AllMsgTransmitHw
        }
    }

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6EventMsgReceiveHw{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv6EventMsgReceiveHw"))
                this.__PtpV2OverUdpIPv6EventMsgReceiveHw := BOOLEAN(this.ptr + 4)
            return this.__PtpV2OverUdpIPv6EventMsgReceiveHw
        }
    }

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6AllMsgReceiveHw{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv6AllMsgReceiveHw"))
                this.__PtpV2OverUdpIPv6AllMsgReceiveHw := BOOLEAN(this.ptr + 5)
            return this.__PtpV2OverUdpIPv6AllMsgReceiveHw
        }
    }

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6EventMsgTransmitHw{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv6EventMsgTransmitHw"))
                this.__PtpV2OverUdpIPv6EventMsgTransmitHw := BOOLEAN(this.ptr + 6)
            return this.__PtpV2OverUdpIPv6EventMsgTransmitHw
        }
    }

    /**
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6AllMsgTransmitHw{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv6AllMsgTransmitHw"))
                this.__PtpV2OverUdpIPv6AllMsgTransmitHw := BOOLEAN(this.ptr + 7)
            return this.__PtpV2OverUdpIPv6AllMsgTransmitHw
        }
    }

    /**
     * @type {BOOLEAN}
     */
    AllReceiveHw{
        get {
            if(!this.HasProp("__AllReceiveHw"))
                this.__AllReceiveHw := BOOLEAN(this.ptr + 8)
            return this.__AllReceiveHw
        }
    }

    /**
     * @type {BOOLEAN}
     */
    AllTransmitHw{
        get {
            if(!this.HasProp("__AllTransmitHw"))
                this.__AllTransmitHw := BOOLEAN(this.ptr + 9)
            return this.__AllTransmitHw
        }
    }

    /**
     * @type {BOOLEAN}
     */
    TaggedTransmitHw{
        get {
            if(!this.HasProp("__TaggedTransmitHw"))
                this.__TaggedTransmitHw := BOOLEAN(this.ptr + 10)
            return this.__TaggedTransmitHw
        }
    }

    /**
     * @type {BOOLEAN}
     */
    AllReceiveSw{
        get {
            if(!this.HasProp("__AllReceiveSw"))
                this.__AllReceiveSw := BOOLEAN(this.ptr + 11)
            return this.__AllReceiveSw
        }
    }

    /**
     * @type {BOOLEAN}
     */
    AllTransmitSw{
        get {
            if(!this.HasProp("__AllTransmitSw"))
                this.__AllTransmitSw := BOOLEAN(this.ptr + 12)
            return this.__AllTransmitSw
        }
    }

    /**
     * @type {BOOLEAN}
     */
    TaggedTransmitSw{
        get {
            if(!this.HasProp("__TaggedTransmitSw"))
                this.__TaggedTransmitSw := BOOLEAN(this.ptr + 13)
            return this.__TaggedTransmitSw
        }
    }
}
