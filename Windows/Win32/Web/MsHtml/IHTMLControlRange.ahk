#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLControlRange extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLControlRange
     * @type {Guid}
     */
    static IID => Guid("{3050f29c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["select", "add", "remove", "item", "scrollIntoView", "queryCommandSupported", "queryCommandEnabled", "queryCommandState", "queryCommandIndeterm", "queryCommandText", "queryCommandValue", "execCommand", "execCommandShowHelp", "commonParentElement", "get_length"]

    /**
     * The select function determines the status of one or more sockets, waiting if necessary, to perform synchronous I/O.
     * @returns {HRESULT} The 
     * <b>select</b> function returns the total number of socket handles that are ready and contained in the 
     * <a href="/windows/desktop/api/winsock/nf-winsock-fd_set">fd_set</a> structures, zero if the time limit expired, or SOCKET_ERROR if an error occurred. If the return value is SOCKET_ERROR, 
     * <a href="/windows/desktop/api/winsock/nf-winsock-wsagetlasterror">WSAGetLastError</a> can be used to retrieve a specific error code.
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSANOTINITIALISED</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A successful 
     * <a href="/windows/desktop/api/winsock/nf-winsock-wsastartup">WSAStartup</a> call must occur before using this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEFAULT</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows Sockets implementation was unable to allocate needed resources for its internal operations, or the <i>readfds</i>, <i>writefds</i>, <i>exceptfds</i>, or <i>timeval</i> parameters are not part of the user address space.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENETDOWN</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network subsystem has failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINVAL</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>time-out</i> value is not valid, or all three descriptor parameters were <b>null</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINTR</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A blocking Windows Socket 1.1 call was canceled through 
     * <a href="/windows/desktop/api/winsock2/nf-winsock2-wsacancelblockingcall">WSACancelBlockingCall</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINPROGRESS</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A blocking Windows Sockets 1.1 call is in progress, or the service provider is still processing a callback function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENOTSOCK</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the descriptor sets contains an entry that is not a socket.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsock2/nf-winsock2-select
     */
    select() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLControlElement} item 
     * @returns {HRESULT} 
     */
    add(item) {
        result := ComCall(8, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    remove(index) {
        result := ComCall(9, this, "int", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IHTMLElement>} pdisp 
     * @returns {HRESULT} 
     */
    item(index, pdisp) {
        result := ComCall(10, this, "int", index, "ptr*", pdisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varargStart 
     * @returns {HRESULT} 
     */
    scrollIntoView(varargStart) {
        result := ComCall(11, this, "ptr", varargStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {Pointer<VARIANT_BOOL>} pfRet 
     * @returns {HRESULT} 
     */
    queryCommandSupported(cmdID, pfRet) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(12, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {Pointer<VARIANT_BOOL>} pfRet 
     * @returns {HRESULT} 
     */
    queryCommandEnabled(cmdID, pfRet) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(13, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {Pointer<VARIANT_BOOL>} pfRet 
     * @returns {HRESULT} 
     */
    queryCommandState(cmdID, pfRet) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(14, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {Pointer<VARIANT_BOOL>} pfRet 
     * @returns {HRESULT} 
     */
    queryCommandIndeterm(cmdID, pfRet) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(15, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {Pointer<BSTR>} pcmdText 
     * @returns {HRESULT} 
     */
    queryCommandText(cmdID, pcmdText) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(16, this, "ptr", cmdID, "ptr", pcmdText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {Pointer<VARIANT>} pcmdValue 
     * @returns {HRESULT} 
     */
    queryCommandValue(cmdID, pcmdValue) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(17, this, "ptr", cmdID, "ptr", pcmdValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {VARIANT_BOOL} showUI 
     * @param {VARIANT} value 
     * @param {Pointer<VARIANT_BOOL>} pfRet 
     * @returns {HRESULT} 
     */
    execCommand(cmdID, showUI, value, pfRet) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(18, this, "ptr", cmdID, "short", showUI, "ptr", value, "ptr", pfRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {Pointer<VARIANT_BOOL>} pfRet 
     * @returns {HRESULT} 
     */
    execCommandShowHelp(cmdID, pfRet) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(19, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} parent 
     * @returns {HRESULT} 
     */
    commonParentElement(parent) {
        result := ComCall(20, this, "ptr*", parent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, pMarshal, p, "HRESULT")
        return result
    }
}
