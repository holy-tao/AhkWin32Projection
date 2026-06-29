#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WTSSBX_ADDRESS_FAMILY.ahk
#Include .\WTSSBX_IP_ADDRESS.ahk
#Include .\WTSSBX_MACHINE_DRAIN.ahk
#Include .\WTSSBX_MACHINE_CONNECT_INFO.ahk
#Include .\WTSSBX_MACHINE_STATE.ahk
#Include .\WTSSBX_MACHINE_SESSION_MODE.ahk

/**
 * Contains information about a computer and its current state.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_machine_info
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WTSSBX_MACHINE_INFO extends Win32Struct {
    static sizeof => 1452

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_machine_connect_info">WTSSBX_MACHINE_CONNECT_INFO</a> structure that contains information about the computer.
     * @type {WTSSBX_MACHINE_CONNECT_INFO}
     */
    ClientConnectInfo {
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
        get => StrGet(this.ptr + 888, 256, "UTF-16")
        set => StrPut(value, this.ptr + 888, 256, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_ip_address">WTSSBX_IP_ADDRESS</a> structure that contains the internal IP address of this computer. RD Connection Broker uses this IP address for redirection purposes.
     * @type {WTSSBX_IP_ADDRESS}
     */
    InternalIPAddress {
        get {
            if(!this.HasProp("__InternalIPAddress"))
                this.__InternalIPAddress := WTSSBX_IP_ADDRESS(1404, this)
            return this.__InternalIPAddress
        }
    }

    /**
     * The maximum number of sessions that this computer can accept.
     * @type {Integer}
     */
    dwMaxSessionsLimit {
        get => NumGet(this, 1432, "uint")
        set => NumPut("uint", value, this, 1432)
    }

    /**
     * The server weight value of this computer. RD Connection Broker uses this value for load balancing.
     * @type {Integer}
     */
    ServerWeight {
        get => NumGet(this, 1436, "uint")
        set => NumPut("uint", value, this, 1436)
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_session_mode">WTSSBX_MACHINE_SESSION_MODE</a> enumeration type that indicates the computer's session mode.
     * @type {WTSSBX_MACHINE_SESSION_MODE}
     */
    SingleSessionMode {
        get => NumGet(this, 1440, "int")
        set => NumPut("int", value, this, 1440)
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_drain">WTSSBX_MACHINE_DRAIN</a> enumeration type that indicates whether the computer is accepting new user sessions.
     * @type {WTSSBX_MACHINE_DRAIN}
     */
    InDrain {
        get => NumGet(this, 1444, "int")
        set => NumPut("int", value, this, 1444)
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_machine_state">WTSSBX_MACHINE_STATE</a> enumeration type that indicates the state of the computer.
     * @type {WTSSBX_MACHINE_STATE}
     */
    MachineState {
        get => NumGet(this, 1448, "int")
        set => NumPut("int", value, this, 1448)
    }
}
