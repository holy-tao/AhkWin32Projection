#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEV2_PROJECTION_INFO.ahk" { IKEV2_PROJECTION_INFO }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\PPP_LCP.ahk" { PPP_LCP }
#Import ".\PROJECTION_INFO.ahk" { PROJECTION_INFO }
#Import ".\PPP_PROJECTION_INFO.ahk" { PPP_PROJECTION_INFO }
#Import ".\RAS_FLAGS.ahk" { RAS_FLAGS }
#Import ".\RAS_QUARANTINE_STATE.ahk" { RAS_QUARANTINE_STATE }
#Import ".\ROUTER_INTERFACE_TYPE.ahk" { ROUTER_INTERFACE_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PPP_LCP_INFO_AUTH_DATA.ahk" { PPP_LCP_INFO_AUTH_DATA }
#Import ".\MPRAPI_OBJECT_HEADER.ahk" { MPRAPI_OBJECT_HEADER }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains specific information for the connection that includes:\_the user name, domain, and Globally Unique Identifier (GUID) associated with the connection, its Network Access Protection (NAP) quarantine state, its packet statistics, as well as its Point-to-Point(PPP) and Internet Key Exchange version 2 (IKEv2) related information.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_connection_ex
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RAS_CONNECTION_EX {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_object_header">MPRAPI_OBJECT_HEADER</a> structure that specifies the version of the <b>RAS_CONNECTION_EX</b> structure. 
     * 
     * <div class="alert"><b>Note</b>  The <b>revision</b> member  of  <b>Header</b> must be <b>MPRAPI_RAS_CONNECTION_OBJECT_REVISION_1</b> and <b>type</b> must be <b>MPRAPI_OBJECT_TYPE_RAS_CONNECTION_OBJECT</b>.</div>
     * <div> </div>
     */
    Header : MPRAPI_OBJECT_HEADER

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

    /**
     * A GUID  that identifies the connection. For incoming connections, this GUID is valid only as long as the connection is active.
     */
    guid : Guid

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-ras_quarantine_state">RAS_QUARANTINE_STATE</a> structure that specifies the NAP quarantine state of the connection.
     */
    rasQuarState : RAS_QUARANTINE_STATE

    /**
     * A FILETIME structure that specifies the time required for the connection to come out of quarantine after which the connection will be dropped. This value is valid only if <b>rasQuarState</b> has a value of <b>RAS_QUAR_STATE_PROBATION</b>.
     */
    probationTime : FILETIME

    /**
     * A value that specifies the number of bytes transmitted on the connection.
     */
    dwBytesXmited : UInt32

    /**
     * A value that specifies the number of bytes received on the connection.
     */
    dwBytesRcved : UInt32

    /**
     * A value that specifies the number of frames transmitted on the connection.
     */
    dwFramesXmited : UInt32

    /**
     * A value that specifies the number of frames received on the connection.
     */
    dwFramesRcved : UInt32

    /**
     * A value that specifies the number of Cyclic Redundancy Check (CRC) errors on the connection.
     */
    dwCrcErr : UInt32

    /**
     * A value that specifies the number of time-out errors on the connection.
     */
    dwTimeoutErr : UInt32

    /**
     * A value that specifies the number of alignment errors on the connection.
     */
    dwAlignmentErr : UInt32

    /**
     * A value that specifies the number of hardware overrun errors on the connection.
     */
    dwHardwareOverrunErr : UInt32

    /**
     * A value that specifies the number of framing errors on the connection.
     */
    dwFramingErr : UInt32

    /**
     * A value that specifies the number of buffer overrun errors on the connection.
     */
    dwBufferOverrunErr : UInt32

    /**
     * A value that specifies the percentage by which data received on this connection is compressed. <b>dwCompressionRatioIn</b> is the size of the compressed data divided by the size of the same data in an uncompressed state.
     */
    dwCompressionRatioIn : UInt32

    /**
     * A value that specifies the percentage by which data transmitted on this connection is compressed. The ratio is the size of the compressed data divided by the size of the same data in an uncompressed state.
     */
    dwCompressionRatioOut : UInt32

    /**
     * A value that specifies the number of IKEv2 Mobility and Multihoming Protocol (MOBIKE) switches that have occurred on the connection as defined in <a href="https://www.ietf.org/rfc/rfc4555.txt">RFC4555</a>. <b>dwNumSwitchOvers</b> is only valid if <b>dwConnectionFlags</b> is <b>RAS_FLAGS_IKEV2_CONNECTION</b>.
     */
    dwNumSwitchOvers : UInt32

    /**
     * A null-terminated Unicode string that contains the IP address of the remote computer in the connection. This string is of the form "a.b.c.d".
     */
    wszRemoteEndpointAddress : WCHAR[65]

    /**
     * A null-terminated Unicode string that contains the IP address of the local computer in the connection. This string is of the form "a.b.c.d".
     */
    wszLocalEndpointAddress : WCHAR[65]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-projection_info">PROJECTION_INFO</a> structure that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_projection_info">PPP_PROJECTION_INFO</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ikev2_projection_info">IKEV2_PROJECTION_INFO</a> structure.
     */
    ProjectionInfo : PROJECTION_INFO

    /**
     * A handle to the RAS connection.
     */
    hConnection : HANDLE

    /**
     * A handle to the RAS connection interface.
     */
    hInterface : HANDLE

}
