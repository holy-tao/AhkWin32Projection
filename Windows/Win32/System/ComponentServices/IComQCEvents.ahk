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
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} objid 
     * @param {PWSTR} szQueue 
     * @param {Pointer<Guid>} guidMsgId 
     * @param {Pointer<Guid>} guidWorkFlowId 
     * @param {HRESULT} msmqhr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomqcevents-onqcrecord
     */
    OnQCRecord(pInfo, objid, szQueue, guidMsgId, guidWorkFlowId, msmqhr) {
        szQueue := szQueue is String ? StrPtr(szQueue) : szQueue

        result := ComCall(3, this, "ptr", pInfo, "uint", objid, "ptr", szQueue, "ptr", guidMsgId, "ptr", guidWorkFlowId, "int", msmqhr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {PWSTR} szQueue 
     * @param {Integer} QueueID 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomqcevents-onqcqueueopen
     */
    OnQCQueueOpen(pInfo, szQueue, QueueID, hr) {
        szQueue := szQueue is String ? StrPtr(szQueue) : szQueue

        result := ComCall(4, this, "ptr", pInfo, "ptr", szQueue, "uint", QueueID, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} QueueID 
     * @param {Pointer<Guid>} guidMsgId 
     * @param {Pointer<Guid>} guidWorkFlowId 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomqcevents-onqcreceive
     */
    OnQCReceive(pInfo, QueueID, guidMsgId, guidWorkFlowId, hr) {
        result := ComCall(5, this, "ptr", pInfo, "uint", QueueID, "ptr", guidMsgId, "ptr", guidWorkFlowId, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} QueueID 
     * @param {HRESULT} msmqhr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomqcevents-onqcreceivefail
     */
    OnQCReceiveFail(pInfo, QueueID, msmqhr) {
        result := ComCall(6, this, "ptr", pInfo, "uint", QueueID, "int", msmqhr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidMsgId 
     * @param {Pointer<Guid>} guidWorkFlowId 
     * @param {Integer} RetryIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomqcevents-onqcmovetoretryqueue
     */
    OnQCMoveToReTryQueue(pInfo, guidMsgId, guidWorkFlowId, RetryIndex) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidMsgId, "ptr", guidWorkFlowId, "uint", RetryIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidMsgId 
     * @param {Pointer<Guid>} guidWorkFlowId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomqcevents-onqcmovetodeadqueue
     */
    OnQCMoveToDeadQueue(pInfo, guidMsgId, guidWorkFlowId) {
        result := ComCall(8, this, "ptr", pInfo, "ptr", guidMsgId, "ptr", guidWorkFlowId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} objid 
     * @param {Pointer<Guid>} guidMsgId 
     * @param {Pointer<Guid>} guidWorkFlowId 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomqcevents-onqcplayback
     */
    OnQCPlayback(pInfo, objid, guidMsgId, guidWorkFlowId, hr) {
        result := ComCall(9, this, "ptr", pInfo, "uint", objid, "ptr", guidMsgId, "ptr", guidWorkFlowId, "int", hr, "HRESULT")
        return result
    }
}
