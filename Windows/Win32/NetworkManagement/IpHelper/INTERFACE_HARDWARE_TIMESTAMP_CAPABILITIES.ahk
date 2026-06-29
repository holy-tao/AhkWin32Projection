#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Describes the timestamping capabilities of a network interface card's (NIC's) hardware.
 * @remarks
 * All of the **INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES** structure's members represent hardware timestamp capabilities. The hardware timestamps are generated using the NIC's hardware clock.
 * 
 * Having both hardware and software timestamps enabled together isn't supported.
 * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/ns-iphlpapi-interface_hardware_timestamp_capabilities
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES {
    #StructPack 1

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that, during packet reception, the NIC can recognize in hardware a PTP version 2 event message contained in an IPv4 UDP packet, and can generate a timestamp in hardware corresponding to when such a packet was received. A value of **FALSE** indicates that the hardware is not capable of this.
     */
    PtpV2OverUdpIPv4EventMessageReceive : BOOLEAN

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that, during packet reception, the NIC can recognize in hardware any PTP version 2 message (not just PTP event messages) contained in an IPv4 UDP packet, and can generate a timestamp in hardware corresponding to when such a packet was received. A value of **FALSE** indicates that the hardware is not capable of this.
     */
    PtpV2OverUdpIPv4AllMessageReceive : BOOLEAN

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that, during packet transmission, the NIC can recognize in hardware a PTP version 2 event message contained in an IPv4 UDP packet, and can generate a timestamp in hardware corresponding to when such a packet was transmitted. A value of **FALSE** indicates that the hardware is not capable of this.
     */
    PtpV2OverUdpIPv4EventMessageTransmit : BOOLEAN

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that, during packet transmission, the NIC can recognize in hardware any PTP version 2 message (not just PTP event messages) contained in an IPv4 UDP packet, and can generate a timestamp in hardware corresponding to when such a packet was transmitted. A value of **FALSE** indicates that the hardware is not capable of this.
     */
    PtpV2OverUdpIPv4AllMessageTransmit : BOOLEAN

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * The same as *PtpV2OverUdpIPv4EventMsgReceiveHw*, except that it applies to IPv6.
     */
    PtpV2OverUdpIPv6EventMessageReceive : BOOLEAN

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * The same as *PtpV2OverUdpIPv4AllMsgReceiveHw*, except that it applies to IPv6.
     */
    PtpV2OverUdpIPv6AllMessageReceive : BOOLEAN

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * The same as *PtpV2OverUdpIPv4EventMsgTransmitHw*, except that it applies to IPv6.
     */
    PtpV2OverUdpIPv6EventMessageTransmit : BOOLEAN

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * The same as *PtpV2OverUdpIPv4AllMsgTransmitHw*, except that it applies to IPv6.
     */
    PtpV2OverUdpIPv6AllMessageTransmit : BOOLEAN

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that the NIC can generate a hardware timestamp for all received packets (that is, not just PTP). A value of **FALSE** indicates that the hardware is not capable of this.
     */
    AllReceive : BOOLEAN

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that the NIC can generate a hardware timestamp for all transmitted packets (that is, not just PTP). A value of **FALSE** indicates that the hardware is not capable of this.
     */
    AllTransmit : BOOLEAN

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that the NIC can generate a hardware timestamp for any specific transmitted packet when indicated to do so by the application. A value of **FALSE** indicates that the hardware is not capable of this.
     * See [**TIMESTAMPING_CONFIG**](/windows/win32/api/mstcpip/ns-mstcpip-timestamping_config) (and **TIMESTAMPING_FLAG_TX**) to determine how to request a timestamp when sending UDP packets through [Windows Sockets](/windows/win32/winsock/windows-sockets-start-page-2).
     */
    TaggedTransmit : BOOLEAN

}
