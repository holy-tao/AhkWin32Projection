#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTxtRange extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLTxtRange
     * @type {Guid}
     */
    static IID => Guid("{3050f220-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_htmlText", "put_text", "get_text", "parentElement", "duplicate", "inRange", "isEqual", "scrollIntoView", "collapse", "expand", "move", "moveStart", "moveEnd", "select", "pasteHTML", "moveToElementText", "setEndPoint", "compareEndPoints", "findText", "moveToPoint", "getBookmark", "moveToBookmark", "queryCommandSupported", "queryCommandEnabled", "queryCommandState", "queryCommandIndeterm", "queryCommandText", "queryCommandValue", "execCommand", "execCommandShowHelp"]

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_htmlText(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_text(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_text(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} parent 
     * @returns {HRESULT} 
     */
    parentElement(parent) {
        result := ComCall(10, this, "ptr*", parent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLTxtRange>} Duplicate 
     * @returns {HRESULT} 
     */
    duplicate(Duplicate) {
        result := ComCall(11, this, "ptr*", Duplicate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLTxtRange} Range 
     * @param {Pointer<VARIANT_BOOL>} InRange 
     * @returns {HRESULT} 
     */
    inRange(Range, InRange) {
        result := ComCall(12, this, "ptr", Range, "ptr", InRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLTxtRange} Range 
     * @param {Pointer<VARIANT_BOOL>} IsEqual 
     * @returns {HRESULT} 
     */
    isEqual(Range, IsEqual) {
        result := ComCall(13, this, "ptr", Range, "ptr", IsEqual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fStart 
     * @returns {HRESULT} 
     */
    scrollIntoView(fStart) {
        result := ComCall(14, this, "short", fStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Start 
     * @returns {HRESULT} 
     */
    collapse(Start) {
        result := ComCall(15, this, "short", Start, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Unit 
     * @param {Pointer<VARIANT_BOOL>} Success 
     * @returns {HRESULT} 
     */
    expand(Unit, Success) {
        Unit := Unit is String ? BSTR.Alloc(Unit).Value : Unit

        result := ComCall(16, this, "ptr", Unit, "ptr", Success, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Unit 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} ActualCount 
     * @returns {HRESULT} 
     */
    move(Unit, Count, ActualCount) {
        Unit := Unit is String ? BSTR.Alloc(Unit).Value : Unit

        result := ComCall(17, this, "ptr", Unit, "int", Count, "int*", ActualCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Unit 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} ActualCount 
     * @returns {HRESULT} 
     */
    moveStart(Unit, Count, ActualCount) {
        Unit := Unit is String ? BSTR.Alloc(Unit).Value : Unit

        result := ComCall(18, this, "ptr", Unit, "int", Count, "int*", ActualCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Unit 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} ActualCount 
     * @returns {HRESULT} 
     */
    moveEnd(Unit, Count, ActualCount) {
        Unit := Unit is String ? BSTR.Alloc(Unit).Value : Unit

        result := ComCall(19, this, "ptr", Unit, "int", Count, "int*", ActualCount, "HRESULT")
        return result
    }

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
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} html 
     * @returns {HRESULT} 
     */
    pasteHTML(html) {
        html := html is String ? BSTR.Alloc(html).Value : html

        result := ComCall(21, this, "ptr", html, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} element 
     * @returns {HRESULT} 
     */
    moveToElementText(element) {
        result := ComCall(22, this, "ptr", element, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} how 
     * @param {IHTMLTxtRange} SourceRange 
     * @returns {HRESULT} 
     */
    setEndPoint(how, SourceRange) {
        how := how is String ? BSTR.Alloc(how).Value : how

        result := ComCall(23, this, "ptr", how, "ptr", SourceRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} how 
     * @param {IHTMLTxtRange} SourceRange 
     * @param {Pointer<Integer>} ret 
     * @returns {HRESULT} 
     */
    compareEndPoints(how, SourceRange, ret) {
        how := how is String ? BSTR.Alloc(how).Value : how

        result := ComCall(24, this, "ptr", how, "ptr", SourceRange, "int*", ret, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} String 
     * @param {Integer} count 
     * @param {Integer} Flags 
     * @param {Pointer<VARIANT_BOOL>} Success 
     * @returns {HRESULT} 
     */
    findText(String, count, Flags, Success) {
        String := String is String ? BSTR.Alloc(String).Value : String

        result := ComCall(25, this, "ptr", String, "int", count, "int", Flags, "ptr", Success, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    moveToPoint(x, y) {
        result := ComCall(26, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Boolmark 
     * @returns {HRESULT} 
     */
    getBookmark(Boolmark) {
        result := ComCall(27, this, "ptr", Boolmark, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Bookmark 
     * @param {Pointer<VARIANT_BOOL>} Success 
     * @returns {HRESULT} 
     */
    moveToBookmark(Bookmark, Success) {
        Bookmark := Bookmark is String ? BSTR.Alloc(Bookmark).Value : Bookmark

        result := ComCall(28, this, "ptr", Bookmark, "ptr", Success, "HRESULT")
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

        result := ComCall(29, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
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

        result := ComCall(30, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
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

        result := ComCall(31, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
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

        result := ComCall(32, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
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

        result := ComCall(33, this, "ptr", cmdID, "ptr", pcmdText, "HRESULT")
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

        result := ComCall(34, this, "ptr", cmdID, "ptr", pcmdValue, "HRESULT")
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

        result := ComCall(35, this, "ptr", cmdID, "short", showUI, "ptr", value, "ptr", pfRet, "HRESULT")
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

        result := ComCall(36, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
        return result
    }
}
