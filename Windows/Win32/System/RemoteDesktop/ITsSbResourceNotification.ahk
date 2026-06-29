#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CONNECTION_CHANGE_NOTIFICATION.ahk" { CONNECTION_CHANGE_NOTIFICATION }
#Import ".\ITsSbSession.ahk" { ITsSbSession }
#Import ".\ITsSbTarget.ahk" { ITsSbTarget }
#Import ".\ITsSbClientConnection.ahk" { ITsSbClientConnection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TSSESSION_STATE.ahk" { TSSESSION_STATE }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that Remote Desktop Connection Broker (RD Connection Broker) uses to notify plug-ins of any state changes that occur in the session, target, and client connection objects. (ITsSbResourceNotification)
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbresourcenotification
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbResourceNotification extends IUnknown {
    /**
     * The interface identifier for ITsSbResourceNotification
     * @type {Guid}
     */
    static IID := Guid("{65d3e85a-c39b-11dc-b92d-3cd255d89593}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbResourceNotification interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NotifySessionChange               : IntPtr
        NotifyTargetChange                : IntPtr
        NotifyClientConnectionStateChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbResourceNotification.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies registered plug-ins about state changes in a session object. (ITsSbResourceNotification.NotifySessionChange)
     * @remarks
     * RD Connection Broker calls the <b>NotifySessionChange</b> method to notify registered plug-ins about state changes in a session object. For example, RD Connection Broker calls this method when a new session is added to the resource plug-in store as a result of a session logon.
     * @param {TSSESSION_STATE} _changeType The type of change that occurred.
     * @param {ITsSbSession} pSession A pointer to a session object. This object is a copy of the object present in the RD Connection Broker store. Any changes to this object do not affect the object in the store.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcenotification-notifysessionchange
     */
    NotifySessionChange(_changeType, pSession) {
        result := ComCall(3, this, TSSESSION_STATE, _changeType, "ptr", pSession, "HRESULT")
        return result
    }

    /**
     * Notifies registered plug-ins about state changes in a target object. (ITsSbResourceNotification.NotifyTargetChange)
     * @remarks
     * RD Connection Broker calls the <b>NotifyTargetChange</b> method to notify registered plug-ins about state changes in a target object. For example, RD Connection Broker calls this method when a new session is added to the resource plug-in store as a result of a session logon.
     * @param {Integer} TargetChangeType A value of the <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-target_change_type">TARGET_CHANGE_TYPE</a> enumeration that specifies the type of change that occurred in a target.
     * @param {ITsSbTarget} pTarget A pointer to a target object. This object is a copy of the object present in the RD Connection Broker store. Any changes to this object do not affect the object in the store.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcenotification-notifytargetchange
     */
    NotifyTargetChange(TargetChangeType, pTarget) {
        result := ComCall(4, this, "uint", TargetChangeType, "ptr", pTarget, "HRESULT")
        return result
    }

    /**
     * Notifies registered plug-ins about state changes in a client connection. (ITsSbResourceNotification.NotifyClientConnectionStateChange)
     * @remarks
     * RD Connection Broker calls the <b>NotifyClientConnectionStateChange</b> method to notify registered plug-ins about state changes in a client connection.
     * @param {CONNECTION_CHANGE_NOTIFICATION} _ChangeType 
     * @param {ITsSbClientConnection} pConnection A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbclientconnection">ITsSbClientConnection</a> connection object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcenotification-notifyclientconnectionstatechange
     */
    NotifyClientConnectionStateChange(_ChangeType, pConnection) {
        result := ComCall(5, this, CONNECTION_CHANGE_NOTIFICATION, _ChangeType, "ptr", pConnection, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbResourceNotification.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NotifySessionChange := CallbackCreate(GetMethod(implObj, "NotifySessionChange"), flags, 3)
        this.vtbl.NotifyTargetChange := CallbackCreate(GetMethod(implObj, "NotifyTargetChange"), flags, 3)
        this.vtbl.NotifyClientConnectionStateChange := CallbackCreate(GetMethod(implObj, "NotifyClientConnectionStateChange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NotifySessionChange)
        CallbackFree(this.vtbl.NotifyTargetChange)
        CallbackFree(this.vtbl.NotifyClientConnectionStateChange)
    }
}
