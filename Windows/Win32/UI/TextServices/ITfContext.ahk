#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfRange.ahk
#Include .\ITfContextView.ahk
#Include .\IEnumTfContextViews.ahk
#Include .\TS_STATUS.ahk
#Include .\ITfProperty.ahk
#Include .\ITfReadOnlyProperty.ahk
#Include .\IEnumTfProperties.ahk
#Include .\ITfDocumentMgr.ahk
#Include .\ITfRangeBackup.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContext interface is implemented by the TSF manager and used by applications and text services to access an edit context.
 * @remarks
 * 
 * An edit context object is created by calling <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a>. Often, a text service uses the currently active edit context. The currently active edit context is the edit context at the top of the stack of the active document manager.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcontext
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfContext
     * @type {Guid}
     */
    static IID => Guid("{aa80e7fd-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestEditSession", "InWriteSession", "GetSelection", "SetSelection", "GetStart", "GetEnd", "GetActiveView", "EnumViews", "GetStatus", "GetProperty", "GetAppProperty", "TrackProperties", "EnumProperties", "GetDocumentMgr", "CreateRangeBackup"]

    /**
     * ITfContext::RequestEditSession method
     * @param {Integer} tid Contains a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfclientid">TfClientId</a> value that identifies the client to establish the edit session with.
     * @param {ITfEditSession} pes Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfeditsession">ITfEditSession</a> interface called to perform the edit session.
     * @param {Integer} dwFlags 
     * @returns {HRESULT} Address of an <b>HRESULT</b> value that receives the result of the edit session request. The value received depends upon the type of edit session requested.
     * 
     * <ul>
     * <li>If an asynchronous edit session is requested and can be established, receives TF_S_ASYNC.</li>
     * <li>If a synchronous edit session is requested and cannot be established, receives TF_E_SYNCHRONOUS.</li>
     * <li>If the TF_ES_READWRITE flag is specified and the document is read-only, receives TS_E_READONLY.</li>
     * <li>If a synchronous edit session is established, receives the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontext-requesteditsession
     */
    RequestEditSession(tid, pes, dwFlags) {
        result := ComCall(3, this, "uint", tid, "ptr", pes, "uint", dwFlags, "int*", &phrSession := 0, "HRESULT")
        return phrSession
    }

    /**
     * ITfContext::InWriteSession method
     * @param {Integer} tid Contains a <b>TfClientID</b> value that identifies the client.
     * @returns {BOOL} Pointer to a <b>BOOL</b> that receives a nonzero value if the client has a read/write lock on the context. Receives zero if the client does not have an edit session or has a read-only edit session.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontext-inwritesession
     */
    InWriteSession(tid) {
        result := ComCall(4, this, "uint", tid, "int*", &pfWriteSession := 0, "HRESULT")
        return pfWriteSession
    }

    /**
     * ITfContext::GetSelection method
     * @param {Integer} ec Contains an edit cookie that identifies the edit session. This is the value passed to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {Integer} ulIndex Specifies the zero-based index of the first selection to obtain. Use TF_DEFAULT_SELECTION to obtain the default selection. If TF_DEFAULT_SELECTION is used, only one selection is obtained.
     * @param {Integer} ulCount Specifies the maximum number of selections to obtain.
     * @param {Pointer<TF_SELECTION>} pSelection An array of <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_selection">TF_SELECTION</a> structures that receives the data for each selection. The array must be able to hold at least <i>ulCount</i> elements.
     * @param {Pointer<Integer>} pcFetched Pointer to a ULONG value that receives the number of selections obtained.
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
     * <dt><b>TF_E_NOSELECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The document has no selection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cookie in <i>ec</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is not on a document stack.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontext-getselection
     */
    GetSelection(ec, ulIndex, ulCount, pSelection, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", ec, "uint", ulIndex, "uint", ulCount, "ptr", pSelection, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * ITfContext::SetSelection method
     * @param {Integer} ec Contains an edit cookie that identifies the edit session. This is the value passed to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {Integer} ulCount Specifies the number of selections in the <i>pSelection</i> array.
     * @param {Pointer<TF_SELECTION>} pSelection An array of <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_selection">TF_SELECTION</a> structures that contain the information for each selection.
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
     * <dt><b>TF_E_NOSELECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The document has no selection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cookie in <i>ec</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontext-setselection
     */
    SetSelection(ec, ulCount, pSelection) {
        result := ComCall(6, this, "uint", ec, "uint", ulCount, "ptr", pSelection, "HRESULT")
        return result
    }

    /**
     * ITfContext::GetStart method
     * @param {Integer} ec Contains an edit cookie that identifies the edit session. This is the value passed to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @returns {ITfRange} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that receives an empty range positioned at the start of the document.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontext-getstart
     */
    GetStart(ec) {
        result := ComCall(7, this, "uint", ec, "ptr*", &ppStart := 0, "HRESULT")
        return ITfRange(ppStart)
    }

    /**
     * ITfContext::GetEnd method
     * @param {Integer} ec Contains an edit cookie that identifies the edit session. This is the value passed to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @returns {ITfRange} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface pointer that receives an empty range positioned at the end of the document.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontext-getend
     */
    GetEnd(ec) {
        result := ComCall(8, this, "uint", ec, "ptr*", &ppEnd := 0, "HRESULT")
        return ITfRange(ppEnd)
    }

    /**
     * ITfContext::GetActiveView method
     * @returns {ITfContextView} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontextview">ITfContextView</a> interface pointer that receives a reference to the active view.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontext-getactiveview
     */
    GetActiveView() {
        result := ComCall(9, this, "ptr*", &ppView := 0, "HRESULT")
        return ITfContextView(ppView)
    }

    /**
     * 
     * @returns {IEnumTfContextViews} 
     */
    EnumViews() {
        result := ComCall(10, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfContextViews(ppEnum)
    }

    /**
     * ITfContext::GetStatus method
     * @returns {TS_STATUS} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms629192(v=vs.85)">TF_STATUS</a> structure that receives the document status data.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontext-getstatus
     */
    GetStatus() {
        pdcs := TS_STATUS()
        result := ComCall(11, this, "ptr", pdcs, "HRESULT")
        return pdcs
    }

    /**
     * ITfContext::GetProperty method
     * @param {Pointer<Guid>} guidProp Specifies the property identifier. This can be a custom identifier or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-properties">predefined property identifiers</a>.
     * @returns {ITfProperty} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfproperty">ITfProperty</a> interface pointer that receives the property object.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontext-getproperty
     */
    GetProperty(guidProp) {
        result := ComCall(12, this, "ptr", guidProp, "ptr*", &ppProp := 0, "HRESULT")
        return ITfProperty(ppProp)
    }

    /**
     * ITfContext::GetAppProperty method
     * @param {Pointer<Guid>} guidProp Specifies the property identifier. This can be a custom identifier or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-properties">predefined property identifiers</a>.
     * @returns {ITfReadOnlyProperty} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfreadonlyproperty">ITfReadOnlyProperty</a> interface pointer that receives the property object.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontext-getappproperty
     */
    GetAppProperty(guidProp) {
        result := ComCall(13, this, "ptr", guidProp, "ptr*", &ppProp := 0, "HRESULT")
        return ITfReadOnlyProperty(ppProp)
    }

    /**
     * ITfContext::TrackProperties method
     * @param {Pointer<Pointer<Guid>>} prgProp Contains an array of property identifiers that specify the properties to track.
     * @param {Integer} cProp Contains the number of property identifiers in the <i>prgProp</i> array.
     * @param {Pointer<Pointer<Guid>>} prgAppProp Contains an array of application property identifiers that specify the application properties to track.
     * @param {Integer} cAppProp Contains the number of application property identifiers in the <i>prgAppProp</i> array.
     * @returns {ITfReadOnlyProperty} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfreadonlyproperty">ITfReadOnlyProperty</a> interface pointer that receives the tracking property.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontext-trackproperties
     */
    TrackProperties(prgProp, cProp, prgAppProp, cAppProp) {
        prgPropMarshal := prgProp is VarRef ? "ptr*" : "ptr"
        prgAppPropMarshal := prgAppProp is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, prgPropMarshal, prgProp, "uint", cProp, prgAppPropMarshal, prgAppProp, "uint", cAppProp, "ptr*", &ppProperty := 0, "HRESULT")
        return ITfReadOnlyProperty(ppProperty)
    }

    /**
     * ITfContext::EnumProperties method
     * @returns {IEnumTfProperties} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfproperties">IEnumTfProperties</a> interface pointer that receives the enumerator object.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontext-enumproperties
     */
    EnumProperties() {
        result := ComCall(15, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfProperties(ppEnum)
    }

    /**
     * ITfContext::GetDocumentMgr method
     * @returns {ITfDocumentMgr} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdocumentmgr">ITfDocumentMgr</a> interface pointer that receives the document manager.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontext-getdocumentmgr
     */
    GetDocumentMgr() {
        result := ComCall(16, this, "ptr*", &ppDm := 0, "HRESULT")
        return ITfDocumentMgr(ppDm)
    }

    /**
     * ITfContext::CreateRangeBackup method
     * @param {Integer} ec Contains an edit cookie that identifies the edit session. This is the value passed to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pRange Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object to be backed up.
     * @returns {ITfRangeBackup} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrangebackup">ITfRangeBackup</a> interface pointer that receives the backup of <i>pRange</i>.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontext-createrangebackup
     */
    CreateRangeBackup(ec, pRange) {
        result := ComCall(17, this, "uint", ec, "ptr", pRange, "ptr*", &ppBackup := 0, "HRESULT")
        return ITfRangeBackup(ppBackup)
    }
}
