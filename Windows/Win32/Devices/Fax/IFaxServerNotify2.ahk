#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxServerNotify2 interface is used for fax notifications.
 * @remarks
 * 
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
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxservernotify2
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxServerNotify2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxServerNotify2
     * @type {Guid}
     */
    static IID => Guid("{ec9c69b9-5fe7-4805-9467-82fcd96af903}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnIncomingJobAdded", "OnIncomingJobRemoved", "OnIncomingJobChanged", "OnOutgoingJobAdded", "OnOutgoingJobRemoved", "OnOutgoingJobChanged", "OnIncomingMessageAdded", "OnIncomingMessageRemoved", "OnOutgoingMessageAdded", "OnOutgoingMessageRemoved", "OnReceiptOptionsChange", "OnActivityLoggingConfigChange", "OnSecurityConfigChange", "OnEventLoggingConfigChange", "OnOutgoingQueueConfigChange", "OnOutgoingArchiveConfigChange", "OnIncomingArchiveConfigChange", "OnDevicesConfigChange", "OnOutboundRoutingGroupsConfigChange", "OnOutboundRoutingRulesConfigChange", "OnServerActivityChange", "OnQueuesStatusChange", "OnNewCall", "OnServerShutDown", "OnDeviceStatusChange", "OnGeneralServerConfigChanged"]

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrJobId 
     * @returns {HRESULT} 
     */
    OnIncomingJobAdded(pFaxServer, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(7, this, "ptr", pFaxServer, "ptr", bstrJobId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrJobId 
     * @returns {HRESULT} 
     */
    OnIncomingJobRemoved(pFaxServer, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(8, this, "ptr", pFaxServer, "ptr", bstrJobId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrJobId 
     * @param {IFaxJobStatus} pJobStatus 
     * @returns {HRESULT} 
     */
    OnIncomingJobChanged(pFaxServer, bstrJobId, pJobStatus) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(9, this, "ptr", pFaxServer, "ptr", bstrJobId, "ptr", pJobStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrJobId 
     * @returns {HRESULT} 
     */
    OnOutgoingJobAdded(pFaxServer, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(10, this, "ptr", pFaxServer, "ptr", bstrJobId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrJobId 
     * @returns {HRESULT} 
     */
    OnOutgoingJobRemoved(pFaxServer, bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(11, this, "ptr", pFaxServer, "ptr", bstrJobId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrJobId 
     * @param {IFaxJobStatus} pJobStatus 
     * @returns {HRESULT} 
     */
    OnOutgoingJobChanged(pFaxServer, bstrJobId, pJobStatus) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(12, this, "ptr", pFaxServer, "ptr", bstrJobId, "ptr", pJobStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrMessageId 
     * @returns {HRESULT} 
     */
    OnIncomingMessageAdded(pFaxServer, bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(13, this, "ptr", pFaxServer, "ptr", bstrMessageId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrMessageId 
     * @returns {HRESULT} 
     */
    OnIncomingMessageRemoved(pFaxServer, bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(14, this, "ptr", pFaxServer, "ptr", bstrMessageId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrMessageId 
     * @returns {HRESULT} 
     */
    OnOutgoingMessageAdded(pFaxServer, bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(15, this, "ptr", pFaxServer, "ptr", bstrMessageId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @param {BSTR} bstrMessageId 
     * @returns {HRESULT} 
     */
    OnOutgoingMessageRemoved(pFaxServer, bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(16, this, "ptr", pFaxServer, "ptr", bstrMessageId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnReceiptOptionsChange(pFaxServer) {
        result := ComCall(17, this, "ptr", pFaxServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnActivityLoggingConfigChange(pFaxServer) {
        result := ComCall(18, this, "ptr", pFaxServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnSecurityConfigChange(pFaxServer) {
        result := ComCall(19, this, "ptr", pFaxServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnEventLoggingConfigChange(pFaxServer) {
        result := ComCall(20, this, "ptr", pFaxServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnOutgoingQueueConfigChange(pFaxServer) {
        result := ComCall(21, this, "ptr", pFaxServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnOutgoingArchiveConfigChange(pFaxServer) {
        result := ComCall(22, this, "ptr", pFaxServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnIncomingArchiveConfigChange(pFaxServer) {
        result := ComCall(23, this, "ptr", pFaxServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnDevicesConfigChange(pFaxServer) {
        result := ComCall(24, this, "ptr", pFaxServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnOutboundRoutingGroupsConfigChange(pFaxServer) {
        result := ComCall(25, this, "ptr", pFaxServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnOutboundRoutingRulesConfigChange(pFaxServer) {
        result := ComCall(26, this, "ptr", pFaxServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @param {Integer} lIncomingMessages 
     * @param {Integer} lRoutingMessages 
     * @param {Integer} lOutgoingMessages 
     * @param {Integer} lQueuedMessages 
     * @returns {HRESULT} 
     */
    OnServerActivityChange(pFaxServer, lIncomingMessages, lRoutingMessages, lOutgoingMessages, lQueuedMessages) {
        result := ComCall(27, this, "ptr", pFaxServer, "int", lIncomingMessages, "int", lRoutingMessages, "int", lOutgoingMessages, "int", lQueuedMessages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @param {VARIANT_BOOL} bOutgoingQueueBlocked 
     * @param {VARIANT_BOOL} bOutgoingQueuePaused 
     * @param {VARIANT_BOOL} bIncomingQueueBlocked 
     * @returns {HRESULT} 
     */
    OnQueuesStatusChange(pFaxServer, bOutgoingQueueBlocked, bOutgoingQueuePaused, bIncomingQueueBlocked) {
        result := ComCall(28, this, "ptr", pFaxServer, "short", bOutgoingQueueBlocked, "short", bOutgoingQueuePaused, "short", bIncomingQueueBlocked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @param {Integer} lCallId 
     * @param {Integer} lDeviceId 
     * @param {BSTR} bstrCallerId 
     * @returns {HRESULT} 
     */
    OnNewCall(pFaxServer, lCallId, lDeviceId, bstrCallerId) {
        bstrCallerId := bstrCallerId is String ? BSTR.Alloc(bstrCallerId).Value : bstrCallerId

        result := ComCall(29, this, "ptr", pFaxServer, "int", lCallId, "int", lDeviceId, "ptr", bstrCallerId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnServerShutDown(pFaxServer) {
        result := ComCall(30, this, "ptr", pFaxServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @param {Integer} lDeviceId 
     * @param {VARIANT_BOOL} bPoweredOff 
     * @param {VARIANT_BOOL} bSending 
     * @param {VARIANT_BOOL} bReceiving 
     * @param {VARIANT_BOOL} bRinging 
     * @returns {HRESULT} 
     */
    OnDeviceStatusChange(pFaxServer, lDeviceId, bPoweredOff, bSending, bReceiving, bRinging) {
        result := ComCall(31, this, "ptr", pFaxServer, "int", lDeviceId, "short", bPoweredOff, "short", bSending, "short", bReceiving, "short", bRinging, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer2} pFaxServer 
     * @returns {HRESULT} 
     */
    OnGeneralServerConfigChanged(pFaxServer) {
        result := ComCall(32, this, "ptr", pFaxServer, "HRESULT")
        return result
    }
}
