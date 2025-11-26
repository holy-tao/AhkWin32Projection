#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLFormElement.ahk
#Include .\IHTMLTxtRange.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLInputTextElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLInputTextElement
     * @type {Guid}
     */
    static IID => Guid("{3050f2a6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLInputTextElement
     * @type {Guid}
     */
    static CLSID => Guid("{3050f2ab-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_type", "put_value", "get_value", "put_name", "get_name", "put_status", "get_status", "put_disabled", "get_disabled", "get_form", "put_defaultValue", "get_defaultValue", "put_size", "get_size", "put_maxLength", "get_maxLength", "select", "put_onchange", "get_onchange", "put_onselect", "get_onselect", "put_readOnly", "get_readOnly", "createTextRange"]

    /**
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
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
     * @type {VARIANT} 
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
     * @type {BSTR} 
     */
    defaultValue {
        get => this.get_defaultValue()
        set => this.put_defaultValue(value)
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
     * @type {VARIANT_BOOL} 
     */
    readOnly {
        get => this.get_readOnly()
        set => this.put_readOnly(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_value() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_status(v) {
        result := ComCall(12, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_status() {
        p := VARIANT()
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_disabled(v) {
        result := ComCall(14, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_disabled() {
        result := ComCall(15, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLFormElement} 
     */
    get_form() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFormElement(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_defaultValue(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_defaultValue() {
        p := BSTR()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_size(v) {
        result := ComCall(19, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_size() {
        result := ComCall(20, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_maxLength(v) {
        result := ComCall(21, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_maxLength() {
        result := ComCall(22, this, "int*", &p := 0, "HRESULT")
        return p
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
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onchange(v) {
        result := ComCall(24, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onchange() {
        p := VARIANT()
        result := ComCall(25, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselect(v) {
        result := ComCall(26, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onselect() {
        p := VARIANT()
        result := ComCall(27, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_readOnly(v) {
        result := ComCall(28, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_readOnly() {
        result := ComCall(29, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLTxtRange} 
     */
    createTextRange() {
        result := ComCall(30, this, "ptr*", &range := 0, "HRESULT")
        return IHTMLTxtRange(range)
    }
}
