#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a table of pointers to service provider functions.
 * @remarks
 * The **WSPPROC_TABLE** structure contains a table of pointers to service provider functions that are returned by the <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wspstartup">WSPStartup<a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/ns-ws2spi-wspproc_table
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSPPROC_TABLE {
    #StructPack 8

    /**
     * A pointer to the **[LPWSPAccept](nc-ws2spi-lpwspaccept.md)** function.
     */
    lpWSPAccept : IntPtr

    /**
     * A pointer to the [**LPWSPAddressToString**](nc-ws2spi-lpwspaddresstostring.md) function.
     */
    lpWSPAddressToString : IntPtr

    /**
     * A pointer to the **[LPWSPAsyncSelect](nc-ws2spi-lpwspasyncselect.md)** function.
     */
    lpWSPAsyncSelect : IntPtr

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspbind">LPWSPBind</a></b> function.
     */
    lpWSPBind : IntPtr

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspcancelblockingcall">LPWSPCancelBlockingCall</a></b> function.
     */
    lpWSPCancelBlockingCall : IntPtr

    /**
     * A pointer to the [**WSPCleanup**](./nc-ws2spi-lpwspcleanup.md) function.
     */
    lpWSPCleanup : IntPtr

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspclosesocket">LPWSPCloseSocket</a></b> function.
     */
    lpWSPCloseSocket : IntPtr

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> function.
     */
    lpWSPConnect : IntPtr

    /**
     * A pointer to the [**WSPDuplicateSocket**](./nc-ws2spi-lpwspduplicatesocket.md) function.
     */
    lpWSPDuplicateSocket : IntPtr

    /**
     * A pointer to the [**WSPEnumNetworkEvents**](./nc-ws2spi-lpwspenumnetworkevents.md) function.
     */
    lpWSPEnumNetworkEvents : IntPtr

    /**
     * A pointer to the [**LPWSPEventSelect**](./nc-ws2spi-lpwspenumnetworkevents.md) function.
     */
    lpWSPEventSelect : IntPtr

    /**
     * A pointer to the [**LPWSPGetOverlappedResult**](./nc-ws2spi-lpwspgetoverlappedresult.md) function.
     */
    lpWSPGetOverlappedResult : IntPtr

    /**
     * A pointer to the    function.
     */
    lpWSPGetPeerName : IntPtr

    /**
     * A pointer to the [**WSPGetSockName**](./nc-ws2spi-lpwspgetsockname.md) function.
     */
    lpWSPGetSockName : IntPtr

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetsockopt">LPWSPGetSockopt</a></b> function.
     */
    lpWSPGetSockOpt : IntPtr

    /**
     * A pointer to the [**WSPGetQOSByName**](./nc-ws2spi-lpwspgetqosbyname.md) function.
     */
    lpWSPGetQOSByName : IntPtr

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspioctl">LPWSPIoctl</a></b> function.
     */
    lpWSPIoctl : IntPtr

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspjoinleaf">LPWSPJoinLeaf</a></b> function.
     */
    lpWSPJoinLeaf : IntPtr

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsplisten">LPWSPListen</a></b> function.
     */
    lpWSPListen : IntPtr

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">LPWSPRecv</a></b> function.
     */
    lpWSPRecv : IntPtr

    /**
     * A pointer to the [**WSPRecvDisconnect**](./nc-ws2spi-lpwsprecvdisconnect.md) function.
     */
    lpWSPRecvDisconnect : IntPtr

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecvfrom">LPWSPRecvFrom</a></b> function.
     */
    lpWSPRecvFrom : IntPtr

    /**
     * A pointer to the [**LPWSPSelect**](./nc-ws2spi-lpwspselect.md) function.
     */
    lpWSPSelect : IntPtr

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsend">LPWSPSend</a></b> function.
     */
    lpWSPSend : IntPtr

    /**
     * A pointer to the [**WSPSendDisconnect**](./nc-ws2spi-lpwspsenddisconnect.md) function.
     */
    lpWSPSendDisconnect : IntPtr

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsendto">LPWSPSendTo</a></b> function.
     */
    lpWSPSendTo : IntPtr

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsetsockopt">LPWSPSetSockOpt</a></b> function.
     */
    lpWSPSetSockOpt : IntPtr

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspshutdown">LPWSPShutdown</a></b> function.
     */
    lpWSPShutdown : IntPtr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsocket">LPWSPSocket</a> function.
     */
    lpWSPSocket : IntPtr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspstringtoaddress">LPWSPStringToAddress<a> function.
     */
    lpWSPStringToAddress : IntPtr

}
