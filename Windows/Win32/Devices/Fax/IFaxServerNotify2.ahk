#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\IFaxJobStatus.ahk" { IFaxJobStatus }
#Import ".\IFaxServer2.ahk" { IFaxServer2 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }

/**
 * The IFaxServerNotify2 interface is used for fax notifications. (IIFaxServerNotify2)
 * @remarks
 * <h3><a id="To_Use_Fax_Notification_Events_with_Visual_Basic"></a><a id="to_use_fax_notification_events_with_visual_basic"></a><a id="TO_USE_FAX_NOTIFICATION_EVENTS_WITH_VISUAL_BASIC"></a>To Use Fax Notification Events with Visual Basic</h3>
 * Use the following syntax when creating the root FaxServer2 object:
 * 
 * 
 * 
 * ```
 * 
 * Dim WithEvents objFaxServer2 As FaxServer2
 * 
 * ```
 * 
 * 
 * 
 * 
 * For an example, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-registering-for-fax-events">Registering for Fax Events</a>.
 *             
 * 
 * <h3><a id="To_Use_Fax_Notification_Events_with_C__"></a><a id="to_use_fax_notification_events_with_c__"></a><a id="TO_USE_FAX_NOTIFICATION_EVENTS_WITH_C__"></a>To Use Fax Notification Events with C++</h3>
 * A fax client application must implement <b>IFaxServerNotify2</b> and pass the fax service the pointer to an <b>IFaxServerNotify2</b> interface.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxservernotify2
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxServerNotify2 extends IDispatch {
    /**
     * The interface identifier for IFaxServerNotify2
     * @type {Guid}
     */
    static IID := Guid("{ec9c69b9-5fe7-4805-9467-82fcd96af903}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxServerNotify2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        OnIncomingJobAdded                  : IntPtr
        OnIncomingJobRemoved                : IntPtr
        OnIncomingJobChanged                : IntPtr
        OnOutgoingJobAdded                  : IntPtr
        OnOutgoingJobRemoved                : IntPtr
        OnOutgoingJobChanged                : IntPtr
        OnIncomingMessageAdded              : IntPtr
        OnIncomingMessageRemoved            : IntPtr
        OnOutgoingMessageAdded              : IntPtr
        OnOutgoingMessageRemoved            : IntPtr
        OnReceiptOptionsChange              : IntPtr
        OnActivityLoggingConfigChange       : IntPtr
        OnSecurityConfigChange              : IntPtr
        OnEventLoggingConfigChange          : IntPtr
        OnOutgoingQueueConfigChange         : IntPtr
        OnOutgoingArchiveConfigChange       : IntPtr
        OnIncomingArchiveConfigChange       : IntPtr
        OnDevicesConfigChange               : IntPtr
        OnOutboundRoutingGroupsConfigChange : IntPtr
        OnOutboundRoutingRulesConfigChange  : IntPtr
        OnServerActivityChange              : IntPtr
        OnQueuesStatusChange                : IntPtr
        OnNewCall                           : IntPtr
        OnServerShutDown                    : IntPtr
        OnDeviceStatusChange                : IntPtr
        OnGeneralServerConfigChanged        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxServerNotify2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrJobId 
     * @returns {HRESULT} 
     */
    OnIncomingJobAdded(pFaxServer, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(7, this, pFaxServerMarshal, pFaxServer, BSTR, bstrJobId, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrJobId 
     * @returns {HRESULT} 
     */
    OnIncomingJobRemoved(pFaxServer, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(8, this, pFaxServerMarshal, pFaxServer, BSTR, bstrJobId, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrJobId 
     * @param {IFaxJobStatus} pJobStatus 
     * @returns {HRESULT} 
     */
    OnIncomingJobChanged(pFaxServer, bstrJobId, pJobStatus) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"
        pJobStatusMarshal := pJobStatus == 0 ? IntPtr : "ptr"

        result := ComCall(9, this, pFaxServerMarshal, pFaxServer, BSTR, bstrJobId, pJobStatusMarshal, pJobStatus, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrJobId 
     * @returns {HRESULT} 
     */
    OnOutgoingJobAdded(pFaxServer, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(10, this, pFaxServerMarshal, pFaxServer, BSTR, bstrJobId, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrJobId 
     * @returns {HRESULT} 
     */
    OnOutgoingJobRemoved(pFaxServer, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(11, this, pFaxServerMarshal, pFaxServer, BSTR, bstrJobId, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrJobId 
     * @param {IFaxJobStatus} pJobStatus 
     * @returns {HRESULT} 
     */
    OnOutgoingJobChanged(pFaxServer, bstrJobId, pJobStatus) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"
        pJobStatusMarshal := pJobStatus == 0 ? IntPtr : "ptr"

        result := ComCall(12, this, pFaxServerMarshal, pFaxServer, BSTR, bstrJobId, pJobStatusMarshal, pJobStatus, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrMessageId 
     * @returns {HRESULT} 
     */
    OnIncomingMessageAdded(pFaxServer, bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(13, this, pFaxServerMarshal, pFaxServer, BSTR, bstrMessageId, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrMessageId 
     * @returns {HRESULT} 
     */
    OnIncomingMessageRemoved(pFaxServer, bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(14, this, pFaxServerMarshal, pFaxServer, BSTR, bstrMessageId, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrMessageId 
     * @returns {HRESULT} 
     */
    OnOutgoingMessageAdded(pFaxServer, bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(15, this, pFaxServerMarshal, pFaxServer, BSTR, bstrMessageId, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrMessageId 
     * @returns {HRESULT} 
     */
    OnOutgoingMessageRemoved(pFaxServer, bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(16, this, pFaxServerMarshal, pFaxServer, BSTR, bstrMessageId, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnReceiptOptionsChange(pFaxServer) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(17, this, pFaxServerMarshal, pFaxServer, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnActivityLoggingConfigChange(pFaxServer) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(18, this, pFaxServerMarshal, pFaxServer, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnSecurityConfigChange(pFaxServer) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(19, this, pFaxServerMarshal, pFaxServer, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnEventLoggingConfigChange(pFaxServer) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(20, this, pFaxServerMarshal, pFaxServer, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnOutgoingQueueConfigChange(pFaxServer) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(21, this, pFaxServerMarshal, pFaxServer, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnOutgoingArchiveConfigChange(pFaxServer) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(22, this, pFaxServerMarshal, pFaxServer, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnIncomingArchiveConfigChange(pFaxServer) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(23, this, pFaxServerMarshal, pFaxServer, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnDevicesConfigChange(pFaxServer) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(24, this, pFaxServerMarshal, pFaxServer, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnOutboundRoutingGroupsConfigChange(pFaxServer) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(25, this, pFaxServerMarshal, pFaxServer, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnOutboundRoutingRulesConfigChange(pFaxServer) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(26, this, pFaxServerMarshal, pFaxServer, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @param {Integer} lIncomingMessages 
     * @param {Integer} lRoutingMessages 
     * @param {Integer} lOutgoingMessages 
     * @param {Integer} lQueuedMessages 
     * @returns {HRESULT} 
     */
    OnServerActivityChange(pFaxServer, lIncomingMessages, lRoutingMessages, lOutgoingMessages, lQueuedMessages) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(27, this, pFaxServerMarshal, pFaxServer, Int32, lIncomingMessages, Int32, lRoutingMessages, Int32, lOutgoingMessages, Int32, lQueuedMessages, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @param {VARIANT_BOOL} bOutgoingQueueBlocked 
     * @param {VARIANT_BOOL} bOutgoingQueuePaused 
     * @param {VARIANT_BOOL} bIncomingQueueBlocked 
     * @returns {HRESULT} 
     */
    OnQueuesStatusChange(pFaxServer, bOutgoingQueueBlocked, bOutgoingQueuePaused, bIncomingQueueBlocked) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(28, this, pFaxServerMarshal, pFaxServer, VARIANT_BOOL, bOutgoingQueueBlocked, VARIANT_BOOL, bOutgoingQueuePaused, VARIANT_BOOL, bIncomingQueueBlocked, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @param {Integer} lCallId 
     * @param {Integer} lDeviceId 
     * @param {BSTR} bstrCallerId 
     * @returns {HRESULT} 
     */
    OnNewCall(pFaxServer, lCallId, lDeviceId, bstrCallerId) {
        bstrCallerId := bstrCallerId is String ? BSTR.Alloc(bstrCallerId).Value : bstrCallerId

        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(29, this, pFaxServerMarshal, pFaxServer, Int32, lCallId, Int32, lDeviceId, BSTR, bstrCallerId, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnServerShutDown(pFaxServer) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(30, this, pFaxServerMarshal, pFaxServer, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @param {Integer} lDeviceId 
     * @param {VARIANT_BOOL} bPoweredOff 
     * @param {VARIANT_BOOL} bSending 
     * @param {VARIANT_BOOL} bReceiving 
     * @param {VARIANT_BOOL} bRinging 
     * @returns {HRESULT} 
     */
    OnDeviceStatusChange(pFaxServer, lDeviceId, bPoweredOff, bSending, bReceiving, bRinging) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(31, this, pFaxServerMarshal, pFaxServer, Int32, lDeviceId, VARIANT_BOOL, bPoweredOff, VARIANT_BOOL, bSending, VARIANT_BOOL, bReceiving, VARIANT_BOOL, bRinging, "HRESULT")
        return result
    }

    /**
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnGeneralServerConfigChanged(pFaxServer) {
        pFaxServerMarshal := pFaxServer == 0 ? IntPtr : "ptr"

        result := ComCall(32, this, pFaxServerMarshal, pFaxServer, "HRESULT")
        return result
    }

    _Query(iid) {
        if (IFaxServerNotify2.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnIncomingJobAdded := CallbackCreate(ObjBindMethod(implObj, "OnIncomingJobAdded"), flags, 3)
        this.vtbl.OnIncomingJobRemoved := CallbackCreate(ObjBindMethod(implObj, "OnIncomingJobRemoved"), flags, 3)
        this.vtbl.OnIncomingJobChanged := CallbackCreate(ObjBindMethod(implObj, "OnIncomingJobChanged"), flags, 4)
        this.vtbl.OnOutgoingJobAdded := CallbackCreate(ObjBindMethod(implObj, "OnOutgoingJobAdded"), flags, 3)
        this.vtbl.OnOutgoingJobRemoved := CallbackCreate(ObjBindMethod(implObj, "OnOutgoingJobRemoved"), flags, 3)
        this.vtbl.OnOutgoingJobChanged := CallbackCreate(ObjBindMethod(implObj, "OnOutgoingJobChanged"), flags, 4)
        this.vtbl.OnIncomingMessageAdded := CallbackCreate(ObjBindMethod(implObj, "OnIncomingMessageAdded"), flags, 3)
        this.vtbl.OnIncomingMessageRemoved := CallbackCreate(ObjBindMethod(implObj, "OnIncomingMessageRemoved"), flags, 3)
        this.vtbl.OnOutgoingMessageAdded := CallbackCreate(ObjBindMethod(implObj, "OnOutgoingMessageAdded"), flags, 3)
        this.vtbl.OnOutgoingMessageRemoved := CallbackCreate(ObjBindMethod(implObj, "OnOutgoingMessageRemoved"), flags, 3)
        this.vtbl.OnReceiptOptionsChange := CallbackCreate(ObjBindMethod(implObj, "OnReceiptOptionsChange"), flags, 2)
        this.vtbl.OnActivityLoggingConfigChange := CallbackCreate(ObjBindMethod(implObj, "OnActivityLoggingConfigChange"), flags, 2)
        this.vtbl.OnSecurityConfigChange := CallbackCreate(ObjBindMethod(implObj, "OnSecurityConfigChange"), flags, 2)
        this.vtbl.OnEventLoggingConfigChange := CallbackCreate(ObjBindMethod(implObj, "OnEventLoggingConfigChange"), flags, 2)
        this.vtbl.OnOutgoingQueueConfigChange := CallbackCreate(ObjBindMethod(implObj, "OnOutgoingQueueConfigChange"), flags, 2)
        this.vtbl.OnOutgoingArchiveConfigChange := CallbackCreate(ObjBindMethod(implObj, "OnOutgoingArchiveConfigChange"), flags, 2)
        this.vtbl.OnIncomingArchiveConfigChange := CallbackCreate(ObjBindMethod(implObj, "OnIncomingArchiveConfigChange"), flags, 2)
        this.vtbl.OnDevicesConfigChange := CallbackCreate(ObjBindMethod(implObj, "OnDevicesConfigChange"), flags, 2)
        this.vtbl.OnOutboundRoutingGroupsConfigChange := CallbackCreate(ObjBindMethod(implObj, "OnOutboundRoutingGroupsConfigChange"), flags, 2)
        this.vtbl.OnOutboundRoutingRulesConfigChange := CallbackCreate(ObjBindMethod(implObj, "OnOutboundRoutingRulesConfigChange"), flags, 2)
        this.vtbl.OnServerActivityChange := CallbackCreate(ObjBindMethod(implObj, "OnServerActivityChange"), flags, 6)
        this.vtbl.OnQueuesStatusChange := CallbackCreate(ObjBindMethod(implObj, "OnQueuesStatusChange"), flags, 5)
        this.vtbl.OnNewCall := CallbackCreate(ObjBindMethod(implObj, "OnNewCall"), flags, 5)
        this.vtbl.OnServerShutDown := CallbackCreate(ObjBindMethod(implObj, "OnServerShutDown"), flags, 2)
        this.vtbl.OnDeviceStatusChange := CallbackCreate(ObjBindMethod(implObj, "OnDeviceStatusChange"), flags, 7)
        this.vtbl.OnGeneralServerConfigChanged := CallbackCreate(ObjBindMethod(implObj, "OnGeneralServerConfigChanged"), flags, 2)
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
        CallbackFree(this.vtbl.OnReceiptOptionsChange)
        CallbackFree(this.vtbl.OnActivityLoggingConfigChange)
        CallbackFree(this.vtbl.OnSecurityConfigChange)
        CallbackFree(this.vtbl.OnEventLoggingConfigChange)
        CallbackFree(this.vtbl.OnOutgoingQueueConfigChange)
        CallbackFree(this.vtbl.OnOutgoingArchiveConfigChange)
        CallbackFree(this.vtbl.OnIncomingArchiveConfigChange)
        CallbackFree(this.vtbl.OnDevicesConfigChange)
        CallbackFree(this.vtbl.OnOutboundRoutingGroupsConfigChange)
        CallbackFree(this.vtbl.OnOutboundRoutingRulesConfigChange)
        CallbackFree(this.vtbl.OnServerActivityChange)
        CallbackFree(this.vtbl.OnQueuesStatusChange)
        CallbackFree(this.vtbl.OnNewCall)
        CallbackFree(this.vtbl.OnServerShutDown)
        CallbackFree(this.vtbl.OnDeviceStatusChange)
        CallbackFree(this.vtbl.OnGeneralServerConfigChanged)
    }
}
