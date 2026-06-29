#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The PPP_IPCP_INFO structure contains the result of a PPP Internet Protocol (IP) negotiation.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_ipcp_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PPP_IPCP_INFO {
    #StructPack 4

    /**
     * Specifies the result of the PPP control protocol negotiation. A value of zero indicates success. A nonzero value indicates failure, and is the actual fatal error that occurred during the control protocol negotiation.
     */
    dwError : UInt32

    /**
     * Specifies a Unicode string that holds the local computer's IP address for the connection. This string has the form <i>a</i><b>.</b><i>b</i><b>.</b><i>c</i><b>.</b><i>d</i>; for example, "10.102.235.84". 
     * 
     * 
     * 
     * 
     * The 
     * <b>PPP_IPCP_INFO</b> structures provides address information from the perspective of the server. For example, if a remote access client is connecting to a RAS server, this member holds the IP address of the server.
     */
    wszAddress : WCHAR[16]

    /**
     * Specifies a Unicode string that holds the IP address of the remote computer. This string has the form <i>a</i><b>.</b><i>b</i><b>.</b><i>c</i><b>.</b><i>d</i>. If the address is not available, this member is an empty string. 
     * 
     * 
     * 
     * 
     * The 
     * <b>PPP_IPCP_INFO</b> structures provides address information from the perspective of the server. For example, if a remote access client is connecting to a RAS server, this member holds the IP address of the client.
     */
    wszRemoteAddress : WCHAR[16]

}
