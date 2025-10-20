#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Called by the fax service to send event notifications about particular fax accounts. This property sends event notifications. Events include changes to incoming and outgoing job queues, and changes to incoming and outgoing archives.
 * @remarks
 * 
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
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxaccountnotify
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxAccountNotify extends IDispatch{
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
     * 
     * @param {Pointer<IFaxAccount>} pFaxAccount 
     * @param {BSTR} bstrJobId 
     * @returns {HRESULT} 
     */
    OnIncomingJobAdded(pFaxAccount, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(7, this, "ptr", pFaxAccount, "ptr", bstrJobId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccount>} pFaxAccount 
     * @param {BSTR} bstrJobId 
     * @returns {HRESULT} 
     */
    OnIncomingJobRemoved(pFaxAccount, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(8, this, "ptr", pFaxAccount, "ptr", bstrJobId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccount>} pFaxAccount 
     * @param {BSTR} bstrJobId 
     * @param {Pointer<IFaxJobStatus>} pJobStatus 
     * @returns {HRESULT} 
     */
    OnIncomingJobChanged(pFaxAccount, bstrJobId, pJobStatus) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(9, this, "ptr", pFaxAccount, "ptr", bstrJobId, "ptr", pJobStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccount>} pFaxAccount 
     * @param {BSTR} bstrJobId 
     * @returns {HRESULT} 
     */
    OnOutgoingJobAdded(pFaxAccount, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(10, this, "ptr", pFaxAccount, "ptr", bstrJobId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccount>} pFaxAccount 
     * @param {BSTR} bstrJobId 
     * @returns {HRESULT} 
     */
    OnOutgoingJobRemoved(pFaxAccount, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(11, this, "ptr", pFaxAccount, "ptr", bstrJobId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccount>} pFaxAccount 
     * @param {BSTR} bstrJobId 
     * @param {Pointer<IFaxJobStatus>} pJobStatus 
     * @returns {HRESULT} 
     */
    OnOutgoingJobChanged(pFaxAccount, bstrJobId, pJobStatus) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(12, this, "ptr", pFaxAccount, "ptr", bstrJobId, "ptr", pJobStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccount>} pFaxAccount 
     * @param {BSTR} bstrMessageId 
     * @param {VARIANT_BOOL} fAddedToReceiveFolder 
     * @returns {HRESULT} 
     */
    OnIncomingMessageAdded(pFaxAccount, bstrMessageId, fAddedToReceiveFolder) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(13, this, "ptr", pFaxAccount, "ptr", bstrMessageId, "short", fAddedToReceiveFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccount>} pFaxAccount 
     * @param {BSTR} bstrMessageId 
     * @param {VARIANT_BOOL} fRemovedFromReceiveFolder 
     * @returns {HRESULT} 
     */
    OnIncomingMessageRemoved(pFaxAccount, bstrMessageId, fRemovedFromReceiveFolder) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(14, this, "ptr", pFaxAccount, "ptr", bstrMessageId, "short", fRemovedFromReceiveFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccount>} pFaxAccount 
     * @param {BSTR} bstrMessageId 
     * @returns {HRESULT} 
     */
    OnOutgoingMessageAdded(pFaxAccount, bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(15, this, "ptr", pFaxAccount, "ptr", bstrMessageId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccount>} pFaxAccount 
     * @param {BSTR} bstrMessageId 
     * @returns {HRESULT} 
     */
    OnOutgoingMessageRemoved(pFaxAccount, bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(16, this, "ptr", pFaxAccount, "ptr", bstrMessageId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxServer2>} pFaxServer 
     * @returns {HRESULT} 
     */
    OnServerShutDown(pFaxServer) {
        result := ComCall(17, this, "ptr", pFaxServer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
