#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a table of pointers to service provider functions.
 * @remarks
 * 
  * The **WSPPROC_TABLE** structure contains a table of pointers to service provider functions that are returned by the <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wspstartup">WSPStartup<a> function.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2spi/ns-ws2spi-wspproc_table
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSPPROC_TABLE extends Win32Struct
{
    static sizeof => 240

    static packingSize => 8

    /**
     * A pointer to the **[LPWSPAccept](nc-ws2spi-lpwspaccept.md)** function.
     * @type {Pointer<LPWSPACCEPT>}
     */
    lpWSPAccept {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the [**LPWSPAddressToString**](nc-ws2spi-lpwspaddresstostring.md) function.
     * @type {Pointer<LPWSPADDRESSTOSTRING>}
     */
    lpWSPAddressToString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the **[LPWSPAsyncSelect](nc-ws2spi-lpwspasyncselect.md)** function.
     * @type {Pointer<LPWSPASYNCSELECT>}
     */
    lpWSPAsyncSelect {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspbind">LPWSPBind</a></b> function.
     * @type {Pointer<LPWSPBIND>}
     */
    lpWSPBind {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspcancelblockingcall">LPWSPCancelBlockingCall</a></b> function.
     * @type {Pointer<LPWSPCANCELBLOCKINGCALL>}
     */
    lpWSPCancelBlockingCall {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to the [**WSPCleanup**](./nc-ws2spi-lpwspcleanup.md) function.
     * @type {Pointer<LPWSPCLEANUP>}
     */
    lpWSPCleanup {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspclosesocket">LPWSPCloseSocket</a></b> function.
     * @type {Pointer<LPWSPCLOSESOCKET>}
     */
    lpWSPCloseSocket {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> function.
     * @type {Pointer<LPWSPCONNECT>}
     */
    lpWSPConnect {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to the [**WSPDuplicateSocket**](./nc-ws2spi-lpwspduplicatesocket.md) function.
     * @type {Pointer<LPWSPDUPLICATESOCKET>}
     */
    lpWSPDuplicateSocket {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to the [**WSPEnumNetworkEvents**](./nc-ws2spi-lpwspenumnetworkevents.md) function.
     * @type {Pointer<LPWSPENUMNETWORKEVENTS>}
     */
    lpWSPEnumNetworkEvents {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * A pointer to the [**LPWSPEventSelect**](./nc-ws2spi-lpwspenumnetworkevents.md) function.
     * @type {Pointer<LPWSPEVENTSELECT>}
     */
    lpWSPEventSelect {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A pointer to the [**LPWSPGetOverlappedResult**](./nc-ws2spi-lpwspgetoverlappedresult.md) function.
     * @type {Pointer<LPWSPGETOVERLAPPEDRESULT>}
     */
    lpWSPGetOverlappedResult {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * A pointer to the    function.
     * @type {Pointer<LPWSPGETPEERNAME>}
     */
    lpWSPGetPeerName {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * A pointer to the [**WSPGetSockName**](./nc-ws2spi-lpwspgetsockname.md) function.
     * @type {Pointer<LPWSPGETSOCKNAME>}
     */
    lpWSPGetSockName {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetsockopt">LPWSPGetSockopt</a></b> function.
     * @type {Pointer<LPWSPGETSOCKOPT>}
     */
    lpWSPGetSockOpt {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * A pointer to the [**WSPGetQOSByName**](./nc-ws2spi-lpwspgetqosbyname.md) function.
     * @type {Pointer<LPWSPGETQOSBYNAME>}
     */
    lpWSPGetQOSByName {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspioctl">LPWSPIoctl</a></b> function.
     * @type {Pointer<LPWSPIOCTL>}
     */
    lpWSPIoctl {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspjoinleaf">LPWSPJoinLeaf</a></b> function.
     * @type {Pointer<LPWSPJOINLEAF>}
     */
    lpWSPJoinLeaf {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsplisten">LPWSPListen</a></b> function.
     * @type {Pointer<LPWSPLISTEN>}
     */
    lpWSPListen {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">LPWSPRecv</a></b> function.
     * @type {Pointer<LPWSPRECV>}
     */
    lpWSPRecv {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * A pointer to the [**WSPRecvDisconnect**](./nc-ws2spi-lpwsprecvdisconnect.md) function.
     * @type {Pointer<LPWSPRECVDISCONNECT>}
     */
    lpWSPRecvDisconnect {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecvfrom">LPWSPRecvFrom</a></b> function.
     * @type {Pointer<LPWSPRECVFROM>}
     */
    lpWSPRecvFrom {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * A pointer to the [**LPWSPSelect**](./nc-ws2spi-lpwspselect.md) function.
     * @type {Pointer<LPWSPSELECT>}
     */
    lpWSPSelect {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsend">LPWSPSend</a></b> function.
     * @type {Pointer<LPWSPSEND>}
     */
    lpWSPSend {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * A pointer to the [**WSPSendDisconnect**](./nc-ws2spi-lpwspsenddisconnect.md) function.
     * @type {Pointer<LPWSPSENDDISCONNECT>}
     */
    lpWSPSendDisconnect {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsendto">LPWSPSendTo</a></b> function.
     * @type {Pointer<LPWSPSENDTO>}
     */
    lpWSPSendTo {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsetsockopt">LPWSPSetSockOpt</a></b> function.
     * @type {Pointer<LPWSPSETSOCKOPT>}
     */
    lpWSPSetSockOpt {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * A pointer to the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspshutdown">LPWSPShutdown</a></b> function.
     * @type {Pointer<LPWSPSHUTDOWN>}
     */
    lpWSPShutdown {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsocket">LPWSPSocket</a> function.
     * @type {Pointer<LPWSPSOCKET>}
     */
    lpWSPSocket {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspstringtoaddress">LPWSPStringToAddress<a> function.
     * @type {Pointer<LPWSPSTRINGTOADDRESS>}
     */
    lpWSPStringToAddress {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }
}
