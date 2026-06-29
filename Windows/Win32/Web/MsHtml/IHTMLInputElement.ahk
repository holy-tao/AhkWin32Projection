#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLFormElement.ahk" { IHTMLFormElement }
#Import ".\IHTMLTxtRange.ahk" { IHTMLTxtRange }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLInputElement extends IDispatch {
    /**
     * The interface identifier for IHTMLInputElement
     * @type {Guid}
     */
    static IID := Guid("{3050f5d2-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLInputElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f5d8-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLInputElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_type           : IntPtr
        get_type           : IntPtr
        put_value          : IntPtr
        get_value          : IntPtr
        put_name           : IntPtr
        get_name           : IntPtr
        put_status         : IntPtr
        get_status         : IntPtr
        put_disabled       : IntPtr
        get_disabled       : IntPtr
        get_form           : IntPtr
        put_size           : IntPtr
        get_size           : IntPtr
        put_maxLength      : IntPtr
        get_maxLength      : IntPtr
        select             : IntPtr
        put_onchange       : IntPtr
        get_onchange       : IntPtr
        put_onselect       : IntPtr
        get_onselect       : IntPtr
        put_defaultValue   : IntPtr
        get_defaultValue   : IntPtr
        put_readOnly       : IntPtr
        get_readOnly       : IntPtr
        createTextRange    : IntPtr
        put_indeterminate  : IntPtr
        get_indeterminate  : IntPtr
        put_defaultChecked : IntPtr
        get_defaultChecked : IntPtr
        put_checked        : IntPtr
        get_checked        : IntPtr
        put_border         : IntPtr
        get_border         : IntPtr
        put_vspace         : IntPtr
        get_vspace         : IntPtr
        put_hspace         : IntPtr
        get_hspace         : IntPtr
        put_alt            : IntPtr
        get_alt            : IntPtr
        put_src            : IntPtr
        get_src            : IntPtr
        put_lowsrc         : IntPtr
        get_lowsrc         : IntPtr
        put_vrml           : IntPtr
        get_vrml           : IntPtr
        put_dynsrc         : IntPtr
        get_dynsrc         : IntPtr
        get_readyState     : IntPtr
        get_complete       : IntPtr
        put_loop           : IntPtr
        get_loop           : IntPtr
        put_align          : IntPtr
        get_align          : IntPtr
        put_onload         : IntPtr
        get_onload         : IntPtr
        put_onerror        : IntPtr
        get_onerror        : IntPtr
        put_onabort        : IntPtr
        get_onabort        : IntPtr
        put_width          : IntPtr
        get_width          : IntPtr
        put_height         : IntPtr
        get_height         : IntPtr
        put_start          : IntPtr
        get_start          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLInputElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
        set => this.put_type(value)
    }

    /**
     * @type {BSTR} 
     */
    value {
        get => this.get_value()
        set => this.put_value(value)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
        set => this.put_name(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    status {
        get => this.get_status()
        set => this.put_status(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    disabled {
        get => this.get_disabled()
        set => this.put_disabled(value)
    }

    /**
     * @type {IHTMLFormElement} 
     */
    form {
        get => this.get_form()
    }

    /**
     * @type {Integer} 
     */
    size {
        get => this.get_size()
        set => this.put_size(value)
    }

    /**
     * @type {Integer} 
     */
    maxLength {
        get => this.get_maxLength()
        set => this.put_maxLength(value)
    }

    /**
     * @type {VARIANT} 
     */
    onchange {
        get => this.get_onchange()
        set => this.put_onchange(value)
    }

    /**
     * @type {VARIANT} 
     */
    onselect {
        get => this.get_onselect()
        set => this.put_onselect(value)
    }

    /**
     * @type {BSTR} 
     */
    defaultValue {
        get => this.get_defaultValue()
        set => this.put_defaultValue(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    readOnly {
        get => this.get_readOnly()
        set => this.put_readOnly(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    indeterminate {
        get => this.get_indeterminate()
        set => this.put_indeterminate(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    defaultChecked {
        get => this.get_defaultChecked()
        set => this.put_defaultChecked(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    checked {
        get => this.get_checked()
        set => this.put_checked(value)
    }

    /**
     * @type {VARIANT} 
     */
    border {
        get => this.get_border()
        set => this.put_border(value)
    }

    /**
     * @type {Integer} 
     */
    vspace {
        get => this.get_vspace()
        set => this.put_vspace(value)
    }

    /**
     * @type {Integer} 
     */
    hspace {
        get => this.get_hspace()
        set => this.put_hspace(value)
    }

    /**
     * @type {BSTR} 
     */
    alt {
        get => this.get_alt()
        set => this.put_alt(value)
    }

    /**
     * @type {BSTR} 
     */
    src {
        get => this.get_src()
        set => this.put_src(value)
    }

    /**
     * @type {BSTR} 
     */
    lowsrc {
        get => this.get_lowsrc()
        set => this.put_lowsrc(value)
    }

    /**
     * @type {BSTR} 
     */
    vrml {
        get => this.get_vrml()
        set => this.put_vrml(value)
    }

    /**
     * @type {BSTR} 
     */
    dynsrc {
        get => this.get_dynsrc()
        set => this.put_dynsrc(value)
    }

    /**
     * @type {BSTR} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    complete {
        get => this.get_complete()
    }

    /**
     * @type {VARIANT} 
     */
    loop {
        get => this.get_loop()
        set => this.put_loop(value)
    }

    /**
     * @type {BSTR} 
     */
    align {
        get => this.get_align()
        set => this.put_align(value)
    }

    /**
     * @type {VARIANT} 
     */
    onload {
        get => this.get_onload()
        set => this.put_onload(value)
    }

    /**
     * @type {VARIANT} 
     */
    onerror {
        get => this.get_onerror()
        set => this.put_onerror(value)
    }

    /**
     * @type {VARIANT} 
     */
    onabort {
        get => this.get_onabort()
        set => this.put_onabort(value)
    }

    /**
     * @type {Integer} 
     */
    width {
        get => this.get_width()
        set => this.put_width(value)
    }

    /**
     * @type {Integer} 
     */
    height {
        get => this.get_height()
        set => this.put_height(value)
    }

    /**
     * @type {BSTR} 
     */
    start {
        get => this.get_start()
        set => this.put_start(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_type(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_value() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_status(v) {
        result := ComCall(13, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_status() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_disabled(v) {
        result := ComCall(15, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_disabled() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLFormElement} 
     */
    get_form() {
        result := ComCall(17, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFormElement(p)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_size(v) {
        result := ComCall(18, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_size() {
        result := ComCall(19, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_maxLength(v) {
        result := ComCall(20, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_maxLength() {
        result := ComCall(21, this, "int*", &p := 0, "HRESULT")
        return p
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
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onchange(v) {
        result := ComCall(23, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onchange() {
        p := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselect(v) {
        result := ComCall(25, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onselect() {
        p := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_defaultValue(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_defaultValue() {
        p := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_readOnly(v) {
        result := ComCall(29, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_readOnly() {
        result := ComCall(30, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLTxtRange} 
     */
    createTextRange() {
        result := ComCall(31, this, "ptr*", &range := 0, "HRESULT")
        return IHTMLTxtRange(range)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_indeterminate(v) {
        result := ComCall(32, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_indeterminate() {
        result := ComCall(33, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_defaultChecked(v) {
        result := ComCall(34, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_defaultChecked() {
        result := ComCall(35, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_checked(v) {
        result := ComCall(36, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_checked() {
        result := ComCall(37, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_border(v) {
        result := ComCall(38, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_border() {
        p := VARIANT()
        result := ComCall(39, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_vspace(v) {
        result := ComCall(40, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_vspace() {
        result := ComCall(41, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_hspace(v) {
        result := ComCall(42, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_hspace() {
        result := ComCall(43, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_alt(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(44, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_alt() {
        p := BSTR.Owned()
        result := ComCall(45, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_src(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(46, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_src() {
        p := BSTR.Owned()
        result := ComCall(47, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lowsrc(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(48, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lowsrc() {
        p := BSTR.Owned()
        result := ComCall(49, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_vrml(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(50, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_vrml() {
        p := BSTR.Owned()
        result := ComCall(51, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dynsrc(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(52, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dynsrc() {
        p := BSTR.Owned()
        result := ComCall(53, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_readyState() {
        p := BSTR.Owned()
        result := ComCall(54, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_complete() {
        result := ComCall(55, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_loop(v) {
        result := ComCall(56, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_loop() {
        p := VARIANT()
        result := ComCall(57, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(58, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_align() {
        p := BSTR.Owned()
        result := ComCall(59, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onload(v) {
        result := ComCall(60, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onload() {
        p := VARIANT()
        result := ComCall(61, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerror(v) {
        result := ComCall(62, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerror() {
        p := VARIANT()
        result := ComCall(63, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onabort(v) {
        result := ComCall(64, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onabort() {
        p := VARIANT()
        result := ComCall(65, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(66, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_width() {
        result := ComCall(67, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(68, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_height() {
        result := ComCall(69, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_start(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(70, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_start() {
        p := BSTR.Owned()
        result := ComCall(71, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLInputElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_type := CallbackCreate(GetMethod(implObj, "put_type"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.put_value := CallbackCreate(GetMethod(implObj, "put_value"), flags, 2)
        this.vtbl.get_value := CallbackCreate(GetMethod(implObj, "get_value"), flags, 2)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.put_status := CallbackCreate(GetMethod(implObj, "put_status"), flags, 2)
        this.vtbl.get_status := CallbackCreate(GetMethod(implObj, "get_status"), flags, 2)
        this.vtbl.put_disabled := CallbackCreate(GetMethod(implObj, "put_disabled"), flags, 2)
        this.vtbl.get_disabled := CallbackCreate(GetMethod(implObj, "get_disabled"), flags, 2)
        this.vtbl.get_form := CallbackCreate(GetMethod(implObj, "get_form"), flags, 2)
        this.vtbl.put_size := CallbackCreate(GetMethod(implObj, "put_size"), flags, 2)
        this.vtbl.get_size := CallbackCreate(GetMethod(implObj, "get_size"), flags, 2)
        this.vtbl.put_maxLength := CallbackCreate(GetMethod(implObj, "put_maxLength"), flags, 2)
        this.vtbl.get_maxLength := CallbackCreate(GetMethod(implObj, "get_maxLength"), flags, 2)
        this.vtbl.select := CallbackCreate(GetMethod(implObj, "select"), flags, 1)
        this.vtbl.put_onchange := CallbackCreate(GetMethod(implObj, "put_onchange"), flags, 2)
        this.vtbl.get_onchange := CallbackCreate(GetMethod(implObj, "get_onchange"), flags, 2)
        this.vtbl.put_onselect := CallbackCreate(GetMethod(implObj, "put_onselect"), flags, 2)
        this.vtbl.get_onselect := CallbackCreate(GetMethod(implObj, "get_onselect"), flags, 2)
        this.vtbl.put_defaultValue := CallbackCreate(GetMethod(implObj, "put_defaultValue"), flags, 2)
        this.vtbl.get_defaultValue := CallbackCreate(GetMethod(implObj, "get_defaultValue"), flags, 2)
        this.vtbl.put_readOnly := CallbackCreate(GetMethod(implObj, "put_readOnly"), flags, 2)
        this.vtbl.get_readOnly := CallbackCreate(GetMethod(implObj, "get_readOnly"), flags, 2)
        this.vtbl.createTextRange := CallbackCreate(GetMethod(implObj, "createTextRange"), flags, 2)
        this.vtbl.put_indeterminate := CallbackCreate(GetMethod(implObj, "put_indeterminate"), flags, 2)
        this.vtbl.get_indeterminate := CallbackCreate(GetMethod(implObj, "get_indeterminate"), flags, 2)
        this.vtbl.put_defaultChecked := CallbackCreate(GetMethod(implObj, "put_defaultChecked"), flags, 2)
        this.vtbl.get_defaultChecked := CallbackCreate(GetMethod(implObj, "get_defaultChecked"), flags, 2)
        this.vtbl.put_checked := CallbackCreate(GetMethod(implObj, "put_checked"), flags, 2)
        this.vtbl.get_checked := CallbackCreate(GetMethod(implObj, "get_checked"), flags, 2)
        this.vtbl.put_border := CallbackCreate(GetMethod(implObj, "put_border"), flags, 2)
        this.vtbl.get_border := CallbackCreate(GetMethod(implObj, "get_border"), flags, 2)
        this.vtbl.put_vspace := CallbackCreate(GetMethod(implObj, "put_vspace"), flags, 2)
        this.vtbl.get_vspace := CallbackCreate(GetMethod(implObj, "get_vspace"), flags, 2)
        this.vtbl.put_hspace := CallbackCreate(GetMethod(implObj, "put_hspace"), flags, 2)
        this.vtbl.get_hspace := CallbackCreate(GetMethod(implObj, "get_hspace"), flags, 2)
        this.vtbl.put_alt := CallbackCreate(GetMethod(implObj, "put_alt"), flags, 2)
        this.vtbl.get_alt := CallbackCreate(GetMethod(implObj, "get_alt"), flags, 2)
        this.vtbl.put_src := CallbackCreate(GetMethod(implObj, "put_src"), flags, 2)
        this.vtbl.get_src := CallbackCreate(GetMethod(implObj, "get_src"), flags, 2)
        this.vtbl.put_lowsrc := CallbackCreate(GetMethod(implObj, "put_lowsrc"), flags, 2)
        this.vtbl.get_lowsrc := CallbackCreate(GetMethod(implObj, "get_lowsrc"), flags, 2)
        this.vtbl.put_vrml := CallbackCreate(GetMethod(implObj, "put_vrml"), flags, 2)
        this.vtbl.get_vrml := CallbackCreate(GetMethod(implObj, "get_vrml"), flags, 2)
        this.vtbl.put_dynsrc := CallbackCreate(GetMethod(implObj, "put_dynsrc"), flags, 2)
        this.vtbl.get_dynsrc := CallbackCreate(GetMethod(implObj, "get_dynsrc"), flags, 2)
        this.vtbl.get_readyState := CallbackCreate(GetMethod(implObj, "get_readyState"), flags, 2)
        this.vtbl.get_complete := CallbackCreate(GetMethod(implObj, "get_complete"), flags, 2)
        this.vtbl.put_loop := CallbackCreate(GetMethod(implObj, "put_loop"), flags, 2)
        this.vtbl.get_loop := CallbackCreate(GetMethod(implObj, "get_loop"), flags, 2)
        this.vtbl.put_align := CallbackCreate(GetMethod(implObj, "put_align"), flags, 2)
        this.vtbl.get_align := CallbackCreate(GetMethod(implObj, "get_align"), flags, 2)
        this.vtbl.put_onload := CallbackCreate(GetMethod(implObj, "put_onload"), flags, 2)
        this.vtbl.get_onload := CallbackCreate(GetMethod(implObj, "get_onload"), flags, 2)
        this.vtbl.put_onerror := CallbackCreate(GetMethod(implObj, "put_onerror"), flags, 2)
        this.vtbl.get_onerror := CallbackCreate(GetMethod(implObj, "get_onerror"), flags, 2)
        this.vtbl.put_onabort := CallbackCreate(GetMethod(implObj, "put_onabort"), flags, 2)
        this.vtbl.get_onabort := CallbackCreate(GetMethod(implObj, "get_onabort"), flags, 2)
        this.vtbl.put_width := CallbackCreate(GetMethod(implObj, "put_width"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.put_height := CallbackCreate(GetMethod(implObj, "put_height"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.put_start := CallbackCreate(GetMethod(implObj, "put_start"), flags, 2)
        this.vtbl.get_start := CallbackCreate(GetMethod(implObj, "get_start"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_type)
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.put_value)
        CallbackFree(this.vtbl.get_value)
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.put_status)
        CallbackFree(this.vtbl.get_status)
        CallbackFree(this.vtbl.put_disabled)
        CallbackFree(this.vtbl.get_disabled)
        CallbackFree(this.vtbl.get_form)
        CallbackFree(this.vtbl.put_size)
        CallbackFree(this.vtbl.get_size)
        CallbackFree(this.vtbl.put_maxLength)
        CallbackFree(this.vtbl.get_maxLength)
        CallbackFree(this.vtbl.select)
        CallbackFree(this.vtbl.put_onchange)
        CallbackFree(this.vtbl.get_onchange)
        CallbackFree(this.vtbl.put_onselect)
        CallbackFree(this.vtbl.get_onselect)
        CallbackFree(this.vtbl.put_defaultValue)
        CallbackFree(this.vtbl.get_defaultValue)
        CallbackFree(this.vtbl.put_readOnly)
        CallbackFree(this.vtbl.get_readOnly)
        CallbackFree(this.vtbl.createTextRange)
        CallbackFree(this.vtbl.put_indeterminate)
        CallbackFree(this.vtbl.get_indeterminate)
        CallbackFree(this.vtbl.put_defaultChecked)
        CallbackFree(this.vtbl.get_defaultChecked)
        CallbackFree(this.vtbl.put_checked)
        CallbackFree(this.vtbl.get_checked)
        CallbackFree(this.vtbl.put_border)
        CallbackFree(this.vtbl.get_border)
        CallbackFree(this.vtbl.put_vspace)
        CallbackFree(this.vtbl.get_vspace)
        CallbackFree(this.vtbl.put_hspace)
        CallbackFree(this.vtbl.get_hspace)
        CallbackFree(this.vtbl.put_alt)
        CallbackFree(this.vtbl.get_alt)
        CallbackFree(this.vtbl.put_src)
        CallbackFree(this.vtbl.get_src)
        CallbackFree(this.vtbl.put_lowsrc)
        CallbackFree(this.vtbl.get_lowsrc)
        CallbackFree(this.vtbl.put_vrml)
        CallbackFree(this.vtbl.get_vrml)
        CallbackFree(this.vtbl.put_dynsrc)
        CallbackFree(this.vtbl.get_dynsrc)
        CallbackFree(this.vtbl.get_readyState)
        CallbackFree(this.vtbl.get_complete)
        CallbackFree(this.vtbl.put_loop)
        CallbackFree(this.vtbl.get_loop)
        CallbackFree(this.vtbl.put_align)
        CallbackFree(this.vtbl.get_align)
        CallbackFree(this.vtbl.put_onload)
        CallbackFree(this.vtbl.get_onload)
        CallbackFree(this.vtbl.put_onerror)
        CallbackFree(this.vtbl.get_onerror)
        CallbackFree(this.vtbl.put_onabort)
        CallbackFree(this.vtbl.get_onabort)
        CallbackFree(this.vtbl.put_width)
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.put_height)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.put_start)
        CallbackFree(this.vtbl.get_start)
    }
}
