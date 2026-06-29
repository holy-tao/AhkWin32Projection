#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\CONNECTION_CHANGE_NOTIFICATION.ahk" { CONNECTION_CHANGE_NOTIFICATION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TSSESSION_STATE.ahk" { TSSESSION_STATE }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that Remote Desktop Connection Broker (RD Connection Broker) uses to notify plug-ins of any state changes that occur in the session, target, and client connection objects. (ITsSbResourceNotificationEx)
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbresourcenotificationex
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbResourceNotificationEx extends IUnknown {
    /**
     * The interface identifier for ITsSbResourceNotificationEx
     * @type {Guid}
     */
    static IID := Guid("{a8a47fde-ca91-44d2-b897-3aa28a43b2b7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbResourceNotificationEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NotifySessionChangeEx               : IntPtr
        NotifyTargetChangeEx                : IntPtr
        NotifyClientConnectionStateChangeEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbResourceNotificationEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies registered plug-ins about state changes in a session object. (ITsSbResourceNotificationEx.NotifySessionChangeEx)
     * @param {BSTR} targetName The name of the target.
     * @param {BSTR} userName The user name.
     * @param {BSTR} domain The user domain.
     * @param {Integer} sessionId Identifies the session that changed.
     * @param {TSSESSION_STATE} sessionState A <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-tssession_state">TSSESSION_STATE</a> value specifying he type of change that occurred.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcenotificationex-notifysessionchangeex
     */
    NotifySessionChangeEx(targetName, userName, domain, sessionId, sessionState) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        domain := domain is String ? BSTR.Alloc(domain).Value : domain

        result := ComCall(3, this, BSTR, targetName, BSTR, userName, BSTR, domain, "uint", sessionId, TSSESSION_STATE, sessionState, "HRESULT")
        return result
    }

    /**
     * Notifies registered plug-ins about state changes in a target object. (ITsSbResourceNotificationEx.NotifyTargetChangeEx)
     * @param {BSTR} targetName The name of the target.
     * @param {Integer} targetChangeType A value of the <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-target_change_type">TARGET_CHANGE_TYPE</a> enumeration that specifies the type of change that occurred in a target.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcenotificationex-notifytargetchangeex
     */
    NotifyTargetChangeEx(targetName, targetChangeType) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(4, this, BSTR, targetName, "uint", targetChangeType, "HRESULT")
        return result
    }

    /**
     * Notifies registered plug-ins about state changes in a client connection. (ITsSbResourceNotificationEx.NotifyClientConnectionStateChangeEx)
     * @param {BSTR} userName The user name.
     * @param {BSTR} domain The user domain.
     * @param {BSTR} initialProgram The initial program.
     * @param {BSTR} poolName The name of the pool.
     * @param {BSTR} targetName The name of the target.
     * @param {CONNECTION_CHANGE_NOTIFICATION} connectionChangeType 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcenotificationex-notifyclientconnectionstatechangeex
     */
    NotifyClientConnectionStateChangeEx(userName, domain, initialProgram, poolName, targetName, connectionChangeType) {
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        domain := domain is String ? BSTR.Alloc(domain).Value : domain
        initialProgram := initialProgram is String ? BSTR.Alloc(initialProgram).Value : initialProgram
        poolName := poolName is String ? BSTR.Alloc(poolName).Value : poolName
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(5, this, BSTR, userName, BSTR, domain, BSTR, initialProgram, BSTR, poolName, BSTR, targetName, CONNECTION_CHANGE_NOTIFICATION, connectionChangeType, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbResourceNotificationEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NotifySessionChangeEx := CallbackCreate(GetMethod(implObj, "NotifySessionChangeEx"), flags, 6)
        this.vtbl.NotifyTargetChangeEx := CallbackCreate(GetMethod(implObj, "NotifyTargetChangeEx"), flags, 3)
        this.vtbl.NotifyClientConnectionStateChangeEx := CallbackCreate(GetMethod(implObj, "NotifyClientConnectionStateChangeEx"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NotifySessionChangeEx)
        CallbackFree(this.vtbl.NotifyTargetChangeEx)
        CallbackFree(this.vtbl.NotifyClientConnectionStateChangeEx)
    }
}
