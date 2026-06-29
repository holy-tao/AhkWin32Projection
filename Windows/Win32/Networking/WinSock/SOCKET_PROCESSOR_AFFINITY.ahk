#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Kernel\PROCESSOR_NUMBER.ahk" { PROCESSOR_NUMBER }

/**
 * Contains the association between a socket and an RSS processor core and NUMA node.
 * @remarks
 * The <b>SOCKET_PROCESSOR_AFFINITY</b>  structure is supported on Windows 8,   and Windows Server 2012, and later versions of the operating system.
 * 
 * The <a href="https://docs.microsoft.com/windows/win32/winsock/sio-query-rss-processor-info">SIO_QUERY_RSS_PROCESSOR_INFO</a> 
 *         IOCTL is used to determine the association between a socket and an RSS processor core and NUMA node. This IOCTL returns a <b>SOCKET_PROCESSOR_AFFINITY</b> structure that contains the processor number and the NUMA node ID.
 * @see https://learn.microsoft.com/windows/win32/api/ws2def/ns-ws2def-socket_processor_affinity
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKET_PROCESSOR_AFFINITY {
    #StructPack 2

    /**
     * A structure to represent a system wide processor number. This <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_number">PROCESSOR_NUMBER</a> structure contains a
     * group number and relative processor number within the group.
     */
    Processor : PROCESSOR_NUMBER

    /**
     * The NUMA node ID.
     */
    NumaNodeId : UInt16

    /**
     * A value reserved for future use.
     */
    Reserved : UInt16

}
