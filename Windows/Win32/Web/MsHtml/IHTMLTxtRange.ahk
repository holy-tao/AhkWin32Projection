#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLTxtRange extends IDispatch {
    /**
     * The interface identifier for IHTMLTxtRange
     * @type {Guid}
     */
    static IID := Guid("{3050f220-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLTxtRange interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_htmlText          : IntPtr
        put_text              : IntPtr
        get_text              : IntPtr
        parentElement         : IntPtr
        duplicate             : IntPtr
        inRange               : IntPtr
        isEqual               : IntPtr
        scrollIntoView        : IntPtr
        collapse              : IntPtr
        expand                : IntPtr
        move                  : IntPtr
        moveStart             : IntPtr
        moveEnd               : IntPtr
        select                : IntPtr
        pasteHTML             : IntPtr
        moveToElementText     : IntPtr
        setEndPoint           : IntPtr
        compareEndPoints      : IntPtr
        findText              : IntPtr
        moveToPoint           : IntPtr
        getBookmark           : IntPtr
        moveToBookmark        : IntPtr
        queryCommandSupported : IntPtr
        queryCommandEnabled   : IntPtr
        queryCommandState     : IntPtr
        queryCommandIndeterm  : IntPtr
        queryCommandText      : IntPtr
        queryCommandValue     : IntPtr
        execCommand           : IntPtr
        execCommandShowHelp   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLTxtRange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    htmlText {
        get => this.get_htmlText()
    }

    /**
     * @type {BSTR} 
     */
    text {
        get => this.get_text()
        set => this.put_text(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_htmlText() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_text(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_text() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    parentElement() {
        result := ComCall(10, this, "ptr*", &parent := 0, "HRESULT")
        return IHTMLElement(parent)
    }

    /**
     * 
     * @returns {IHTMLTxtRange} 
     */
    duplicate() {
        result := ComCall(11, this, "ptr*", &Duplicate := 0, "HRESULT")
        return IHTMLTxtRange(Duplicate)
    }

    /**
     * 
     * @param {IHTMLTxtRange} Range 
     * @returns {VARIANT_BOOL} 
     */
    inRange(Range) {
        result := ComCall(12, this, "ptr", Range, VARIANT_BOOL.Ptr, &InRange := 0, "HRESULT")
        return InRange
    }

    /**
     * 
     * @param {IHTMLTxtRange} Range 
     * @returns {VARIANT_BOOL} 
     */
    isEqual(Range) {
        result := ComCall(13, this, "ptr", Range, VARIANT_BOOL.Ptr, &IsEqual := 0, "HRESULT")
        return IsEqual
    }

    /**
     * 
     * @param {VARIANT_BOOL} fStart 
     * @returns {HRESULT} 
     */
    scrollIntoView(fStart) {
        result := ComCall(14, this, VARIANT_BOOL, fStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Start 
     * @returns {HRESULT} 
     */
    collapse(Start) {
        result := ComCall(15, this, VARIANT_BOOL, Start, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _Unit 
     * @returns {VARIANT_BOOL} 
     */
    expand(_Unit) {
        _Unit := _Unit is String ? BSTR.Alloc(_Unit).Value : _Unit

        result := ComCall(16, this, BSTR, _Unit, VARIANT_BOOL.Ptr, &Success := 0, "HRESULT")
        return Success
    }

    /**
     * 
     * @param {BSTR} _Unit 
     * @param {Integer} Count 
     * @returns {Integer} 
     */
    move(_Unit, Count) {
        _Unit := _Unit is String ? BSTR.Alloc(_Unit).Value : _Unit

        result := ComCall(17, this, BSTR, _Unit, "int", Count, "int*", &ActualCount := 0, "HRESULT")
        return ActualCount
    }

    /**
     * 
     * @param {BSTR} _Unit 
     * @param {Integer} Count 
     * @returns {Integer} 
     */
    moveStart(_Unit, Count) {
        _Unit := _Unit is String ? BSTR.Alloc(_Unit).Value : _Unit

        result := ComCall(18, this, BSTR, _Unit, "int", Count, "int*", &ActualCount := 0, "HRESULT")
        return ActualCount
    }

    /**
     * 
     * @param {BSTR} _Unit 
     * @param {Integer} Count 
     * @returns {Integer} 
     */
    moveEnd(_Unit, Count) {
        _Unit := _Unit is String ? BSTR.Alloc(_Unit).Value : _Unit

        result := ComCall(19, this, BSTR, _Unit, "int", Count, "int*", &ActualCount := 0, "HRESULT")
        return ActualCount
    }

    /**
     * The select function determines the status of one or more sockets, waiting if necessary, to perform synchronous I/O.
     * @remarks
     * The 
     * <b>select</b> function is used to determine the status of one or more sockets. For each socket, the caller can request information on read, write, or error status. The set of sockets for which a given status is requested is indicated by an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-fd_set">fd_set</a> structure. The sockets contained within the 
     * <b>fd_set</b> structures must be associated with a single service provider. For the purpose of this restriction, sockets are considered to be from the same service provider if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAPROTOCOL_INFO</a> structures describing their protocols have the same <i>providerId</i> value. Upon return, the structures are updated to reflect the subset of these sockets that meet the specified condition. The 
     * <b>select</b> function returns the number of sockets meeting the conditions. A set of macros is provided for manipulating an 
     * <b>fd_set</b> structure. These macros are compatible with those used in the Berkeley software, but the underlying representation is completely different.
     * 
     * The parameter <i>readfds</i> identifies the sockets that are to be checked for readability. If the socket is currently in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-listen">listen</a> state, it will be marked as readable if an incoming connection request has been received such that an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-accept">accept</a> is guaranteed to complete without blocking. For other sockets, readability means that queued data is available for reading such that a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-recv">recv</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsarecv">WSARecv</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsarecvfrom">WSARecvFrom</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-recvfrom">recvfrom</a> is guaranteed not to block.
     * 
     * For connection-oriented sockets, readability can also indicate that a request to close the socket has been received from the peer. If the virtual circuit was closed gracefully, and all data was received, then a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-recv">recv</a> will return immediately with zero bytes read. If the virtual circuit was reset, then a 
     * <b>recv</b> will complete immediately with an error code such as 
     * <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAECONNRESET</a>. The presence of OOB data will be checked if the socket option SO_OOBINLINE has been enabled (see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-setsockopt">setsockopt</a>).
     * 
     * The parameter <i>writefds</i> identifies the sockets that are to be checked for writability. If a socket is processing a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-connect">connect</a> call (nonblocking), a socket is writable if the connection establishment successfully completes. If the socket is not processing a 
     * <b>connect</b> call, writability means a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-send">send</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-sendto">sendto</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsasendto">WSASendto</a> are guaranteed to succeed. However, they can block on a blocking socket if the <i>len</i> parameter exceeds the amount of outgoing system buffer space available. It is not specified how long these guarantees can be assumed to be valid, particularly in a multithreaded environment.
     * 
     * The parameter <i>exceptfds</i> identifies the sockets that are to be checked for the presence of OOB data or any exceptional error conditions.
     * 
     * <div class="alert"><b>Note</b>  Out-of-band data will only be reported in this way if the option SO_OOBINLINE is <b>FALSE</b>. If a socket is processing a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-connect">connect</a> call (nonblocking), failure of the connect attempt is indicated in <i>exceptfds</i> (application must then call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-getsockopt">getsockopt</a> SO_ERROR to determine the error value to describe why the failure occurred). This document does not define which other errors will be included.</div>
     * <div> </div>
     * Any two of the parameters, <i>readfds</i>, <i>writefds</i>, or <i>exceptfds</i>, can be given as <b>null</b>. At least one must be non-<b>null</b>, and any non-<b>null</b> descriptor set must contain at least one handle to a socket.
     * 
     * In summary, a socket will be identified in a particular set when 
     * <b>select</b> returns if:
     * 
     * <i>readfds</i>:
     * 
     * <ul>
     * <li>If 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-listen">listen</a> has been called and a connection is pending, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-accept">accept</a> will succeed.</li>
     * <li>Data is available for reading (includes OOB data if SO_OOBINLINE is enabled).</li>
     * <li>Connection has been closed/reset/terminated.</li>
     * </ul>
     * <i>writefds</i>:
     * 
     * <ul>
     * <li>If processing a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-connect">connect</a> call (nonblocking), connection has succeeded.</li>
     * <li>Data can be sent.</li>
     * </ul>
     * <i>exceptfds</i>:
     * 
     * <ul>
     * <li>If processing a 
     * <b>connect</b> call (nonblocking), connection attempt failed.</li>
     * <li>OOB data is available for reading (only if SO_OOBINLINE is disabled).</li>
     * </ul>
     * Four macros are defined in the header file Winsock2.h for manipulating and checking the descriptor sets. The variable FD_SETSIZE determines the maximum number of descriptors in a set. (The default value of FD_SETSIZE is 64, which can be modified by defining FD_SETSIZE to another value before including Winsock2.h.) Internally, socket handles in an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-fd_set">fd_set</a> structure are not represented as bit flags as in Berkeley Unix. Their data representation is opaque. Use of these macros will maintain software portability between different socket environments. The macros to manipulate and check 
     * <b>fd_set</b> contents are:
     * <ul>
     * <li><i>FD_ZERO(*set)</i> - Initializes set to the empty set. A set should always be cleared before using.</li>
     * <li><i>FD_CLR(s, *set)</i> - Removes socket s from set.</li>
     * <li><i>FD_ISSET(s, *set)</i> - Checks to see if s is a member of set and returns TRUE if so.</li>
     * <li><i>FD_SET(s, *set)</i> - Adds socket s to set.</li>
     * </ul>
     * 
     * 
     * The parameter <i>time-out</i> controls how long the 
     * <b>select</b> can take to complete. If <i>time-out</i> is a <b>null</b> pointer, 
     * <b>select</b> will block indefinitely until at least one descriptor meets the specified criteria. Otherwise, <i>time-out</i> points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/ns-winsock-timeval">TIMEVAL</a> structure that specifies the maximum time that 
     * <b>select</b> should wait before returning. When 
     * <b>select</b> returns, the contents of the <b>TIMEVAL</b> structure are not altered. If <b>TIMEVAL</b> is initialized to {0, 0}, 
     * <b>select</b> will return immediately; this is used to poll the state of the selected sockets. If 
     * <b>select</b> returns immediately, then the 
     * <b>select</b> call is considered nonblocking and the standard assumptions for nonblocking calls apply. For example, the blocking hook will not be called, and Windows Sockets will not yield.
     * 
     * <div class="alert"><b>Note</b>  The 
     * <b>select</b> function has no effect on the persistence of socket events registered with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsaasyncselect">WSAAsyncSelect</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaeventselect">WSAEventSelect</a>.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  When issuing a blocking Winsock call such as <b>select</b> with the <i>timeout</i> parameter set to <b>NULL</b>, Winsock may need to wait for a network event before the call can complete. Winsock performs an alertable wait in this situation, which can be interrupted by an asynchronous procedure call (APC) scheduled on the same thread. Issuing another blocking Winsock call inside an APC that interrupted an ongoing blocking Winsock call on the same thread will lead to undefined behavior, and must never be attempted by Winsock clients. </div>
     * <div> </div>
     * <b>Windows Phone 8:</b> This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
     * 
     * <b>Windows 8.1</b> and <b>Windows Server 2012 R2</b>: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
     * @returns {HRESULT} The 
     * <b>select</b> function returns the total number of socket handles that are ready and contained in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-fd_set">fd_set</a> structures, zero if the time limit expired, or SOCKET_ERROR if an error occurred. If the return value is SOCKET_ERROR, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsagetlasterror">WSAGetLastError</a> can be used to retrieve a specific error code.
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSANOTINITIALISED</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A successful 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsastartup">WSAStartup</a> call must occur before using this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEFAULT</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENETDOWN</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINVAL</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINTR</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A blocking Windows Socket 1.1 call was canceled through 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsacancelblockingcall">WSACancelBlockingCall</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINPROGRESS</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENOTSOCK</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the descriptor sets contains an entry that is not a socket.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsock2/nf-winsock2-select
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

        result := ComCall(21, this, BSTR, html, "HRESULT")
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

        result := ComCall(23, this, BSTR, how, "ptr", SourceRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} how 
     * @param {IHTMLTxtRange} SourceRange 
     * @returns {Integer} 
     */
    compareEndPoints(how, SourceRange) {
        how := how is String ? BSTR.Alloc(how).Value : how

        result := ComCall(24, this, BSTR, how, "ptr", SourceRange, "int*", &ret := 0, "HRESULT")
        return ret
    }

    /**
     * 
     * @param {BSTR} _String 
     * @param {Integer} count 
     * @param {Integer} Flags 
     * @returns {VARIANT_BOOL} 
     */
    findText(_String, count, Flags) {
        _String := _String is String ? BSTR.Alloc(_String).Value : _String

        result := ComCall(25, this, BSTR, _String, "int", count, "int", Flags, VARIANT_BOOL.Ptr, &Success := 0, "HRESULT")
        return Success
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
     * @returns {BSTR} 
     */
    getBookmark() {
        Boolmark := BSTR.Owned()
        result := ComCall(27, this, BSTR.Ptr, Boolmark, "HRESULT")
        return Boolmark
    }

    /**
     * 
     * @param {BSTR} Bookmark 
     * @returns {VARIANT_BOOL} 
     */
    moveToBookmark(Bookmark) {
        Bookmark := Bookmark is String ? BSTR.Alloc(Bookmark).Value : Bookmark

        result := ComCall(28, this, BSTR, Bookmark, VARIANT_BOOL.Ptr, &Success := 0, "HRESULT")
        return Success
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandSupported(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(29, this, BSTR, cmdID, VARIANT_BOOL.Ptr, &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandEnabled(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(30, this, BSTR, cmdID, VARIANT_BOOL.Ptr, &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandState(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(31, this, BSTR, cmdID, VARIANT_BOOL.Ptr, &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandIndeterm(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(32, this, BSTR, cmdID, VARIANT_BOOL.Ptr, &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {BSTR} 
     */
    queryCommandText(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        pcmdText := BSTR.Owned()
        result := ComCall(33, this, BSTR, cmdID, BSTR.Ptr, pcmdText, "HRESULT")
        return pcmdText
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT} 
     */
    queryCommandValue(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        pcmdValue := VARIANT()
        result := ComCall(34, this, BSTR, cmdID, VARIANT.Ptr, pcmdValue, "HRESULT")
        return pcmdValue
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {VARIANT_BOOL} showUI 
     * @param {VARIANT} value 
     * @returns {VARIANT_BOOL} 
     */
    execCommand(cmdID, showUI, value) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(35, this, BSTR, cmdID, VARIANT_BOOL, showUI, VARIANT, value, VARIANT_BOOL.Ptr, &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    execCommandShowHelp(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(36, this, BSTR, cmdID, VARIANT_BOOL.Ptr, &pfRet := 0, "HRESULT")
        return pfRet
    }

    Query(iid) {
        if (IHTMLTxtRange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_htmlText := CallbackCreate(GetMethod(implObj, "get_htmlText"), flags, 2)
        this.vtbl.put_text := CallbackCreate(GetMethod(implObj, "put_text"), flags, 2)
        this.vtbl.get_text := CallbackCreate(GetMethod(implObj, "get_text"), flags, 2)
        this.vtbl.parentElement := CallbackCreate(GetMethod(implObj, "parentElement"), flags, 2)
        this.vtbl.duplicate := CallbackCreate(GetMethod(implObj, "duplicate"), flags, 2)
        this.vtbl.inRange := CallbackCreate(GetMethod(implObj, "inRange"), flags, 3)
        this.vtbl.isEqual := CallbackCreate(GetMethod(implObj, "isEqual"), flags, 3)
        this.vtbl.scrollIntoView := CallbackCreate(GetMethod(implObj, "scrollIntoView"), flags, 2)
        this.vtbl.collapse := CallbackCreate(GetMethod(implObj, "collapse"), flags, 2)
        this.vtbl.expand := CallbackCreate(GetMethod(implObj, "expand"), flags, 3)
        this.vtbl.move := CallbackCreate(GetMethod(implObj, "move"), flags, 4)
        this.vtbl.moveStart := CallbackCreate(GetMethod(implObj, "moveStart"), flags, 4)
        this.vtbl.moveEnd := CallbackCreate(GetMethod(implObj, "moveEnd"), flags, 4)
        this.vtbl.select := CallbackCreate(GetMethod(implObj, "select"), flags, 1)
        this.vtbl.pasteHTML := CallbackCreate(GetMethod(implObj, "pasteHTML"), flags, 2)
        this.vtbl.moveToElementText := CallbackCreate(GetMethod(implObj, "moveToElementText"), flags, 2)
        this.vtbl.setEndPoint := CallbackCreate(GetMethod(implObj, "setEndPoint"), flags, 3)
        this.vtbl.compareEndPoints := CallbackCreate(GetMethod(implObj, "compareEndPoints"), flags, 4)
        this.vtbl.findText := CallbackCreate(GetMethod(implObj, "findText"), flags, 5)
        this.vtbl.moveToPoint := CallbackCreate(GetMethod(implObj, "moveToPoint"), flags, 3)
        this.vtbl.getBookmark := CallbackCreate(GetMethod(implObj, "getBookmark"), flags, 2)
        this.vtbl.moveToBookmark := CallbackCreate(GetMethod(implObj, "moveToBookmark"), flags, 3)
        this.vtbl.queryCommandSupported := CallbackCreate(GetMethod(implObj, "queryCommandSupported"), flags, 3)
        this.vtbl.queryCommandEnabled := CallbackCreate(GetMethod(implObj, "queryCommandEnabled"), flags, 3)
        this.vtbl.queryCommandState := CallbackCreate(GetMethod(implObj, "queryCommandState"), flags, 3)
        this.vtbl.queryCommandIndeterm := CallbackCreate(GetMethod(implObj, "queryCommandIndeterm"), flags, 3)
        this.vtbl.queryCommandText := CallbackCreate(GetMethod(implObj, "queryCommandText"), flags, 3)
        this.vtbl.queryCommandValue := CallbackCreate(GetMethod(implObj, "queryCommandValue"), flags, 3)
        this.vtbl.execCommand := CallbackCreate(GetMethod(implObj, "execCommand"), flags, 5)
        this.vtbl.execCommandShowHelp := CallbackCreate(GetMethod(implObj, "execCommandShowHelp"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_htmlText)
        CallbackFree(this.vtbl.put_text)
        CallbackFree(this.vtbl.get_text)
        CallbackFree(this.vtbl.parentElement)
        CallbackFree(this.vtbl.duplicate)
        CallbackFree(this.vtbl.inRange)
        CallbackFree(this.vtbl.isEqual)
        CallbackFree(this.vtbl.scrollIntoView)
        CallbackFree(this.vtbl.collapse)
        CallbackFree(this.vtbl.expand)
        CallbackFree(this.vtbl.move)
        CallbackFree(this.vtbl.moveStart)
        CallbackFree(this.vtbl.moveEnd)
        CallbackFree(this.vtbl.select)
        CallbackFree(this.vtbl.pasteHTML)
        CallbackFree(this.vtbl.moveToElementText)
        CallbackFree(this.vtbl.setEndPoint)
        CallbackFree(this.vtbl.compareEndPoints)
        CallbackFree(this.vtbl.findText)
        CallbackFree(this.vtbl.moveToPoint)
        CallbackFree(this.vtbl.getBookmark)
        CallbackFree(this.vtbl.moveToBookmark)
        CallbackFree(this.vtbl.queryCommandSupported)
        CallbackFree(this.vtbl.queryCommandEnabled)
        CallbackFree(this.vtbl.queryCommandState)
        CallbackFree(this.vtbl.queryCommandIndeterm)
        CallbackFree(this.vtbl.queryCommandText)
        CallbackFree(this.vtbl.queryCommandValue)
        CallbackFree(this.vtbl.execCommand)
        CallbackFree(this.vtbl.execCommandShowHelp)
    }
}
