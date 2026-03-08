#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITextStoreACPSink interface is implemented by the TSF manager and is used by an ACP-based application to notify the manager when certain events occur. The manager installs this advise sink by calling ITextStoreACP::AdviseSink.
 * @see https://learn.microsoft.com/windows/win32/api/textstor/nn-textstor-itextstoreacpsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreACPSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStoreACPSink
     * @type {Guid}
     */
    static IID => Guid("{22d44c94-a419-4542-a272-ae26093ececf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnTextChange", "OnSelectionChange", "OnLayoutChange", "OnStatusChange", "OnAttrsChange", "OnLockGranted", "OnStartEditTransaction", "OnEndEditTransaction"]

    /**
     * ITextStoreACPSink::OnTextChange method
     * @remarks
     * <b>ITextStoreACPSink::OnTextChange</b> is never called when the text is modified by one of the <b>ITextStoreACP</b> interface methods, such as <b>ITextStoreACP::SetText</b> or <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp-inserttextatselection">ITextStoreACP::InsertTextAtSelection</a>.
     * 
     * When calling this method, the application must be able to grant a <a href="https://docs.microsoft.com/windows/desktop/TSF/document-locks">document lock</a>.
     * @param {Integer} dwFlags 
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
        result := ComCall(3, this, "uint", dwFlags, "ptr", pChange, "HRESULT")
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
     * @param {Integer} lcode Contains a <a href="https://docs.microsoft.com/windows/win32/api/textstor/ne-textstor-tslayoutcode">TsLayoutCode</a> value that defines the type of change.
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
        result := ComCall(5, this, "int", lcode, "uint", vcView, "HRESULT")
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
        result := ComCall(7, this, "int", acpStart, "int", acpEnd, "uint", cAttrs, "ptr", paAttrs, "HRESULT")
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
     * @param {Integer} dwLockFlags 
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
        result := ComCall(8, this, "uint", dwLockFlags, "HRESULT")
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
}
