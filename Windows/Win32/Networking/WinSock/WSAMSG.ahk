#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKADDR.ahk" { SOCKADDR }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\WSABUF.ahk" { WSABUF }

/**
 * Used with the WSARecvMsg and WSASendMsg functions to store address and optional control information about connected and unconnected sockets as well as an array of buffers used to store message data.
 * @remarks
 * In the Microsoft Windows Software Development Kit (SDK), the version of this structure for use on Windows Vista is defined with the data type for the <b>dwBufferCount</b> and <b>dwFlags</b> members as a <b>ULONG</b>.  When compiling an application if the target platform is Windows Vista and later (<b>NTDDI_VERSION &gt;= NTDDI_LONGHORN, _WIN32_WINNT &gt;= 0x0600</b>, or <b>WINVER &gt;= 0x0600</b>), the data type for the <b>dwBufferCount</b> and <b>dwFlags</b> members is a <b>ULONG</b>.
 * 
 * <b>Windows Server 2003 and Windows XP:  </b> When compiling an application, the data type for the <b>dwBufferCount</b> and <b>dwFlags</b> members is a <b>DWORD</b>.
 * 
 * On the Windows SDK released for Windows Vista and later, the <b>WSAMSG</b> structure is defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly
 * 
 * If the datagram or control data is truncated during the transmission, the function being used in association with the 
 * <b>WSAMSG</b> structure returns SOCKET_ERROR and a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsagetlasterror">WSAGetLastError</a> function returns WSAEMSGSIZE. It is up to the application to determine what was truncated by checking for MSG_TRUNC and/or MSG_CTRUNC flags.
 * @see https://learn.microsoft.com/windows/win32/api/ws2def/ns-ws2def-wsamsg
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSAMSG {
    #StructPack 8

    /**
     * Type: <b>LPSOCKADDR</b>
     * 
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structure that stores information about the remote address. Used only with unconnected sockets.
     */
    name : SOCKADDR.Ptr

    /**
     * Type: <b>INT</b>
     * 
     * The length, in bytes, of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structure pointed to in the <b>pAddr</b> member. Used only with unconnected sockets.
     */
    namelen : Int32

    /**
     * Type: <b>LPWSABUF</b>
     * 
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-wsabuf">WSABUF</a> structures used to receive the message data. The capability of the <b>lpBuffers</b> member to contain multiple buffers enables the use of scatter/gather I/O.
     */
    lpBuffers : WSABUF.Ptr

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of buffers pointed to in the <b>lpBuffers</b> member.
     */
    dwBufferCount : UInt32

    /**
     * Type: <b>WSABUF</b>
     * 
     * A structure of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-wsabuf">WSABUF</a> type used to specify optional control data. See Remarks.
     */
    Control : WSABUF

    /**
     * Type: <b>DWORD</b>
     * 
     * One or more control flags, specified as the logical <b>OR</b> of values. The possible values for <b>dwFlags</b> member on input are defined in the Winsock2.h header file. The possible values for <b>dwFlags</b> member on output are defined in the Ws2def.h header file which is automatically included by the Winsock2.h header file. 
     * 
     * <table>
     * <tr>
     * <th>Flags on input</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSG_PEEK"></a><a id="msg_peek"></a><dl>
     * <dt><b>MSG_PEEK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Peek at the incoming data. The data is copied into the buffer, but is not removed from the input queue. This flag is valid only for non-overlapped sockets.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <table>
     * <tr>
     * <th>Flag returned</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSG_BCAST"></a><a id="msg_bcast"></a><dl>
     * <dt><b>MSG_BCAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The datagram was received as a link-layer broadcast or with a destination IP address that is a broadcast address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSG_MCAST"></a><a id="msg_mcast"></a><dl>
     * <dt><b>MSG_MCAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The datagram was received with a destination IP address that is a multicast address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSG_TRUNC"></a><a id="msg_trunc"></a><dl>
     * <dt><b>MSG_TRUNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The datagram was truncated. More data was present than the process allocated room for.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSG_CTRUNC"></a><a id="msg_ctrunc"></a><dl>
     * <dt><b>MSG_CTRUNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control (ancillary) data was truncated. More control data was present than the process allocated room for.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

}
