#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\PPP_NBFCP_INFO.ahk" { PPP_NBFCP_INFO }
#Import ".\PPP_IPCP_INFO.ahk" { PPP_IPCP_INFO }
#Import ".\PPP_ATCP_INFO.ahk" { PPP_ATCP_INFO }
#Import ".\PPP_INFO.ahk" { PPP_INFO }
#Import ".\PPP_IPXCP_INFO.ahk" { PPP_IPXCP_INFO }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The RAS_CONNECTION_1 structure contains detailed information regarding a specific connection, such as error counts and bytes received. For more general information about a specific connection, such as user name or domain, see RAS_CONNECTION_0.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_connection_1
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RAS_CONNECTION_1 {
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_info">PPP_INFO</a> structure that contains Point-to-Point (PPP) projection operation information for a connection.
     */
    PppInfo : PPP_INFO

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

}
