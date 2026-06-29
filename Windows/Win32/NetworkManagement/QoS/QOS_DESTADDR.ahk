#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QOS_OBJECT_HDR.ahk" { QOS_OBJECT_HDR }
#Import "..\..\Networking\WinSock\SOCKADDR.ahk" { SOCKADDR }

/**
 * The QOS object QOS_DESTADDR is used during a call to the WSAIoctl (SIO_SET_QOS) function in order to avoid issuing a connect function call for a sending socket.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-qos_destaddr
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct QOS_DESTADDR {
    #StructPack 8

    /**
     * The QOS object 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos/ns-qos-qos_object_hdr">QOS_OBJECT_HDR</a>. The object type for this QOS object should be 
     * <b>QOS_DESTADDR</b>.
     */
    ObjectHdr : QOS_OBJECT_HDR

    /**
     * Address of the destination socket.
     */
    SocketAddress : SOCKADDR.Ptr

    /**
     * Length of the <b>SocketAddress</b> structure.
     */
    SocketAddressLength : UInt32

}
