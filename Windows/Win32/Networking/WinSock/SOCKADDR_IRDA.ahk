#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The SOCKADDR_IRDA structure is used in conjunction with IrDA socket operations, defined by address family AF_IRDA.
 * @remarks
 * Client applications make use of each field in the 
 * <b>SOCKADDR_IRDA</b> structure. The <b>irdaDeviceID</b> member is obtained by a previous discovery operation performed by making a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-getsockopt">getsockopt</a>(IRLMP_ENUMDEVICES) function call. For more information on performing a discovery operation, see the Notes for IrDA Sockets section in the Remarks section of 
 * <b>getsockopt</b>.
 * 
 * The <b>irdaServiceName</b> member is filled with the well-known value that the server application specified in its 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-bind">bind</a> function call.
 * @see https://learn.microsoft.com/windows/win32/api/af_irda/ns-af_irda-sockaddr_irda
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR_IRDA {
    #StructPack 2

    /**
     * Address family. This member is always AF_IRDA.
     */
    irdaAddressFamily : UInt16

    /**
     * Device identifier (ID) of the IrDA device to which the client wants to issue the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-connect">connect</a> function call. Ignored by server applications.
     */
    irdaDeviceID : Int8[4]

    /**
     * Well-known service name associated with a server application. Specified by servers during their 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-bind">bind</a> function call.
     */
    irdaServiceName : CHAR[25]

}
