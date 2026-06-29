#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WTS_SESSION_ID.ahk" { WTS_SESSION_ID }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWTSProtocolListener.ahk" { IWTSProtocolListener }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\WTS_SERVICE_STATE.ahk" { WTS_SERVICE_STATE }

/**
 * IWTSProtocolManager is no longer available. Instead, use IWRdsProtocolManager.
 * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nn-wtsprotocol-iwtsprotocolmanager
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSProtocolManager extends IUnknown {
    /**
     * The interface identifier for IWTSProtocolManager
     * @type {Guid}
     */
    static IID := Guid("{f9eaf6cc-ed79-4f01-821d-1f881b9f66cc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSProtocolManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateListener              : IntPtr
        NotifyServiceStateChange    : IntPtr
        NotifySessionOfServiceStart : IntPtr
        NotifySessionOfServiceStop  : IntPtr
        NotifySessionStateChange    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSProtocolManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IWTSProtocolManager::CreateListener is no longer available. Instead, use IWRdsProtocolManager::CreateListener.
     * @remarks
     * The <b>CreateListener</b> method is the first call the Remote Desktop Services service  makes into your  protocol provider. The service looks in the registry under the following key to find the GUID of the listener to create:
     * 
     * 
     * <pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>System</b>
     *       <b>CurrentControlSet</b>
     *          <b>Control</b>
     *             <b>Terminal Server</b>
     *                <b>WinStations</b>
     *                   <b><i>ListenerName</i></b>
     *                      <b>LoadableProtocol_Object</b></pre>
     * @param {PWSTR} wszListenerName A pointer to a string that contains the registry GUID that specifies the listener to create.
     * @returns {IWTSProtocolListener} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocollistener">IWTSProtocolListener</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-createlistener
     */
    CreateListener(wszListenerName) {
        wszListenerName := wszListenerName is String ? StrPtr(wszListenerName) : wszListenerName

        result := ComCall(3, this, "ptr", wszListenerName, "ptr*", &pProtocolListener := 0, "HRESULT")
        return IWTSProtocolListener(pProtocolListener)
    }

    /**
     * IWTSProtocolManager::NotifyServiceStateChange is no longer available. Instead, use IWRdsProtocolManager::NotifyServiceStateChange.
     * @param {Pointer<WTS_SERVICE_STATE>} pTSServiceStateChange A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_service_state">WTS_SERVICE_STATE</a> structure that specifies 
     * whether the service is starting, stopping, or changing its drain state.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-notifyservicestatechange
     */
    NotifyServiceStateChange(pTSServiceStateChange) {
        result := ComCall(4, this, WTS_SERVICE_STATE.Ptr, pTSServiceStateChange, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolManager::NotifySessionOfServiceStart is no longer available. Instead, use IWRdsProtocolManager::NotifySessionOfServiceStart.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WTS_SESSION_ID</a> structure that uniquely identifies the session.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-notifysessionofservicestart
     */
    NotifySessionOfServiceStart(SessionId) {
        result := ComCall(5, this, WTS_SESSION_ID.Ptr, SessionId, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolManager::NotifySessionOfServiceStop is no longer available. Instead, use IWRdsProtocolManager::NotifySessionOfServiceStop.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WTS_SESSION_ID</a> structure that uniquely identifies the session.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-notifysessionofservicestop
     */
    NotifySessionOfServiceStop(SessionId) {
        result := ComCall(6, this, WTS_SESSION_ID.Ptr, SessionId, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolManager::NotifySessionStateChange is no longer available. Instead, use IWRdsProtocolManager::NotifySessionStateChange.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WTS_SESSION_ID</a> structure that uniquely identifies the session.
     * @param {Integer} EventId An integer that contains the event ID. The following IDs can be found in Winuser.h.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-notifysessionstatechange
     */
    NotifySessionStateChange(SessionId, EventId) {
        result := ComCall(7, this, WTS_SESSION_ID.Ptr, SessionId, "uint", EventId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWTSProtocolManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateListener := CallbackCreate(GetMethod(implObj, "CreateListener"), flags, 3)
        this.vtbl.NotifyServiceStateChange := CallbackCreate(GetMethod(implObj, "NotifyServiceStateChange"), flags, 2)
        this.vtbl.NotifySessionOfServiceStart := CallbackCreate(GetMethod(implObj, "NotifySessionOfServiceStart"), flags, 2)
        this.vtbl.NotifySessionOfServiceStop := CallbackCreate(GetMethod(implObj, "NotifySessionOfServiceStop"), flags, 2)
        this.vtbl.NotifySessionStateChange := CallbackCreate(GetMethod(implObj, "NotifySessionStateChange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateListener)
        CallbackFree(this.vtbl.NotifyServiceStateChange)
        CallbackFree(this.vtbl.NotifySessionOfServiceStart)
        CallbackFree(this.vtbl.NotifySessionOfServiceStop)
        CallbackFree(this.vtbl.NotifySessionStateChange)
    }
}
