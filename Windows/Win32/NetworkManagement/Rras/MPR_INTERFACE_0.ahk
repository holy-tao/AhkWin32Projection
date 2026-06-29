#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\ROUTER_INTERFACE_TYPE.ahk" { ROUTER_INTERFACE_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ROUTER_CONNECTION_STATE.ahk" { ROUTER_CONNECTION_STATE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The MPR_INTERFACE_0 structure contains information for a particular router interface.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_interface_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_INTERFACE_0 {
    #StructPack 8

    /**
     * Pointer to a Unicode string that contains the name of the interface.
     */
    wszInterfaceName : WCHAR[257]

    /**
     * Handle to the interface.
     */
    hInterface : HANDLE

    /**
     * Specifies whether the interface is enabled. This member is <b>TRUE</b> if the interface is enabled, <b>FALSE</b> if the interface is administratively disabled.
     */
    fEnabled : BOOL

    /**
     * Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_interface_type">type of interface</a>.
     */
    dwIfType : ROUTER_INTERFACE_TYPE

    /**
     * Specifies the current state of the interface, for example connected, disconnected, or unreachable. For a list of possible states, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_connection_state">ROUTER_CONNECTION_STATE</a>.
     */
    dwConnectionState : ROUTER_CONNECTION_STATE

    /**
     * Specifies a value that represents a reason why the interface cannot be reached. See 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/unreachability-reasons">Unreachability Reasons</a> for a list of possible values.
     */
    fUnReachabilityReasons : UInt32

    /**
     * Specifies a nonzero value if the interface fails to connect.
     */
    dwLastError : UInt32

}
