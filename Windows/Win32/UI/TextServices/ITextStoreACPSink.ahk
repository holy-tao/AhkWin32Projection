#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TEXT_STORE_LOCK_FLAGS.ahk" { TEXT_STORE_LOCK_FLAGS }
#Import ".\TEXT_STORE_TEXT_CHANGE_FLAGS.ahk" { TEXT_STORE_TEXT_CHANGE_FLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\TS_TEXTCHANGE.ahk" { TS_TEXTCHANGE }
#Import ".\TsLayoutCode.ahk" { TsLayoutCode }

/**
 * The ITextStoreACPSink interface is implemented by the TSF manager and is used by an ACP-based application to notify the manager when certain events occur. The manager installs this advise sink by calling ITextStoreACP::AdviseSink.
 * @see https://learn.microsoft.com/windows/win32/api/textstor/nn-textstor-itextstoreacpsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITextStoreACPSink extends IUnknown {
    /**
     * The interface identifier for ITextStoreACPSink
     * @type {Guid}
     */
    static IID := Guid("{22d44c94-a419-4542-a272-ae26093ececf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextStoreACPSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnTextChange           : IntPtr
        OnSelectionChange      : IntPtr
        OnLayoutChange         : IntPtr
        OnStatusChange         : IntPtr
        OnAttrsChange          : IntPtr
        OnLockGranted          : IntPtr
        OnStartEditTransaction : IntPtr
        OnEndEditTransaction   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextStoreACPSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITextStoreACPSink::OnTextChange method
     * @remarks
     * <b>ITextStoreACPSink::OnTextChange</b> is never called when the text is modified by one of the <b>ITextStoreACP</b> interface methods, such as <b>ITextStoreACP::SetText</b> or <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp-inserttextatselection">ITextStoreACP::InsertTextAtSelection</a>.
     * 
     * When calling this method, the application must be able to grant a <a href="https://docs.microsoft.com/windows/desktop/TSF/document-locks">document lock</a>.
     * @param {TEXT_STORE_TEXT_CHANGE_FLAGS} dwFlags 
     * @param {Pointer<TS_TEXTCHANGE>} pChange Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_textchange">TS_TEXTCHANGE</a> structure that contains text change data.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pChange</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failure occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TSF manager holds a lock on the document. This typically indicates that the method was called from within another <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nn-textstor-itextstoreacp">ITextStoreACP</a> method, such as <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp-settext">ITextStoreACP::SetText</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-ontextchange
     */
    OnTextChange(dwFlags, pChange) {
        result := ComCall(3, this, TEXT_STORE_TEXT_CHANGE_FLAGS, dwFlags, TS_TEXTCHANGE.Ptr, pChange, "HRESULT")
        return result
    }

    /**
     * ITextStoreACPSink::OnSelectionChange method
     * @remarks
     * <b>ITextStoreACPSink::OnSelectionChange</b> is never called when the selection is modified by one of the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nn-textstor-itextstoreacp">ITextStoreACP</a> interface methods, such as <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp-setselection">ITextStoreACP::SetSelection</a> or <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp-inserttextatselection">ITextStoreACP::InsertTextAtSelection</a>.
     * 
     * When calling this method, the application must be able to grant a <a href="https://docs.microsoft.com/windows/desktop/TSF/document-locks">document lock</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The manager holds a lock on the document.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-onselectionchange
     */
    OnSelectionChange() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * ITextStoreACPSink::OnLayoutChange method
     * @remarks
     * A layout change can be in response to a change to the text, font size, window movement, window resizing, or other change that affects the displayed text.
     * 
     * If a call to <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp-gettextext">ITextStoreACP::GetTextExt</a> or <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp-getacpfrompoint">ITextStoreACP::GetACPFromPoint</a> returns TS_E_NOLAYOUT because the application has not calculated the layout, the application must call <b>ITextStoreACPSink::OnLayoutChange</b> when the layout is available.
     * @param {TsLayoutCode} lcode Contains a <a href="https://docs.microsoft.com/windows/win32/api/textstor/ne-textstor-tslayoutcode">TsLayoutCode</a> value that defines the type of change.
     * @param {Integer} vcView Contains an application-defined cookie that identifies the document. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp-getactiveview">ITextStoreACP::GetActiveView</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-onlayoutchange
     */
    OnLayoutChange(lcode, vcView) {
        result := ComCall(5, this, TsLayoutCode, lcode, "uint", vcView, "HRESULT")
        return result
    }

    /**
     * ITextStoreACPSink::OnStatusChange method
     * @param {Integer} dwFlags Contains a value that specifies the new status. For more information about possible values, see the <b>dwDynamicFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_status">TS_STATUS</a> structure.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-onstatuschange
     */
    OnStatusChange(dwFlags) {
        result := ComCall(6, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * ITextStoreACPSink::OnAttrsChange method
     * @param {Integer} acpStart Specifies the starting point of the attribute change.
     * @param {Integer} acpEnd Specifies the ending point of the attribute change.
     * @param {Integer} cAttrs Specifies the number of attributes in the <i>paAttrs</i> array.
     * @param {Pointer<Guid>} paAttrs Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/TSF/ts-attrid">TS_ATTRID</a> values that identify the attributes changed.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failure occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-onattrschange
     */
    OnAttrsChange(acpStart, acpEnd, cAttrs, paAttrs) {
        result := ComCall(7, this, "int", acpStart, "int", acpEnd, "uint", cAttrs, Guid.Ptr, paAttrs, "HRESULT")
        return result
    }

    /**
     * ITextStoreACPSink::OnLockGranted method
     * @remarks
     * A document lock is requested by calling <b>ITextStoreACP::RequestLock</b> . The application grants the lock request by calling <b>ITextStoreACPSink::OnLockGranted</b> with the requested lock type. The lock is only valid during the <b>OnLockGranted</b> call. When <b>OnLockGranted</b> returns, the document is considered unlocked.
     * 
     * The lock type, specified in <i>dwLockFlags</i>, must match the requested lock type in the corresponding call to <b>ITextStoreACP::RequestLock</b>.
     * 
     * If a synchronous lock request is made from within <b>ITextStoreACP::RequestLock</b>, then the caller must also provide the return value from <b>ITextStoreACP::RequestLock</b>.
     * @param {TEXT_STORE_LOCK_FLAGS} dwLockFlags 
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwLockFlags</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wrong type of lock was granted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-onlockgranted
     */
    OnLockGranted(dwLockFlags) {
        result := ComCall(8, this, TEXT_STORE_LOCK_FLAGS, dwLockFlags, "HRESULT")
        return result
    }

    /**
     * ITextStoreACPSink::OnStartEditTransaction method
     * @remarks
     * This method causes the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfedittransactionsink-onstartedittransaction">ITfEditTransactionSink::OnStartEditTransaction</a> method to be called on all installed edit transaction sinks.
     * 
     * An edit transaction is a group of text changes that should be processed at one time. Calling this method allows a text service to queue the upcoming changes until <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacpsink-onendedittransaction">ITextStoreACPSink::OnEndEditTransaction</a> is called. When <b>ITextStoreACPSink::OnEndEditTransaction</b> is called, the text service will process all queued changes. Use of edit transactions is optional.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-onstartedittransaction
     */
    OnStartEditTransaction() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * ITextStoreACPSink::OnEndEditTransaction method
     * @remarks
     * This method causes the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfedittransactionsink-onendedittransaction">ITfEditTransactionSink::OnEndEditTransaction</a> method to be called on all installed edit transaction sinks.
     * 
     * An edit transaction is a group of text changes that should be processed at one time. Calling <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacpsink-onstartedittransaction">ITextStoreACPSink::OnStartEditTransaction</a> allows a text service to queue the upcoming changes until <b>ITextStoreACPSink::OnEndEditTransaction</b> is called. When <b>ITextStoreACPSink::OnEndEditTransaction</b> is called, the text service will process all of the queued changes. Use of edit transactions is optional.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-onendedittransaction
     */
    OnEndEditTransaction() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITextStoreACPSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnTextChange := CallbackCreate(GetMethod(implObj, "OnTextChange"), flags, 3)
        this.vtbl.OnSelectionChange := CallbackCreate(GetMethod(implObj, "OnSelectionChange"), flags, 1)
        this.vtbl.OnLayoutChange := CallbackCreate(GetMethod(implObj, "OnLayoutChange"), flags, 3)
        this.vtbl.OnStatusChange := CallbackCreate(GetMethod(implObj, "OnStatusChange"), flags, 2)
        this.vtbl.OnAttrsChange := CallbackCreate(GetMethod(implObj, "OnAttrsChange"), flags, 5)
        this.vtbl.OnLockGranted := CallbackCreate(GetMethod(implObj, "OnLockGranted"), flags, 2)
        this.vtbl.OnStartEditTransaction := CallbackCreate(GetMethod(implObj, "OnStartEditTransaction"), flags, 1)
        this.vtbl.OnEndEditTransaction := CallbackCreate(GetMethod(implObj, "OnEndEditTransaction"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnTextChange)
        CallbackFree(this.vtbl.OnSelectionChange)
        CallbackFree(this.vtbl.OnLayoutChange)
        CallbackFree(this.vtbl.OnStatusChange)
        CallbackFree(this.vtbl.OnAttrsChange)
        CallbackFree(this.vtbl.OnLockGranted)
        CallbackFree(this.vtbl.OnStartEditTransaction)
        CallbackFree(this.vtbl.OnEndEditTransaction)
    }
}
