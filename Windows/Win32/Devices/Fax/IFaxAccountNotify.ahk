#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IFaxJobStatus.ahk" { IFaxJobStatus }
#Import ".\IFaxAccount.ahk" { IFaxAccount }
#Import ".\IFaxServer2.ahk" { IFaxServer2 }

/**
 * Called by the fax service to send event notifications about particular fax accounts. This property sends event notifications. Events include changes to incoming and outgoing job queues, and changes to incoming and outgoing archives. (IIFaxAccountNotify)
 * @remarks
 * <h3><a id="To_Use_Fax_Notification_Events_with_Visual_Basic"></a><a id="to_use_fax_notification_events_with_visual_basic"></a><a id="TO_USE_FAX_NOTIFICATION_EVENTS_WITH_VISUAL_BASIC"></a>To Use Fax Notification Events with Visual Basic</h3>
 * Use the following syntax when creating the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a> object:
 * 
 * 
 * 
 * ```
 * 
 * Dim WithEvents objFaxAccount As FaxAccount
 * 
 * ```
 * 
 * 
 * <h3><a id="To_Use_Fax_Notification_Events_with_C__"></a><a id="to_use_fax_notification_events_with_c__"></a><a id="TO_USE_FAX_NOTIFICATION_EVENTS_WITH_C__"></a>To Use Fax Notification Events with C++</h3>
 * A fax client application must implement <b>IFaxAccountNotify</b> and pass the fax service the pointer to an <b>IFaxAccountNotify</b> interface.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxaccountnotify
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxAccountNotify extends IDispatch {
    /**
     * The interface identifier for IFaxAccountNotify
     * @type {Guid}
     */
    static IID := Guid("{b9b3bc81-ac1b-46f3-b39d-0adc30e1b788}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxAccountNotify interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        OnIncomingJobAdded       : IntPtr
        OnIncomingJobRemoved     : IntPtr
        OnIncomingJobChanged     : IntPtr
        OnOutgoingJobAdded       : IntPtr
        OnOutgoingJobRemoved     : IntPtr
        OnOutgoingJobChanged     : IntPtr
        OnIncomingMessageAdded   : IntPtr
        OnIncomingMessageRemoved : IntPtr
        OnOutgoingMessageAdded   : IntPtr
        OnOutgoingMessageRemoved : IntPtr
        OnServerShutDown         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxAccountNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the fax service when an incoming fax job is added to the job queue for a particular fax account.
     * @remarks
     * To implement this functionality in Visual Basic, select and implement the appropriate event procedure.
     * @param {IFaxAccount} pFaxAccount Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a> object.
     * @param {BSTR} bstrJobId Type: <b>BSTR</b>
     * 
     * A null-terminated string that contains the ID of the job added to the job queue.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-_ifaxaccountnotify-onincomingjobadded
     */
    OnIncomingJobAdded(pFaxAccount, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(7, this, "ptr", pFaxAccount, BSTR, bstrJobId, "HRESULT")
        return result
    }

    /**
     * Called by the fax service when an incoming fax job is removed from the job queue of a particular fax account.
     * @remarks
     * To implement this functionality in Visual Basic, select and implement the appropriate event procedure.
     * @param {IFaxAccount} pFaxAccount Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a> object.
     * @param {BSTR} bstrJobId Type: <b>BSTR</b>
     * 
     * A null-terminated string that contains the ID of the job removed from the job queue.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-_ifaxaccountnotify-onincomingjobremoved
     */
    OnIncomingJobRemoved(pFaxAccount, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(8, this, "ptr", pFaxAccount, BSTR, bstrJobId, "HRESULT")
        return result
    }

    /**
     * Called by the fax service when the status of an incoming fax job for a particular fax account changes.
     * @remarks
     * To implement this functionality in Visual Basic, select and implement the appropriate event procedure.
     * @param {IFaxAccount} pFaxAccount Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a> object.
     * @param {BSTR} bstrJobId Type: <b>BSTR</b>
     * 
     * A null-terminated string that contains the ID of the job for which the status has changed.
     * @param {IFaxJobStatus} pJobStatus Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxjobstatus">IFaxJobStatus</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxjobstatus">FaxJobStatus</a> object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-_ifaxaccountnotify-onincomingjobchanged
     */
    OnIncomingJobChanged(pFaxAccount, bstrJobId, pJobStatus) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(9, this, "ptr", pFaxAccount, BSTR, bstrJobId, "ptr", pJobStatus, "HRESULT")
        return result
    }

    /**
     * Called by the fax service when an outgoing fax job is added to the job queue for a particular fax account.
     * @remarks
     * To implement this functionality in Visual Basic, select and implement the appropriate event procedure.
     * @param {IFaxAccount} pFaxAccount Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a> object.
     * @param {BSTR} bstrJobId Type: <b>BSTR</b>
     * 
     * Null-terminated string that contains the ID of the job added to the job queue.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-_ifaxaccountnotify-onoutgoingjobadded
     */
    OnOutgoingJobAdded(pFaxAccount, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(10, this, "ptr", pFaxAccount, BSTR, bstrJobId, "HRESULT")
        return result
    }

    /**
     * Called by the fax service when an outgoing fax job is removed from the job queue of a particular fax account.
     * @remarks
     * To implement this functionality in Visual Basic, select and implement the appropriate event procedure.
     * @param {IFaxAccount} pFaxAccount Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a> object.
     * @param {BSTR} bstrJobId Type: <b>BSTR</b>
     * 
     * Null-terminated string that contains the ID of the job removed from the job queue.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-_ifaxaccountnotify-onoutgoingjobremoved
     */
    OnOutgoingJobRemoved(pFaxAccount, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(11, this, "ptr", pFaxAccount, BSTR, bstrJobId, "HRESULT")
        return result
    }

    /**
     * Called by the fax service when the status of an outgoing fax job for a particular fax account changes.
     * @remarks
     * To implement this functionality in Visual Basic, select and implement the appropriate event procedure.
     * @param {IFaxAccount} pFaxAccount Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a> object.
     * @param {BSTR} bstrJobId Type: <b>BSTR</b>
     * 
     * A null-terminated string that contains the ID of the job for which the status has changed.
     * @param {IFaxJobStatus} pJobStatus Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxjobstatus">IFaxJobStatus</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxjobstatus">FaxJobStatus</a> object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-_ifaxaccountnotify-onoutgoingjobchanged
     */
    OnOutgoingJobChanged(pFaxAccount, bstrJobId, pJobStatus) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(12, this, "ptr", pFaxAccount, BSTR, bstrJobId, "ptr", pJobStatus, "HRESULT")
        return result
    }

    /**
     * Called by the fax service when an incoming message is added to the inbound fax archive.
     * @remarks
     * To implement this functionality in Visual Basic, select and implement the appropriate event procedure.
     * @param {IFaxAccount} pFaxAccount Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a> object.
     * @param {BSTR} bstrMessageId Type: <b>BSTR</b>
     * 
     * A null-terminated string that contains the ID of the message added to the inbound fax archive.
     * @param {VARIANT_BOOL} fAddedToReceiveFolder Type: <b>VARIANT_BOOL</b>
     * 
     * A value that indicates whether the message was successfully added to the received folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-_ifaxaccountnotify-onincomingmessageadded
     */
    OnIncomingMessageAdded(pFaxAccount, bstrMessageId, fAddedToReceiveFolder) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(13, this, "ptr", pFaxAccount, BSTR, bstrMessageId, VARIANT_BOOL, fAddedToReceiveFolder, "HRESULT")
        return result
    }

    /**
     * Called by the fax service when an incoming message is removed from the inbound fax archive.
     * @remarks
     * To implement this functionality in Visual Basic, select and implement the appropriate event procedure.
     * @param {IFaxAccount} pFaxAccount Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a> object.
     * @param {BSTR} bstrMessageId Type: <b>BSTR</b>
     * 
     * A null-terminated string that contains the ID of the message removed from the inbound fax archive.
     * @param {VARIANT_BOOL} fRemovedFromReceiveFolder Type: <b>VARIANT_BOOL</b>
     * 
     * A value that indicates whether the message was successfully removed from the received folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-_ifaxaccountnotify-onincomingmessageremoved
     */
    OnIncomingMessageRemoved(pFaxAccount, bstrMessageId, fRemovedFromReceiveFolder) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(14, this, "ptr", pFaxAccount, BSTR, bstrMessageId, VARIANT_BOOL, fRemovedFromReceiveFolder, "HRESULT")
        return result
    }

    /**
     * The fax service calls the IFaxAccountNotify::OnOutgoingMessageAdded method when an outgoing message is added to the outbound fax archive.
     * @remarks
     * To implement this functionality in Visual Basic, select and implement the appropriate event procedure.
     * @param {IFaxAccount} pFaxAccount Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a> object.
     * @param {BSTR} bstrMessageId Type: <b>BSTR</b>
     * 
     * Null-terminated string that contains the ID of the message added to the outbound fax archive.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-_ifaxaccountnotify-onoutgoingmessageadded
     */
    OnOutgoingMessageAdded(pFaxAccount, bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(15, this, "ptr", pFaxAccount, BSTR, bstrMessageId, "HRESULT")
        return result
    }

    /**
     * Called by the fax service when an outgoing message is removed from the outbound fax archive.
     * @remarks
     * To implement this functionality in Visual Basic, select and implement the appropriate event procedure.
     * @param {IFaxAccount} pFaxAccount Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a> object.
     * @param {BSTR} bstrMessageId Type: <b>BSTR</b>
     * 
     * Null-terminated string that contains the ID of the message removed from the outbound fax archive.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-_ifaxaccountnotify-onoutgoingmessageremoved
     */
    OnOutgoingMessageRemoved(pFaxAccount, bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(16, this, "ptr", pFaxAccount, BSTR, bstrMessageId, "HRESULT")
        return result
    }

    /**
     * Called by the fax service when it shuts down.
     * @remarks
     * To implement this functionality in Visual Basic, select and implement the appropriate event procedure.
     * @param {IFaxServer2} pFaxServer Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a> object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-_ifaxaccountnotify-onservershutdown
     */
    OnServerShutDown(pFaxServer) {
        result := ComCall(17, this, "ptr", pFaxServer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxAccountNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnIncomingJobAdded := CallbackCreate(GetMethod(implObj, "OnIncomingJobAdded"), flags, 3)
        this.vtbl.OnIncomingJobRemoved := CallbackCreate(GetMethod(implObj, "OnIncomingJobRemoved"), flags, 3)
        this.vtbl.OnIncomingJobChanged := CallbackCreate(GetMethod(implObj, "OnIncomingJobChanged"), flags, 4)
        this.vtbl.OnOutgoingJobAdded := CallbackCreate(GetMethod(implObj, "OnOutgoingJobAdded"), flags, 3)
        this.vtbl.OnOutgoingJobRemoved := CallbackCreate(GetMethod(implObj, "OnOutgoingJobRemoved"), flags, 3)
        this.vtbl.OnOutgoingJobChanged := CallbackCreate(GetMethod(implObj, "OnOutgoingJobChanged"), flags, 4)
        this.vtbl.OnIncomingMessageAdded := CallbackCreate(GetMethod(implObj, "OnIncomingMessageAdded"), flags, 4)
        this.vtbl.OnIncomingMessageRemoved := CallbackCreate(GetMethod(implObj, "OnIncomingMessageRemoved"), flags, 4)
        this.vtbl.OnOutgoingMessageAdded := CallbackCreate(GetMethod(implObj, "OnOutgoingMessageAdded"), flags, 3)
        this.vtbl.OnOutgoingMessageRemoved := CallbackCreate(GetMethod(implObj, "OnOutgoingMessageRemoved"), flags, 3)
        this.vtbl.OnServerShutDown := CallbackCreate(GetMethod(implObj, "OnServerShutDown"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnIncomingJobAdded)
        CallbackFree(this.vtbl.OnIncomingJobRemoved)
        CallbackFree(this.vtbl.OnIncomingJobChanged)
        CallbackFree(this.vtbl.OnOutgoingJobAdded)
        CallbackFree(this.vtbl.OnOutgoingJobRemoved)
        CallbackFree(this.vtbl.OnOutgoingJobChanged)
        CallbackFree(this.vtbl.OnIncomingMessageAdded)
        CallbackFree(this.vtbl.OnIncomingMessageRemoved)
        CallbackFree(this.vtbl.OnOutgoingMessageAdded)
        CallbackFree(this.vtbl.OnOutgoingMessageRemoved)
        CallbackFree(this.vtbl.OnServerShutDown)
    }
}
