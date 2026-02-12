#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nn-faxcomex-ifaxaccountnotify
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxAccountNotify extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxAccountNotify
     * @type {Guid}
     */
    static IID => Guid("{b9b3bc81-ac1b-46f3-b39d-0adc30e1b788}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnIncomingJobAdded", "OnIncomingJobRemoved", "OnIncomingJobChanged", "OnOutgoingJobAdded", "OnOutgoingJobRemoved", "OnOutgoingJobChanged", "OnIncomingMessageAdded", "OnIncomingMessageRemoved", "OnOutgoingMessageAdded", "OnOutgoingMessageRemoved", "OnServerShutDown"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-_ifaxaccountnotify-onincomingjobadded
     */
    OnIncomingJobAdded(pFaxAccount, bstrJobId) {
        if(bstrJobId is String) {
            pin := BSTR.Alloc(bstrJobId)
            bstrJobId := pin.Value
        }

        result := ComCall(7, this, "ptr", pFaxAccount, "ptr", bstrJobId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-_ifaxaccountnotify-onincomingjobremoved
     */
    OnIncomingJobRemoved(pFaxAccount, bstrJobId) {
        if(bstrJobId is String) {
            pin := BSTR.Alloc(bstrJobId)
            bstrJobId := pin.Value
        }

        result := ComCall(8, this, "ptr", pFaxAccount, "ptr", bstrJobId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-_ifaxaccountnotify-onincomingjobchanged
     */
    OnIncomingJobChanged(pFaxAccount, bstrJobId, pJobStatus) {
        if(bstrJobId is String) {
            pin := BSTR.Alloc(bstrJobId)
            bstrJobId := pin.Value
        }

        result := ComCall(9, this, "ptr", pFaxAccount, "ptr", bstrJobId, "ptr", pJobStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-_ifaxaccountnotify-onoutgoingjobadded
     */
    OnOutgoingJobAdded(pFaxAccount, bstrJobId) {
        if(bstrJobId is String) {
            pin := BSTR.Alloc(bstrJobId)
            bstrJobId := pin.Value
        }

        result := ComCall(10, this, "ptr", pFaxAccount, "ptr", bstrJobId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-_ifaxaccountnotify-onoutgoingjobremoved
     */
    OnOutgoingJobRemoved(pFaxAccount, bstrJobId) {
        if(bstrJobId is String) {
            pin := BSTR.Alloc(bstrJobId)
            bstrJobId := pin.Value
        }

        result := ComCall(11, this, "ptr", pFaxAccount, "ptr", bstrJobId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-_ifaxaccountnotify-onoutgoingjobchanged
     */
    OnOutgoingJobChanged(pFaxAccount, bstrJobId, pJobStatus) {
        if(bstrJobId is String) {
            pin := BSTR.Alloc(bstrJobId)
            bstrJobId := pin.Value
        }

        result := ComCall(12, this, "ptr", pFaxAccount, "ptr", bstrJobId, "ptr", pJobStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-_ifaxaccountnotify-onincomingmessageadded
     */
    OnIncomingMessageAdded(pFaxAccount, bstrMessageId, fAddedToReceiveFolder) {
        if(bstrMessageId is String) {
            pin := BSTR.Alloc(bstrMessageId)
            bstrMessageId := pin.Value
        }

        result := ComCall(13, this, "ptr", pFaxAccount, "ptr", bstrMessageId, "short", fAddedToReceiveFolder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-_ifaxaccountnotify-onincomingmessageremoved
     */
    OnIncomingMessageRemoved(pFaxAccount, bstrMessageId, fRemovedFromReceiveFolder) {
        if(bstrMessageId is String) {
            pin := BSTR.Alloc(bstrMessageId)
            bstrMessageId := pin.Value
        }

        result := ComCall(14, this, "ptr", pFaxAccount, "ptr", bstrMessageId, "short", fRemovedFromReceiveFolder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-_ifaxaccountnotify-onoutgoingmessageadded
     */
    OnOutgoingMessageAdded(pFaxAccount, bstrMessageId) {
        if(bstrMessageId is String) {
            pin := BSTR.Alloc(bstrMessageId)
            bstrMessageId := pin.Value
        }

        result := ComCall(15, this, "ptr", pFaxAccount, "ptr", bstrMessageId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-_ifaxaccountnotify-onoutgoingmessageremoved
     */
    OnOutgoingMessageRemoved(pFaxAccount, bstrMessageId) {
        if(bstrMessageId is String) {
            pin := BSTR.Alloc(bstrMessageId)
            bstrMessageId := pin.Value
        }

        result := ComCall(16, this, "ptr", pFaxAccount, "ptr", bstrMessageId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-_ifaxaccountnotify-onservershutdown
     */
    OnServerShutDown(pFaxServer) {
        result := ComCall(17, this, "ptr", pFaxServer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
