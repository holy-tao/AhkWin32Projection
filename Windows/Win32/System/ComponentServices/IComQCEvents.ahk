#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if a queued message is created, de-queued, or moved to a retry or dead letter queue.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomqcevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComQCEvents extends IUnknown {
    /**
     * The interface identifier for IComQCEvents
     * @type {Guid}
     */
    static IID := Guid("{683130b2-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComQCEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnQCRecord           : IntPtr
        OnQCQueueOpen        : IntPtr
        OnQCReceive          : IntPtr
        OnQCReceiveFail      : IntPtr
        OnQCMoveToReTryQueue : IntPtr
        OnQCMoveToDeadQueue  : IntPtr
        OnQCPlayback         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComQCEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when the queued components recorder creates the queued message.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} objid The just-in-time activated object.
     * @param {PWSTR} szQueue The name of the queue.
     * @param {Pointer<Guid>} guidMsgId The unique identifier for the queued message.
     * @param {Pointer<Guid>} guidWorkFlowId This parameter is reserved.
     * @param {HRESULT} msmqhr The Message Queuing return status for the queued message.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomqcevents-onqcrecord
     */
    OnQCRecord(pInfo, objid, szQueue, guidMsgId, guidWorkFlowId, msmqhr) {
        szQueue := szQueue is String ? StrPtr(szQueue) : szQueue

        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", objid, "ptr", szQueue, Guid.Ptr, guidMsgId, Guid.Ptr, guidWorkFlowId, "int", msmqhr, "HRESULT")
        return result
    }

    /**
     * Generated when a queued components queue is opened.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {PWSTR} szQueue The name of the queue.
     * @param {Integer} QueueID The unique identifier for the queue.
     * @param {HRESULT} hr The status from Message Queuing queue open.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomqcevents-onqcqueueopen
     */
    OnQCQueueOpen(pInfo, szQueue, QueueID, hr) {
        szQueue := szQueue is String ? StrPtr(szQueue) : szQueue

        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, "ptr", szQueue, "uint", QueueID, "int", hr, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomqcevents-onqcreceive
     */
    OnQCReceive(pInfo, QueueID, guidMsgId, guidWorkFlowId, hr) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", QueueID, Guid.Ptr, guidMsgId, Guid.Ptr, guidWorkFlowId, "int", hr, "HRESULT")
        return result
    }

    /**
     * Generated when the receive message fails.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} QueueID The unique identifier for the queue.
     * @param {HRESULT} msmqhr The status from Queued Components processing of the received message.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomqcevents-onqcreceivefail
     */
    OnQCReceiveFail(pInfo, QueueID, msmqhr) {
        result := ComCall(6, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", QueueID, "int", msmqhr, "HRESULT")
        return result
    }

    /**
     * Generated when a message is moved to a queued components retry queue.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidMsgId The unique identifier for the message.
     * @param {Pointer<Guid>} guidWorkFlowId This parameter is reserved.
     * @param {Integer} RetryIndex The index number of the retry queue where the message moved.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomqcevents-onqcmovetoretryqueue
     */
    OnQCMoveToReTryQueue(pInfo, guidMsgId, guidWorkFlowId, RetryIndex) {
        result := ComCall(7, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidMsgId, Guid.Ptr, guidWorkFlowId, "uint", RetryIndex, "HRESULT")
        return result
    }

    /**
     * Generated when a message is moved to the dead letter queue and cannot be delivered.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidMsgId The unique identifier for the message.
     * @param {Pointer<Guid>} guidWorkFlowId This parameter is reserved.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomqcevents-onqcmovetodeadqueue
     */
    OnQCMoveToDeadQueue(pInfo, guidMsgId, guidWorkFlowId) {
        result := ComCall(8, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidMsgId, Guid.Ptr, guidWorkFlowId, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomqcevents-onqcplayback
     */
    OnQCPlayback(pInfo, objid, guidMsgId, guidWorkFlowId, hr) {
        result := ComCall(9, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", objid, Guid.Ptr, guidMsgId, Guid.Ptr, guidWorkFlowId, "int", hr, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComQCEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnQCRecord := CallbackCreate(GetMethod(implObj, "OnQCRecord"), flags, 7)
        this.vtbl.OnQCQueueOpen := CallbackCreate(GetMethod(implObj, "OnQCQueueOpen"), flags, 5)
        this.vtbl.OnQCReceive := CallbackCreate(GetMethod(implObj, "OnQCReceive"), flags, 6)
        this.vtbl.OnQCReceiveFail := CallbackCreate(GetMethod(implObj, "OnQCReceiveFail"), flags, 4)
        this.vtbl.OnQCMoveToReTryQueue := CallbackCreate(GetMethod(implObj, "OnQCMoveToReTryQueue"), flags, 5)
        this.vtbl.OnQCMoveToDeadQueue := CallbackCreate(GetMethod(implObj, "OnQCMoveToDeadQueue"), flags, 4)
        this.vtbl.OnQCPlayback := CallbackCreate(GetMethod(implObj, "OnQCPlayback"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnQCRecord)
        CallbackFree(this.vtbl.OnQCQueueOpen)
        CallbackFree(this.vtbl.OnQCReceive)
        CallbackFree(this.vtbl.OnQCReceiveFail)
        CallbackFree(this.vtbl.OnQCMoveToReTryQueue)
        CallbackFree(this.vtbl.OnQCMoveToDeadQueue)
        CallbackFree(this.vtbl.OnQCPlayback)
    }
}
