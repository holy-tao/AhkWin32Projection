#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\ROUTER_INTERFACE_TYPE.ahk" { ROUTER_INTERFACE_TYPE }
#Import ".\RAS_FLAGS.ahk" { RAS_FLAGS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The RAS_CONNECTION_0 structure contains general information regarding a specific connection, such as user name or domain. For more detailed information about a specific connection, such as bytes sent or received, see RAS_CONNECTION_1.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_connection_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RAS_CONNECTION_0 {
    #StructPack 8

    /**
     * A handle to the connection.
     */
    hConnection : HANDLE

    /**
     * A handle to the interface.
     */
    hInterface : HANDLE

    /**
     * A value that represent the duration of the connection, in seconds.
     */
    dwConnectDuration : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_interface_type">ROUTER_INTERFACE_TYPE</a> enumeration that identifies the type of connection interface.
     */
    dwInterfaceType : ROUTER_INTERFACE_TYPE

    dwConnectionFlags : RAS_FLAGS

    /**
     * A null-terminated Unicode string that contains the name of the interface for this connection.
     */
    wszInterfaceName : WCHAR[257]

    /**
     * A null-terminated Unicode string that contains the name of the user logged on to the connection.
     */
    wszUserName : WCHAR[257]

    /**
     * A null-terminated Unicode string that contains the domain on which the connected user is authenticated.
     */
    wszLogonDomain : WCHAR[16]

    /**
     * A null-terminated Unicode string that contains the name of the remote computer.
     */
    wszRemoteComputer : WCHAR[17]

}
