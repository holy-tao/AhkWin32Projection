#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores status information for a particular interface.
 * @remarks
 * 
  * Note that the <i>Iprtrmib.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Iprtrmib.h</i> header file should never be used directly.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iprtrmib/ns-iprtrmib-mib_ifstatus
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IFSTATUS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The index that identifies the interface.
     * @type {Integer}
     */
    dwIfIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The administrative status of the interface, that is, whether the interface is administratively enabled or disabled.
     * @type {Integer}
     */
    dwAdminStatus {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The operational status of the interface. This member can be one of the values defined in the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_connection_state">ROUTER_CONNECTION_STATE</a> enumeration defined in the <i>Mprapip.h</i> header file. See 
     * the <b>ROUTER_CONNECTION_STATE</b> enumeration for a list amd description of the possible operational states.
     * @type {Integer}
     */
    dwOperationalStatus {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies whether multicast heartbeat detection is enabled. A value of <b>TRUE</b> indicates that heartbeat detection is enabled. A value of <b>FALSE</b> indicates that heartbeat detection is disabled.
     * @type {BOOL}
     */
    bMHbeatActive {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Specifies whether the multicast heartbeat dead interval has been exceeded. A value of <b>FALSE</b> indicates that the interval has been exceeded. A value of <b>TRUE</b> indicates that the interval has not been exceeded.
     * @type {BOOL}
     */
    bMHbeatAlive {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
