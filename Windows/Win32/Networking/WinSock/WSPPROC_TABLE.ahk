#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPWSPACCEPT.ahk" { LPWSPACCEPT }
#Import ".\LPWSPADDRESSTOSTRING.ahk" { LPWSPADDRESSTOSTRING }
#Import ".\LPWSPASYNCSELECT.ahk" { LPWSPASYNCSELECT }
#Import ".\LPWSPBIND.ahk" { LPWSPBIND }
#Import ".\LPWSPCANCELBLOCKINGCALL.ahk" { LPWSPCANCELBLOCKINGCALL }
#Import ".\LPWSPCLEANUP.ahk" { LPWSPCLEANUP }
#Import ".\LPWSPCLOSESOCKET.ahk" { LPWSPCLOSESOCKET }
#Import ".\LPWSPCONNECT.ahk" { LPWSPCONNECT }
#Import ".\LPWSPDUPLICATESOCKET.ahk" { LPWSPDUPLICATESOCKET }
#Import ".\LPWSPENUMNETWORKEVENTS.ahk" { LPWSPENUMNETWORKEVENTS }
#Import ".\LPWSPEVENTSELECT.ahk" { LPWSPEVENTSELECT }
#Import ".\LPWSPGETOVERLAPPEDRESULT.ahk" { LPWSPGETOVERLAPPEDRESULT }
#Import ".\LPWSPGETPEERNAME.ahk" { LPWSPGETPEERNAME }
#Import ".\LPWSPGETQOSBYNAME.ahk" { LPWSPGETQOSBYNAME }
#Import ".\LPWSPGETSOCKNAME.ahk" { LPWSPGETSOCKNAME }
#Import ".\LPWSPGETSOCKOPT.ahk" { LPWSPGETSOCKOPT }
#Import ".\LPWSPIOCTL.ahk" { LPWSPIOCTL }
#Import ".\LPWSPJOINLEAF.ahk" { LPWSPJOINLEAF }
#Import ".\LPWSPLISTEN.ahk" { LPWSPLISTEN }
#Import ".\LPWSPRECV.ahk" { LPWSPRECV }
#Import ".\LPWSPRECVDISCONNECT.ahk" { LPWSPRECVDISCONNECT }
#Import ".\LPWSPRECVFROM.ahk" { LPWSPRECVFROM }
#Import ".\LPWSPSELECT.ahk" { LPWSPSELECT }
#Import ".\LPWSPSEND.ahk" { LPWSPSEND }
#Import ".\LPWSPSENDDISCONNECT.ahk" { LPWSPSENDDISCONNECT }
#Import ".\LPWSPSENDTO.ahk" { LPWSPSENDTO }
#Import ".\LPWSPSETSOCKOPT.ahk" { LPWSPSETSOCKOPT }
#Import ".\LPWSPSHUTDOWN.ahk" { LPWSPSHUTDOWN }
#Import ".\LPWSPSOCKET.ahk" { LPWSPSOCKET }
#Import ".\LPWSPSTRINGTOADDRESS.ahk" { LPWSPSTRINGTOADDRESS }

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
    lpWSPAccept : LPWSPACCEPT

    /**
     * A pointer to the [**LPWSPAddressToString**](nc-ws2spi-lpwspaddresstostring.md) function.
     */
    lpWSPAddressToString : LPWSPADDRESSTOSTRING

    /**
     * A pointer to the **[LPWSPAsyncSelect](nc-ws2spi-lpwspasyncselect.md)** function.
     */
    lpWSPAsyncSelect : LPWSPASYNCSELECT

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspbind">LPWSPBind</a></b> function.
     */
    lpWSPBind : LPWSPBIND

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspcancelblockingcall">LPWSPCancelBlockingCall</a></b> function.
     */
    lpWSPCancelBlockingCall : LPWSPCANCELBLOCKINGCALL

    /**
     * A pointer to the [**WSPCleanup**](./nc-ws2spi-lpwspcleanup.md) function.
     */
    lpWSPCleanup : LPWSPCLEANUP

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspclosesocket">LPWSPCloseSocket</a></b> function.
     */
    lpWSPCloseSocket : LPWSPCLOSESOCKET

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> function.
     */
    lpWSPConnect : LPWSPCONNECT

    /**
     * A pointer to the [**WSPDuplicateSocket**](./nc-ws2spi-lpwspduplicatesocket.md) function.
     */
    lpWSPDuplicateSocket : LPWSPDUPLICATESOCKET

    /**
     * A pointer to the [**WSPEnumNetworkEvents**](./nc-ws2spi-lpwspenumnetworkevents.md) function.
     */
    lpWSPEnumNetworkEvents : LPWSPENUMNETWORKEVENTS

    /**
     * A pointer to the [**LPWSPEventSelect**](./nc-ws2spi-lpwspenumnetworkevents.md) function.
     */
    lpWSPEventSelect : LPWSPEVENTSELECT

    /**
     * A pointer to the [**LPWSPGetOverlappedResult**](./nc-ws2spi-lpwspgetoverlappedresult.md) function.
     */
    lpWSPGetOverlappedResult : LPWSPGETOVERLAPPEDRESULT

    /**
     * A pointer to the    function.
     */
    lpWSPGetPeerName : LPWSPGETPEERNAME

    /**
     * A pointer to the [**WSPGetSockName**](./nc-ws2spi-lpwspgetsockname.md) function.
     */
    lpWSPGetSockName : LPWSPGETSOCKNAME

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetsockopt">LPWSPGetSockopt</a></b> function.
     */
    lpWSPGetSockOpt : LPWSPGETSOCKOPT

    /**
     * A pointer to the [**WSPGetQOSByName**](./nc-ws2spi-lpwspgetqosbyname.md) function.
     */
    lpWSPGetQOSByName : LPWSPGETQOSBYNAME

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspioctl">LPWSPIoctl</a></b> function.
     */
    lpWSPIoctl : LPWSPIOCTL

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspjoinleaf">LPWSPJoinLeaf</a></b> function.
     */
    lpWSPJoinLeaf : LPWSPJOINLEAF

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsplisten">LPWSPListen</a></b> function.
     */
    lpWSPListen : LPWSPLISTEN

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">LPWSPRecv</a></b> function.
     */
    lpWSPRecv : LPWSPRECV

    /**
     * A pointer to the [**WSPRecvDisconnect**](./nc-ws2spi-lpwsprecvdisconnect.md) function.
     */
    lpWSPRecvDisconnect : LPWSPRECVDISCONNECT

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecvfrom">LPWSPRecvFrom</a></b> function.
     */
    lpWSPRecvFrom : LPWSPRECVFROM

    /**
     * A pointer to the [**LPWSPSelect**](./nc-ws2spi-lpwspselect.md) function.
     */
    lpWSPSelect : LPWSPSELECT

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsend">LPWSPSend</a></b> function.
     */
    lpWSPSend : LPWSPSEND

    /**
     * A pointer to the [**WSPSendDisconnect**](./nc-ws2spi-lpwspsenddisconnect.md) function.
     */
    lpWSPSendDisconnect : LPWSPSENDDISCONNECT

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsendto">LPWSPSendTo</a></b> function.
     */
    lpWSPSendTo : LPWSPSENDTO

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsetsockopt">LPWSPSetSockOpt</a></b> function.
     */
    lpWSPSetSockOpt : LPWSPSETSOCKOPT

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspshutdown">LPWSPShutdown</a></b> function.
     */
    lpWSPShutdown : LPWSPSHUTDOWN

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsocket">LPWSPSocket</a> function.
     */
    lpWSPSocket : LPWSPSOCKET

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspstringtoaddress">LPWSPStringToAddress<a> function.
     */
    lpWSPStringToAddress : LPWSPSTRINGTOADDRESS

}
