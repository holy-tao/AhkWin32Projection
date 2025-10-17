#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
    PtpV2OverUdpIPv4EventMessageReceive {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that, during packet reception, the NIC can recognize in hardware any PTP version 2 message (not just PTP event messages) contained in an IPv4 UDP packet, and can generate a timestamp in hardware corresponding to when such a packet was received. A value of **FALSE** indicates that the hardware is not capable of this.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv4AllMessageReceive {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that, during packet transmission, the NIC can recognize in hardware a PTP version 2 event message contained in an IPv4 UDP packet, and can generate a timestamp in hardware corresponding to when such a packet was transmitted. A value of **FALSE** indicates that the hardware is not capable of this.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv4EventMessageTransmit {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that, during packet transmission, the NIC can recognize in hardware any PTP version 2 message (not just PTP event messages) contained in an IPv4 UDP packet, and can generate a timestamp in hardware corresponding to when such a packet was transmitted. A value of **FALSE** indicates that the hardware is not capable of this.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv4AllMessageTransmit {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * The same as *PtpV2OverUdpIPv4EventMsgReceiveHw*, except that it applies to IPv6.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6EventMessageReceive {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * The same as *PtpV2OverUdpIPv4AllMsgReceiveHw*, except that it applies to IPv6.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6AllMessageReceive {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * The same as *PtpV2OverUdpIPv4EventMsgTransmitHw*, except that it applies to IPv6.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6EventMessageTransmit {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * The same as *PtpV2OverUdpIPv4AllMsgTransmitHw*, except that it applies to IPv6.
     * @type {BOOLEAN}
     */
    PtpV2OverUdpIPv6AllMessageTransmit {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that the NIC can generate a hardware timestamp for all received packets (that is, not just PTP). A value of **FALSE** indicates that the hardware is not capable of this.
     * @type {BOOLEAN}
     */
    AllReceive {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that the NIC can generate a hardware timestamp for all transmitted packets (that is, not just PTP). A value of **FALSE** indicates that the hardware is not capable of this.
     * @type {BOOLEAN}
     */
    AllTransmit {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** indicates that the NIC can generate a hardware timestamp for any specific transmitted packet when indicated to do so by the application. A value of **FALSE** indicates that the hardware is not capable of this.
     * See [**TIMESTAMPING_CONFIG**](/windows/win32/api/mstcpip/ns-mstcpip-timestamping_config) (and **TIMESTAMPING_FLAG_TX**) to determine how to request a timestamp when sending UDP packets through [Windows Sockets](/windows/win32/winsock/windows-sockets-start-page-2).
     * @type {BOOLEAN}
     */
    TaggedTransmit {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }
}
