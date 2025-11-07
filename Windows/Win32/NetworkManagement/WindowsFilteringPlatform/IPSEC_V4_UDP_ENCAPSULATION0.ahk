#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores the User Datagram Protocol (UDP) encapsulation ports for Encapsulating Security Payload (ESP) encapsulation.
 * @remarks
 * 
 * This is used only when a NAT was detected as part of the IPsec NAT traversal specification.
 * 
 * <b>IPSEC_V4_UDP_ENCAPSULATION0</b> is a specific implementation of IPSEC_V4_UDP_ENCAPSULATION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_v4_udp_encapsulation0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_V4_UDP_ENCAPSULATION0 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Source UDP encapsulation port.
     * @type {Integer}
     */
    localUdpEncapPort {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Destination UDP encapsulation port.
     * @type {Integer}
     */
    remoteUdpEncapPort {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
