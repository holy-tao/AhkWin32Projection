#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Describes the timestamping capabilities of a network interface card's (NIC's) hardware.
 * @remarks
 * 
  * All of the **INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES** structure's members represent hardware timestamp capabilities. The hardware timestamps are generated using the NIC's hardware clock.
  * 
  * Having both hardware and software timestamps enabled together isn't supported.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/ns-iphlpapi-interface_hardware_timestamp_capabilities
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES extends Win32Struct
{
    static sizeof => 11

    static packingSize => 1

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that, during packet reception, the NIC can recognize in hardware a PTP version 2 event message contained in an IPv4 UDP packet, and can generate a timestamp in hardware corresponding to when such a packet was received. A value of **FALSE** indicates that the hardware is not capable of this.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv4EventMessageReceive{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv4EventMessageReceive"))
                this.__PtpV2OverUdpIPv4EventMessageReceive := BOOLEAN(this.ptr + 0)
            return this.__PtpV2OverUdpIPv4EventMessageReceive
        }
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that, during packet reception, the NIC can recognize in hardware any PTP version 2 message (not just PTP event messages) contained in an IPv4 UDP packet, and can generate a timestamp in hardware corresponding to when such a packet was received. A value of **FALSE** indicates that the hardware is not capable of this.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv4AllMessageReceive{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv4AllMessageReceive"))
                this.__PtpV2OverUdpIPv4AllMessageReceive := BOOLEAN(this.ptr + 1)
            return this.__PtpV2OverUdpIPv4AllMessageReceive
        }
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that, during packet transmission, the NIC can recognize in hardware a PTP version 2 event message contained in an IPv4 UDP packet, and can generate a timestamp in hardware corresponding to when such a packet was transmitted. A value of **FALSE** indicates that the hardware is not capable of this.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv4EventMessageTransmit{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv4EventMessageTransmit"))
                this.__PtpV2OverUdpIPv4EventMessageTransmit := BOOLEAN(this.ptr + 2)
            return this.__PtpV2OverUdpIPv4EventMessageTransmit
        }
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that, during packet transmission, the NIC can recognize in hardware any PTP version 2 message (not just PTP event messages) contained in an IPv4 UDP packet, and can generate a timestamp in hardware corresponding to when such a packet was transmitted. A value of **FALSE** indicates that the hardware is not capable of this.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv4AllMessageTransmit{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv4AllMessageTransmit"))
                this.__PtpV2OverUdpIPv4AllMessageTransmit := BOOLEAN(this.ptr + 3)
            return this.__PtpV2OverUdpIPv4AllMessageTransmit
        }
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * The same as *PtpV2OverUdpIPv4EventMsgReceiveHw*, except that it applies to IPv6.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6EventMessageReceive{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv6EventMessageReceive"))
                this.__PtpV2OverUdpIPv6EventMessageReceive := BOOLEAN(this.ptr + 4)
            return this.__PtpV2OverUdpIPv6EventMessageReceive
        }
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * The same as *PtpV2OverUdpIPv4AllMsgReceiveHw*, except that it applies to IPv6.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6AllMessageReceive{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv6AllMessageReceive"))
                this.__PtpV2OverUdpIPv6AllMessageReceive := BOOLEAN(this.ptr + 5)
            return this.__PtpV2OverUdpIPv6AllMessageReceive
        }
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * The same as *PtpV2OverUdpIPv4EventMsgTransmitHw*, except that it applies to IPv6.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6EventMessageTransmit{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv6EventMessageTransmit"))
                this.__PtpV2OverUdpIPv6EventMessageTransmit := BOOLEAN(this.ptr + 6)
            return this.__PtpV2OverUdpIPv6EventMessageTransmit
        }
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * The same as *PtpV2OverUdpIPv4AllMsgTransmitHw*, except that it applies to IPv6.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6AllMessageTransmit{
        get {
            if(!this.HasProp("__PtpV2OverUdpIPv6AllMessageTransmit"))
                this.__PtpV2OverUdpIPv6AllMessageTransmit := BOOLEAN(this.ptr + 7)
            return this.__PtpV2OverUdpIPv6AllMessageTransmit
        }
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that the NIC can generate a hardware timestamp for all received packets (that is, not just PTP). A value of **FALSE** indicates that the hardware is not capable of this.
     * @type {BOOLEAN}
     */
    AllReceive{
        get {
            if(!this.HasProp("__AllReceive"))
                this.__AllReceive := BOOLEAN(this.ptr + 8)
            return this.__AllReceive
        }
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that the NIC can generate a hardware timestamp for all transmitted packets (that is, not just PTP). A value of **FALSE** indicates that the hardware is not capable of this.
     * @type {BOOLEAN}
     */
    AllTransmit{
        get {
            if(!this.HasProp("__AllTransmit"))
                this.__AllTransmit := BOOLEAN(this.ptr + 9)
            return this.__AllTransmit
        }
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that the NIC can generate a hardware timestamp for any specific transmitted packet when indicated to do so by the application. A value of **FALSE** indicates that the hardware is not capable of this.
     * See [**TIMESTAMPING_CONFIG**](/windows/win32/api/mstcpip/ns-mstcpip-timestamping_config) (and **TIMESTAMPING_FLAG_TX**) to determine how to request a timestamp when sending UDP packets through [Windows Sockets](/windows/win32/winsock/windows-sockets-start-page-2).
     * @type {BOOLEAN}
     */
    TaggedTransmit{
        get {
            if(!this.HasProp("__TaggedTransmit"))
                this.__TaggedTransmit := BOOLEAN(this.ptr + 10)
            return this.__TaggedTransmit
        }
    }
}
