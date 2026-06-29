#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPP_LCP_INFO.ahk" { PPP_LCP_INFO }
#Import ".\PPP_CCP_INFO.ahk" { PPP_CCP_INFO }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\PPP_LCP.ahk" { PPP_LCP }
#Import ".\PPP_ATCP_INFO.ahk" { PPP_ATCP_INFO }
#Import ".\PPP_IPXCP_INFO.ahk" { PPP_IPXCP_INFO }
#Import ".\PPP_NBFCP_INFO.ahk" { PPP_NBFCP_INFO }
#Import ".\PPP_IPCP_INFO2.ahk" { PPP_IPCP_INFO2 }
#Import ".\ROUTER_INTERFACE_TYPE.ahk" { ROUTER_INTERFACE_TYPE }
#Import ".\PPP_INFO_2.ahk" { PPP_INFO_2 }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PPP_LCP_INFO_AUTH_DATA.ahk" { PPP_LCP_INFO_AUTH_DATA }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The RAS_CONNECTION_2 structure contains information for a connection, including the Globally Unique Identifier (GUID) that identifies the connection.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_connection_2
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RAS_CONNECTION_2 {
    #StructPack 8

    /**
     * A handle to the connection.
     */
    hConnection : HANDLE

    /**
     * A null-terminated Unicode string that contains the name of the user logged on to the connection.
     */
    wszUserName : WCHAR[257]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_interface_type">ROUTER_INTERFACE_TYPE</a> enumeration that identifies the type of connection interface.
     */
    dwInterfaceType : ROUTER_INTERFACE_TYPE

    /**
     * A GUID  that identifies the connection. For incoming connections, this GUID is valid only as long as the connection is active.
     */
    guid : Guid

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_info_2">PPP_INFO_2</a> structure that contains Point-to-Point (PPP) projection operation information for a connection.
     */
    PppInfo2 : PPP_INFO_2

}
