#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WTSSBX_IP_ADDRESS.ahk
#Include .\WTSSBX_MACHINE_CONNECT_INFO.ahk

/**
 * Contains information about a computer and its current state.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_machine_info
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTSSBX_MACHINE_INFO extends Win32Struct
{
    static sizeof => 1216

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_machine_connect_info">WTSSBX_MACHINE_CONNECT_INFO</a> structure that contains information about the computer.
     * @type {WTSSBX_MACHINE_CONNECT_INFO}
     */
    ClientConnectInfo{
        get {
            if(!this.HasProp("__ClientConnectInfo"))
                this.__ClientConnectInfo := WTSSBX_MACHINE_CONNECT_INFO(0, this)
            return this.__ClientConnectInfo
        }
    }

    /**
     * A Unicode string that contains the name of the farm in RD Connection Broker that this computer belongs to.  This string  cannot exceed 256 characters.
     * @type {String}
     */
    wczFarmName {
        get => StrGet(this.ptr + 648, 256, "UTF-16")
        set => StrPut(value, this.ptr + 648, 256, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_ip_address">WTSSBX_IP_ADDRESS</a> structure that contains the internal IP address of this computer. RD Connection Broker uses this IP address for redirection purposes.
     * @type {WTSSBX_IP_ADDRESS}
     */
    InternalIPAddress{
        get {
            if(!this.HasProp("__InternalIPAddress"))
                this.__InternalIPAddress := WTSSBX_IP_ADDRESS(1168, this)
            return this.__InternalIPAddress
        }
    }

    /**
     * The maximum number of sessions that this computer can accept.
     * @type {Integer}
     */
    dwMaxSessionsLimit {
        get => NumGet(this, 1196, "uint")
        set => NumPut("uint", value, this, 1196)
    }

    /**
     * The server weight value of this computer. RD Connection Broker uses this value for load balancing.
     * @type {Integer}
     */
    ServerWeight {
        get => NumGet(this, 1200, "uint")
        set => NumPut("uint", value, this, 1200)
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_session_mode">WTSSBX_MACHINE_SESSION_MODE</a> enumeration type that indicates the computer's session mode.
     * @type {Integer}
     */
    SingleSessionMode {
        get => NumGet(this, 1204, "int")
        set => NumPut("int", value, this, 1204)
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_drain">WTSSBX_MACHINE_DRAIN</a> enumeration type that indicates whether the computer is accepting new user sessions.
     * @type {Integer}
     */
    InDrain {
        get => NumGet(this, 1208, "int")
        set => NumPut("int", value, this, 1208)
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_state">WTSSBX_MACHINE_STATE</a> enumeration type that indicates the state of the computer.
     * @type {Integer}
     */
    MachineState {
        get => NumGet(this, 1212, "int")
        set => NumPut("int", value, this, 1212)
    }
}
