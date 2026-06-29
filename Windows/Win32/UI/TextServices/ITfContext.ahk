#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfReadOnlyProperty.ahk" { ITfReadOnlyProperty }
#Import ".\ITfRangeBackup.ahk" { ITfRangeBackup }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TF_SELECTION.ahk" { TF_SELECTION }
#Import ".\ITfEditSession.ahk" { ITfEditSession }
#Import ".\ITfDocumentMgr.ahk" { ITfDocumentMgr }
#Import ".\ITfRange.ahk" { ITfRange }
#Import ".\ITfProperty.ahk" { ITfProperty }
#Import ".\TF_CONTEXT_EDIT_CONTEXT_FLAGS.ahk" { TF_CONTEXT_EDIT_CONTEXT_FLAGS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IEnumTfProperties.ahk" { IEnumTfProperties }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ITfContextView.ahk" { ITfContextView }
#Import ".\IEnumTfContextViews.ahk" { IEnumTfContextViews }
#Import ".\TS_STATUS.ahk" { TS_STATUS }

/**
 * The ITfContext interface is implemented by the TSF manager and used by applications and text services to access an edit context.
 * @remarks
 * An edit context object is created by calling <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a>. Often, a text service uses the currently active edit context. The currently active edit context is the edit context at the top of the stack of the active document manager.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcontext
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfContext extends IUnknown {
    /**
     * The interface identifier for ITfContext
     * @type {Guid}
     */
    static IID := Guid("{aa80e7fd-2021-11d2-93e0-0060b067b86e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RequestEditSession : IntPtr
        InWriteSession     : IntPtr
        GetSelection       : IntPtr
        SetSelection       : IntPtr
        GetStart           : IntPtr
        GetEnd             : IntPtr
        GetActiveView      : IntPtr
        EnumViews          : IntPtr
        GetStatus          : IntPtr
        GetProperty        : IntPtr
        GetAppProperty     : IntPtr
        TrackProperties    : IntPtr
        EnumProperties     : IntPtr
        GetDocumentMgr     : IntPtr
        CreateRangeBackup  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfContext::RequestEditSession method
     * @remarks
     * Pending asynchronous edit sessions are processed in the order received. Synchronous edit sessions are processed before any pending asynchronous edit sessions.
     * 
     * A text service can request an edit session within the context of an existing edit session, provided a write access session is not requested within a read-only session. Calls to this method within the context of an edit session established by another text service will fail with TF_E_LOCKED.
     * 
     * A synchronous read/write request will fail if made when processing one of the following notifications.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftexteditsink-onendedit">ITfTextEditSink::OnEndEdit
     *             </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftextlayoutsink-onlayoutchange">ITfTextLayoutSink::OnLayoutChange
     *             </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfstatussink-onstatuschange">ITfStatusSink::OnStatusChange
     *             </a>
     * </li>
     * </ul>
     * @param {Integer} tid Contains a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfclientid">TfClientId</a> value that identifies the client to establish the edit session with.
     * @param {ITfEditSession} pes Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfeditsession">ITfEditSession</a> interface called to perform the edit session.
     * @param {TF_CONTEXT_EDIT_CONTEXT_FLAGS} dwFlags 
     * @returns {HRESULT} Address of an <b>HRESULT</b> value that receives the result of the edit session request. The value received depends upon the type of edit session requested.
     * 
     * <ul>
     * <li>If an asynchronous edit session is requested and can be established, receives TF_S_ASYNC.</li>
     * <li>If a synchronous edit session is requested and cannot be established, receives TF_E_SYNCHRONOUS.</li>
     * <li>If the TF_ES_READWRITE flag is specified and the document is read-only, receives TS_E_READONLY.</li>
     * <li>If a synchronous edit session is established, receives the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-requesteditsession
     */
    RequestEditSession(tid, pes, dwFlags) {
        result := ComCall(3, this, "uint", tid, "ptr", pes, TF_CONTEXT_EDIT_CONTEXT_FLAGS, dwFlags, "int*", &phrSession := 0, "HRESULT")
        return phrSession
    }

    /**
     * ITfContext::InWriteSession method
     * @remarks
     * A client uses this method, from inside a notification callback, to determine if it must make the change.
     * @param {Integer} tid Contains a <b>TfClientID</b> value that identifies the client.
     * @returns {BOOL} Pointer to a <b>BOOL</b> that receives a nonzero value if the client has a read/write lock on the context. Receives zero if the client does not have an edit session or has a read-only edit session.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-inwritesession
     */
    InWriteSession(tid) {
        result := ComCall(4, this, "uint", tid, BOOL.Ptr, &pfWriteSession := 0, "HRESULT")
        return pfWriteSession
    }

    /**
     * ITfContext::GetSelection method
     * @remarks
     * A selection is a highlighted range of text, or an insertion point if the range is empty, that identifies the user focus area within a document.
     * 
     * If this method is successful, the caller must release the <b>range</b> member of all <b>TF_SELECTION</b> structures obtained.
     * 
     * Normally, a context only supports a single selection. It is possible, however, for a context to support multiple, simultaneous selections. This method can be used to obtain multiple selections.
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getselection
     */
    GetSelection(ec, ulIndex, ulCount, pSelection, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", ec, "uint", ulIndex, "uint", ulCount, TF_SELECTION.Ptr, pSelection, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * ITfContext::SetSelection method
     * @remarks
     * A selection is a span of highlighted text, or an insertion point if the span is empty, identifying the user focus area within a document. Some documents are capable of having multiple selections. There can only be one zero-length selection in <i>pSelection</i> as it represents the position of the document caret.
     * 
     * If an application must adjust the text covered by a selection, it should wait until the caller releases the lock. However, applications can adjust any of the <b>style</b> members of the <b>TF_SELECTION</b> structures while still returning S_OK.
     * 
     * The caller can set the <b>fInterimChar</b> flag only if one selection is set. In this case, the selection should span exactly one character and the <b>ase</b> member of the <b>TF_SELECTION</b> structure is set to TFAE_NONE.
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-setselection
     */
    SetSelection(ec, ulCount, pSelection) {
        result := ComCall(6, this, "uint", ec, "uint", ulCount, TF_SELECTION.Ptr, pSelection, "HRESULT")
        return result
    }

    /**
     * ITfContext::GetStart method
     * @param {Integer} ec Contains an edit cookie that identifies the edit session. This is the value passed to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @returns {ITfRange} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that receives an empty range positioned at the start of the document.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getstart
     */
    GetStart(ec) {
        result := ComCall(7, this, "uint", ec, "ptr*", &ppStart := 0, "HRESULT")
        return ITfRange(ppStart)
    }

    /**
     * ITfContext::GetEnd method
     * @param {Integer} ec Contains an edit cookie that identifies the edit session. This is the value passed to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @returns {ITfRange} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface pointer that receives an empty range positioned at the end of the document.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getend
     */
    GetEnd(ec) {
        result := ComCall(8, this, "uint", ec, "ptr*", &ppEnd := 0, "HRESULT")
        return ITfRange(ppEnd)
    }

    /**
     * ITfContext::GetActiveView method
     * @returns {ITfContextView} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontextview">ITfContextView</a> interface pointer that receives a reference to the active view.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getactiveview
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getstatus
     */
    GetStatus() {
        pdcs := TS_STATUS()
        result := ComCall(11, this, TS_STATUS.Ptr, pdcs, "HRESULT")
        return pdcs
    }

    /**
     * ITfContext::GetProperty method
     * @remarks
     * An application or text service can define unique properties identified by a GUID. Properties are stored as VARIANT data, so the caller must recognize the format and meaning of unique properties to be able to use them.
     * @param {Pointer<Guid>} guidProp Specifies the property identifier. This can be a custom identifier or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-properties">predefined property identifiers</a>.
     * @returns {ITfProperty} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfproperty">ITfProperty</a> interface pointer that receives the property object.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getproperty
     */
    GetProperty(guidProp) {
        result := ComCall(12, this, Guid.Ptr, guidProp, "ptr*", &ppProp := 0, "HRESULT")
        return ITfProperty(ppProp)
    }

    /**
     * ITfContext::GetAppProperty method
     * @remarks
     * Applications can define unique properties identified by a GUID. Properties are stored as VARIANT data, so the caller must recognize the format and meaning of unique properties to be able to use them.
     * 
     * Application properties differ from text properties, obtained by <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-getproperty">ITfContext::GetProperty</a>, in that, application properties are maintained by the context owner and cannot be modified by a text service. Application properties can only be modified by the context owner.
     * @param {Pointer<Guid>} guidProp Specifies the property identifier. This can be a custom identifier or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-properties">predefined property identifiers</a>.
     * @returns {ITfReadOnlyProperty} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfreadonlyproperty">ITfReadOnlyProperty</a> interface pointer that receives the property object.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getappproperty
     */
    GetAppProperty(guidProp) {
        result := ComCall(13, this, Guid.Ptr, guidProp, "ptr*", &ppProp := 0, "HRESULT")
        return ITfReadOnlyProperty(ppProp)
    }

    /**
     * ITfContext::TrackProperties method
     * @remarks
     * This method is used to quickly identify ranges with consistent property values for multiple properties. While this method could be duplicated using only the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-getproperty">ITfContext::GetProperty</a> method, the TSF manager can accomplish this task more quickly.
     * 
     * The property obtained by this method is a VT_UNKNOWN type. This property can be used to obtain an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfpropertyvalue">IEnumTfPropertyValue</a> enumerator by calling the <b>QueryInterface</b> method with IID_IEnumTfPropertyValue. This enumerator contains property values specified by <i>prgProp</i> and <i>prgAppProp</i>.
     * @param {Pointer<Pointer<Guid>>} prgProp Contains an array of property identifiers that specify the properties to track.
     * @param {Integer} cProp Contains the number of property identifiers in the <i>prgProp</i> array.
     * @param {Pointer<Pointer<Guid>>} prgAppProp Contains an array of application property identifiers that specify the application properties to track.
     * @param {Integer} cAppProp Contains the number of application property identifiers in the <i>prgAppProp</i> array.
     * @returns {ITfReadOnlyProperty} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfreadonlyproperty">ITfReadOnlyProperty</a> interface pointer that receives the tracking property.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-trackproperties
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-enumproperties
     */
    EnumProperties() {
        result := ComCall(15, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfProperties(ppEnum)
    }

    /**
     * ITfContext::GetDocumentMgr method
     * @remarks
     * If the context is not contained within a document manager, this method returns S_FALSE and <i>ppDm</i> is set to <b>NULL</b>. This occurs when the context is removed from the context stack through a call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-pop">ITfDocumentMgr::Pop</a>.
     * @returns {ITfDocumentMgr} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdocumentmgr">ITfDocumentMgr</a> interface pointer that receives the document manager.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getdocumentmgr
     */
    GetDocumentMgr() {
        result := ComCall(16, this, "ptr*", &ppDm := 0, "HRESULT")
        return ITfDocumentMgr(ppDm)
    }

    /**
     * ITfContext::CreateRangeBackup method
     * @remarks
     * This method creates a copy of the range that it can use to restore the data in <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfrangebackup-restore">ITfRangeBackup::Restore</a>.
     * @param {Integer} ec Contains an edit cookie that identifies the edit session. This is the value passed to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pRange Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object to be backed up.
     * @returns {ITfRangeBackup} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrangebackup">ITfRangeBackup</a> interface pointer that receives the backup of <i>pRange</i>.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-createrangebackup
     */
    CreateRangeBackup(ec, pRange) {
        result := ComCall(17, this, "uint", ec, "ptr", pRange, "ptr*", &ppBackup := 0, "HRESULT")
        return ITfRangeBackup(ppBackup)
    }

    Query(iid) {
        if (ITfContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestEditSession := CallbackCreate(GetMethod(implObj, "RequestEditSession"), flags, 5)
        this.vtbl.InWriteSession := CallbackCreate(GetMethod(implObj, "InWriteSession"), flags, 3)
        this.vtbl.GetSelection := CallbackCreate(GetMethod(implObj, "GetSelection"), flags, 6)
        this.vtbl.SetSelection := CallbackCreate(GetMethod(implObj, "SetSelection"), flags, 4)
        this.vtbl.GetStart := CallbackCreate(GetMethod(implObj, "GetStart"), flags, 3)
        this.vtbl.GetEnd := CallbackCreate(GetMethod(implObj, "GetEnd"), flags, 3)
        this.vtbl.GetActiveView := CallbackCreate(GetMethod(implObj, "GetActiveView"), flags, 2)
        this.vtbl.EnumViews := CallbackCreate(GetMethod(implObj, "EnumViews"), flags, 2)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.GetAppProperty := CallbackCreate(GetMethod(implObj, "GetAppProperty"), flags, 3)
        this.vtbl.TrackProperties := CallbackCreate(GetMethod(implObj, "TrackProperties"), flags, 6)
        this.vtbl.EnumProperties := CallbackCreate(GetMethod(implObj, "EnumProperties"), flags, 2)
        this.vtbl.GetDocumentMgr := CallbackCreate(GetMethod(implObj, "GetDocumentMgr"), flags, 2)
        this.vtbl.CreateRangeBackup := CallbackCreate(GetMethod(implObj, "CreateRangeBackup"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestEditSession)
        CallbackFree(this.vtbl.InWriteSession)
        CallbackFree(this.vtbl.GetSelection)
        CallbackFree(this.vtbl.SetSelection)
        CallbackFree(this.vtbl.GetStart)
        CallbackFree(this.vtbl.GetEnd)
        CallbackFree(this.vtbl.GetActiveView)
        CallbackFree(this.vtbl.EnumViews)
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.GetAppProperty)
        CallbackFree(this.vtbl.TrackProperties)
        CallbackFree(this.vtbl.EnumProperties)
        CallbackFree(this.vtbl.GetDocumentMgr)
        CallbackFree(this.vtbl.CreateRangeBackup)
    }
}
