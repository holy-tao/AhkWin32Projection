#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Stores status information for a particular interface.
 * @remarks
 * Note that the <i>Iprtrmib.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Iprtrmib.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ns-iprtrmib-mib_ifstatus
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IFSTATUS {
    #StructPack 4

    /**
     * The index that identifies the interface.
     */
    dwIfIndex : UInt32

    /**
     * The administrative status of the interface, that is, whether the interface is administratively enabled or disabled.
     */
    dwAdminStatus : UInt32

    /**
     * The operational status of the interface. This member can be one of the values defined in the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_connection_state">ROUTER_CONNECTION_STATE</a> enumeration defined in the <i>Mprapip.h</i> header file. See 
     * the <b>ROUTER_CONNECTION_STATE</b> enumeration for a list amd description of the possible operational states.
     */
    dwOperationalStatus : UInt32

    /**
     * Specifies whether multicast heartbeat detection is enabled. A value of <b>TRUE</b> indicates that heartbeat detection is enabled. A value of <b>FALSE</b> indicates that heartbeat detection is disabled.
     */
    bMHbeatActive : BOOL

    /**
     * Specifies whether the multicast heartbeat dead interval has been exceeded. A value of <b>FALSE</b> indicates that the interval has been exceeded. A value of <b>TRUE</b> indicates that the interval has not been exceeded.
     */
    bMHbeatAlive : BOOL

}
