#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTSSBX_MACHINE_CONNECT_INFO.ahk" { WTSSBX_MACHINE_CONNECT_INFO }
#Import ".\WTSSBX_MACHINE_SESSION_MODE.ahk" { WTSSBX_MACHINE_SESSION_MODE }
#Import ".\WTSSBX_MACHINE_STATE.ahk" { WTSSBX_MACHINE_STATE }
#Import ".\WTSSBX_MACHINE_DRAIN.ahk" { WTSSBX_MACHINE_DRAIN }
#Import ".\WTSSBX_IP_ADDRESS.ahk" { WTSSBX_IP_ADDRESS }
#Import ".\WTSSBX_ADDRESS_FAMILY.ahk" { WTSSBX_ADDRESS_FAMILY }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about a computer and its current state.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_machine_info
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTSSBX_MACHINE_INFO {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_machine_connect_info">WTSSBX_MACHINE_CONNECT_INFO</a> structure that contains information about the computer.
     */
    ClientConnectInfo : WTSSBX_MACHINE_CONNECT_INFO

    /**
     * A Unicode string that contains the name of the farm in RD Connection Broker that this computer belongs to.  This string  cannot exceed 256 characters.
     */
    wczFarmName : WCHAR[257]

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_ip_address">WTSSBX_IP_ADDRESS</a> structure that contains the internal IP address of this computer. RD Connection Broker uses this IP address for redirection purposes.
     */
    InternalIPAddress : WTSSBX_IP_ADDRESS

    /**
     * The maximum number of sessions that this computer can accept.
     */
    dwMaxSessionsLimit : UInt32

    /**
     * The server weight value of this computer. RD Connection Broker uses this value for load balancing.
     */
    ServerWeight : UInt32

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_session_mode">WTSSBX_MACHINE_SESSION_MODE</a> enumeration type that indicates the computer's session mode.
     */
    SingleSessionMode : WTSSBX_MACHINE_SESSION_MODE

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_drain">WTSSBX_MACHINE_DRAIN</a> enumeration type that indicates whether the computer is accepting new user sessions.
     */
    InDrain : WTSSBX_MACHINE_DRAIN

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_state">WTSSBX_MACHINE_STATE</a> enumeration type that indicates the state of the computer.
     */
    MachineState : WTSSBX_MACHINE_STATE

}
