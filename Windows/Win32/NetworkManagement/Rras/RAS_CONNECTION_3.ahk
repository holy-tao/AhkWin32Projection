#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPP_LCP_INFO.ahk" { PPP_LCP_INFO }
#Import ".\PPP_INFO_3.ahk" { PPP_INFO_3 }
#Import ".\PPP_CCP_INFO.ahk" { PPP_CCP_INFO }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\PPP_LCP.ahk" { PPP_LCP }
#Import ".\PPP_IPV6_CP_INFO.ahk" { PPP_IPV6_CP_INFO }
#Import ".\PPP_NBFCP_INFO.ahk" { PPP_NBFCP_INFO }
#Import ".\RAS_QUARANTINE_STATE.ahk" { RAS_QUARANTINE_STATE }
#Import ".\PPP_IPCP_INFO2.ahk" { PPP_IPCP_INFO2 }
#Import ".\ROUTER_INTERFACE_TYPE.ahk" { ROUTER_INTERFACE_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PPP_LCP_INFO_AUTH_DATA.ahk" { PPP_LCP_INFO_AUTH_DATA }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The RAS_CONNECTION_3 structure contains information for the connection, including the Globally Unique Identifier (GUID) that identifies the connection and the quarantine state of the connection.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_connection_3
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RAS_CONNECTION_3 {
    #StructPack 8

    /**
     * The version of the <b>RAS_CONNECTION_3</b> structure used.
     */
    dwVersion : UInt32

    /**
     * The size, in bytes, of this <b>RAS_CONNECTION_3</b> structure.
     */
    dwSize : UInt32

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
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_info_3">PPP_INFO_3</a> structure that contains Point-to-Point (PPP) projection operation information for a connection.
     */
    PppInfo3 : PPP_INFO_3

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-ras_quarantine_state">RAS_QUARANTINE_STATE</a> structure that specifies the Network Access Protection (NAP) quarantine state of the connection.
     */
    rasQuarState : RAS_QUARANTINE_STATE

    /**
     * A FILETIME structure that specifies the time required for the connection to come out of quarantine after which the connection will be dropped. This value is valid only if <b>rasQuarState</b> has a value of <b>RAS_QUAR_STATE_PROBATION</b>.
     */
    timer : FILETIME

}
