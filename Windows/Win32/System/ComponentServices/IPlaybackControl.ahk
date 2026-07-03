#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables participation in the abnormal handling of server-side playback errors and client-side failures of the Message Queuing delivery mechanism.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iplaybackcontrol
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IPlaybackControl extends IUnknown {
    /**
     * The interface identifier for IPlaybackControl
     * @type {Guid}
     */
    static IID := Guid("{51372afd-cae7-11cf-be81-00aa00a2fa25}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPlaybackControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FinalClientRetry : IntPtr
        FinalServerRetry : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPlaybackControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Informs the client-side exception handling component that all Message Queuing attempts to deliver the message to the server were rejected. The message ended up on the client-side Xact dead letter queue.
     * @remarks
     * As messages arrive on the Xact dead letter queue, COM+ attempts to invoke a client-side exception handler related to the server class to deliver this notification. This exception object might take exceptional action, such as recording the failure, sending a mail message to the administrator, or taking client-side compensating action (reversing the effect of an earlier transaction).
     * 
     * 
     * 
     * If this method is not successful, the message is left on the Xact dead letter queue.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iplaybackcontrol-finalclientretry
     */
    FinalClientRetry() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Informs the server-side Exception_CLSID implementation that all attempts to play back the deferred activation have failed. The message is about to be moved to the final resting queue.
     * @remarks
     * As the message is about to be moved to the final resting queue, the server object may attempt to record the failure, send a mail message to the administrator, or take client-side compensating action (reversing the effect of an earlier transaction). The server object should make every effort to complete this transaction successfully. Otherwise, manual intervention is required to reprocess the message.
     * 
     * 
     * 
     * If this method is not successful, the message is moved to the final resting queue.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iplaybackcontrol-finalserverretry
     */
    FinalServerRetry() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPlaybackControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FinalClientRetry := CallbackCreate(GetMethod(implObj, "FinalClientRetry"), flags, 1)
        this.vtbl.FinalServerRetry := CallbackCreate(GetMethod(implObj, "FinalServerRetry"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FinalClientRetry)
        CallbackFree(this.vtbl.FinalServerRetry)
    }
}
