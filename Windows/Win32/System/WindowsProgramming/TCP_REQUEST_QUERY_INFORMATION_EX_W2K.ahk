#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TDIEntityID.ahk" { TDIEntityID }
#Import ".\TDIObjectID.ahk" { TDIObjectID }
#Import ".\TDIENTITY_ENTITY_TYPE.ahk" { TDIENTITY_ENTITY_TYPE }

/**
 * The TCP_REQUEST_QUERY_INFORMATION_EX_W2K structure (tdiinfo.h) contains the input for the IOCTL_TCP_QUERY_INFORMATION_EX control code.
 * @see https://learn.microsoft.com/windows/win32/api/tdiinfo/ns-tdiinfo-tcp_request_query_information_ex_w2k
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct TCP_REQUEST_QUERY_INFORMATION_EX_W2K {
    #StructPack 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tdiinfo/ns-tdiinfo-tdiobjectid">TDIObjectID</a> structure that defines the type of information being requested from the TCP driver by <a href="https://docs.microsoft.com/windows/desktop/api/tcpioctl/ni-tcpioctl-ioctl_tcp_query_information_ex">IOCTL_TCP_QUERY_INFORMATION_EX</a>.
     */
    ID : TDIObjectID

    /**
     * The IPv4 or IPv6 address to be used when <a href="https://docs.microsoft.com/windows/desktop/api/tcpioctl/ns-tcpioctl-ipinterfaceinfo">IPInterfaceInfo</a> data is requested for a particular IP address.
     */
    Context : Int8[16]

}
