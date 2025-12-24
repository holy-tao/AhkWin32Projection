#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITextStoreAnchorSink interface is implemented by the TSF manager and is used by an anchor-based application to notify the manager when certain events occur. The manager installs this advise sink by calling ITextStoreAnchor::AdviseSink.
 * @see https://docs.microsoft.com/windows/win32/api//textstor/nn-textstor-itextstoreanchorsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreAnchorSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStoreAnchorSink
     * @type {Guid}
     */
    static IID => Guid("{aa80e905-2021-11d2-93e0-0060b067b86e}")

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
     * ITextStoreAnchorSink::OnTextChange method
     * @param {Integer} dwFlags 
     * @param {IAnchor} paStart Pointer to an anchor located at the start of the changed text.
     * @param {IAnchor} paEnd Pointer to an anchor located at the end of the changed text.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to create cloned anchors to contain the change.
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
     * <i>paStart</i> or <i>paEnd</i> is invalid.
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
     * The TSF manager holds a lock on the document. This typically indicates that the method was called from within another <a href="/windows/desktop/api/textstor/nn-textstor-itextstoreanchor">ITextStoreAnchor</a> method, such as <a href="/windows/desktop/api/textstor/nf-textstor-itextstoreanchor-settext">ITextStoreAnchor::SetText</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchorsink-ontextchange
     */
    OnTextChange(dwFlags, paStart, paEnd) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", paStart, "ptr", paEnd, "HRESULT")
        return result
    }

    /**
     * The ITextStoreAnchorSink::OnSelectionChange method is called when the selection within the text stream changes. This method should be called whenever the return value of a potential call to ITextStoreAnchor::GetSelection has changed.
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
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchorsink-onselectionchange
     */
    OnSelectionChange() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The ITextStoreAnchorSink::OnLayoutChange method is called when the layout (on-screen representation) of the document changes.
     * @param {Integer} lcode Contains a <a href="https://docs.microsoft.com/windows/win32/api/textstor/ne-textstor-tslayoutcode">TsLayoutCode</a> value that defines the type of change.
     * @param {Integer} vcView Contains an application-defined cookie that identifies the document. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreanchor-getactiveview">ITextStoreAnchor::GetActiveView</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchorsink-onlayoutchange
     */
    OnLayoutChange(lcode, vcView) {
        result := ComCall(5, this, "int", lcode, "uint", vcView, "HRESULT")
        return result
    }

    /**
     * ITextStoreAnchorSink::OnStatusChange method
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
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchorsink-onstatuschange
     */
    OnStatusChange(dwFlags) {
        result := ComCall(6, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The ITextStoreAnchorSink::OnAttrsChange method is called when the value of one or more text attributes changes.
     * @param {IAnchor} paStart Pointer to the start anchor of the range of text that has the attribute change.
     * @param {IAnchor} paEnd Pointer to the end anchor of the range of text that has the attribute change.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchorsink-onattrschange
     */
    OnAttrsChange(paStart, paEnd, cAttrs, paAttrs) {
        result := ComCall(7, this, "ptr", paStart, "ptr", paEnd, "uint", cAttrs, "ptr", paAttrs, "HRESULT")
        return result
    }

    /**
     * ITextStoreAnchorSink::OnLockGranted method
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
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchorsink-onlockgranted
     */
    OnLockGranted(dwLockFlags) {
        result := ComCall(8, this, "uint", dwLockFlags, "HRESULT")
        return result
    }

    /**
     * ITextStoreAnchorSink::OnStartEditTransaction method
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
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchorsink-onstartedittransaction
     */
    OnStartEditTransaction() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * ITextStoreAnchorSink::OnEndEditTransaction method
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reference count of the edit transaction is incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchorsink-onendedittransaction
     */
    OnEndEditTransaction() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
