#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if a queued message is created, de-queued, or moved to a retry or dead letter queue.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomqcevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComQCEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComQCEvents
     * @type {Guid}
     */
    static IID => Guid("{683130b2-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnQCRecord", "OnQCQueueOpen", "OnQCReceive", "OnQCReceiveFail", "OnQCMoveToReTryQueue", "OnQCMoveToDeadQueue", "OnQCPlayback"]

    /**
     * Generated when the queued components recorder creates the queued message.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} objid The just-in-time activated object.
     * @param {PWSTR} szQueue The name of the queue.
     * @param {Pointer<Guid>} guidMsgId The unique identifier for the queued message.
     * @param {Pointer<Guid>} guidWorkFlowId This parameter is reserved.
     * @param {HRESULT} msmqhr The Message Queuing return status for the queued message.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomqcevents-onqcrecord
     */
    OnQCRecord(pInfo, objid, szQueue, guidMsgId, guidWorkFlowId, msmqhr) {
        szQueue := szQueue is String ? StrPtr(szQueue) : szQueue

        result := ComCall(3, this, "ptr", pInfo, "uint", objid, "ptr", szQueue, "ptr", guidMsgId, "ptr", guidWorkFlowId, "int", msmqhr, "HRESULT")
        return result
    }

    /**
     * Generated when a queued components queue is opened.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {PWSTR} szQueue The name of the queue.
     * @param {Integer} QueueID The unique identifier for the queue.
     * @param {HRESULT} hr The status from Message Queuing queue open.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomqcevents-onqcqueueopen
     */
    OnQCQueueOpen(pInfo, szQueue, QueueID, hr) {
        szQueue := szQueue is String ? StrPtr(szQueue) : szQueue

        result := ComCall(4, this, "ptr", pInfo, "ptr", szQueue, "uint", QueueID, "int", hr, "HRESULT")
        return result
    }

    /**
     * Generated when a message is successfully de-queued even though the queued components service might find something wrong with the contents.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} QueueID The unique identifier for the queue.
     * @param {Pointer<Guid>} guidMsgId The unique identifier for the queued message.
     * @param {Pointer<Guid>} guidWorkFlowId This parameter is reserved.
     * @param {HRESULT} hr The status from Queued Components processing of the received message.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomqcevents-onqcreceive
     */
    OnQCReceive(pInfo, QueueID, guidMsgId, guidWorkFlowId, hr) {
        result := ComCall(5, this, "ptr", pInfo, "uint", QueueID, "ptr", guidMsgId, "ptr", guidWorkFlowId, "int", hr, "HRESULT")
        return result
    }

    /**
     * Generated when the receive message fails.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} QueueID The unique identifier for the queue.
     * @param {HRESULT} msmqhr The status from Queued Components processing of the received message.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomqcevents-onqcreceivefail
     */
    OnQCReceiveFail(pInfo, QueueID, msmqhr) {
        result := ComCall(6, this, "ptr", pInfo, "uint", QueueID, "int", msmqhr, "HRESULT")
        return result
    }

    /**
     * Generated when a message is moved to a queued components retry queue.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidMsgId The unique identifier for the message.
     * @param {Pointer<Guid>} guidWorkFlowId This parameter is reserved.
     * @param {Integer} RetryIndex The index number of the retry queue where the message moved.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomqcevents-onqcmovetoretryqueue
     */
    OnQCMoveToReTryQueue(pInfo, guidMsgId, guidWorkFlowId, RetryIndex) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidMsgId, "ptr", guidWorkFlowId, "uint", RetryIndex, "HRESULT")
        return result
    }

    /**
     * Generated when a message is moved to the dead letter queue and cannot be delivered.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidMsgId The unique identifier for the message.
     * @param {Pointer<Guid>} guidWorkFlowId This parameter is reserved.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomqcevents-onqcmovetodeadqueue
     */
    OnQCMoveToDeadQueue(pInfo, guidMsgId, guidWorkFlowId) {
        result := ComCall(8, this, "ptr", pInfo, "ptr", guidMsgId, "ptr", guidWorkFlowId, "HRESULT")
        return result
    }

    /**
     * Generated when a messages contents are replayed.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} objid The just-in-time activated object.
     * @param {Pointer<Guid>} guidMsgId The unique identifier for the queue.
     * @param {Pointer<Guid>} guidWorkFlowId This parameter is reserved.
     * @param {HRESULT} hr The status from Message Queuing receive message.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomqcevents-onqcplayback
     */
    OnQCPlayback(pInfo, objid, guidMsgId, guidWorkFlowId, hr) {
        result := ComCall(9, this, "ptr", pInfo, "uint", objid, "ptr", guidMsgId, "ptr", guidWorkFlowId, "int", hr, "HRESULT")
        return result
    }
}
