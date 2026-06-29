#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWRdsProtocolSettings.ahk" { IWRdsProtocolSettings }
#Import ".\IWRdsProtocolListener.ahk" { IWRdsProtocolListener }
#Import ".\WTS_SESSION_ID.ahk" { WTS_SESSION_ID }
#Import ".\WRDS_SETTINGS.ahk" { WRDS_SETTINGS }
#Import ".\WTS_SERVICE_STATE.ahk" { WTS_SERVICE_STATE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that the Remote Desktop Services service uses to communicate with the protocol provider.
 * @remarks
 * To avoid a possible deadlock when calling any of the methods on this interface, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
 * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocolmanager
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWRdsProtocolManager extends IUnknown {
    /**
     * The interface identifier for IWRdsProtocolManager
     * @type {Guid}
     */
    static IID := Guid("{dc796967-3abb-40cd-a446-105276b58950}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWRdsProtocolManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                  : IntPtr
        CreateListener              : IntPtr
        NotifyServiceStateChange    : IntPtr
        NotifySessionOfServiceStart : IntPtr
        NotifySessionOfServiceStop  : IntPtr
        NotifySessionStateChange    : IntPtr
        NotifySettingsChange        : IntPtr
        Uninitialize                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWRdsProtocolManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the protocol manager.
     * @remarks
     * A possible use for this method is to add a reference to the interface object pointer and to make a copy of the settings structure.
     * @param {IWRdsProtocolSettings} pIWRdsSettings A pointer to an object that implements the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocolsettings">IWRdsProtocolSettings</a> interface.
     * @param {Pointer<WRDS_SETTINGS>} pWRdsSettings A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_settings">WRDS_SETTINGS</a> structure that contains the settings to use.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-initialize
     */
    Initialize(pIWRdsSettings, pWRdsSettings) {
        result := ComCall(3, this, "ptr", pIWRdsSettings, WRDS_SETTINGS.Ptr, pWRdsSettings, "HRESULT")
        return result
    }

    /**
     * Requests the creation of an IWRdsProtocolListener object that listens for incoming client connection requests.
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
     * @returns {IWRdsProtocolListener} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocollistener">IWRdsProtocolListener</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-createlistener
     */
    CreateListener(wszListenerName) {
        wszListenerName := wszListenerName is String ? StrPtr(wszListenerName) : wszListenerName

        result := ComCall(4, this, "ptr", wszListenerName, "ptr*", &pProtocolListener := 0, "HRESULT")
        return IWRdsProtocolListener(pProtocolListener)
    }

    /**
     * Notifies the protocol provider that the state of the Remote Desktop Services service is changing.
     * @param {Pointer<WTS_SERVICE_STATE>} pTSServiceStateChange A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_service_state">WRDS_SERVICE_STATE</a> structure that specifies 
     * whether the service is starting, stopping, or changing its drain state.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifyservicestatechange
     */
    NotifyServiceStateChange(pTSServiceStateChange) {
        result := ComCall(5, this, WTS_SERVICE_STATE.Ptr, pTSServiceStateChange, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol provider that the Remote Desktop Services service has started for a given session.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WRDS_SESSION_ID</a> structure that uniquely identifies the session.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifysessionofservicestart
     */
    NotifySessionOfServiceStart(SessionId) {
        result := ComCall(6, this, WTS_SESSION_ID.Ptr, SessionId, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol provider that the Remote Desktop Services service has stopped for a given session.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WRDS_SESSION_ID</a> structure that uniquely identifies the session.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifysessionofservicestop
     */
    NotifySessionOfServiceStop(SessionId) {
        result := ComCall(7, this, WTS_SESSION_ID.Ptr, SessionId, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol provider of changes in the state of a session.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WRDS_SESSION_ID</a> structure that uniquely identifies the session.
     * @param {Integer} EventId An integer that contains the event ID. The following IDs can be found in Winuser.h.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifysessionstatechange
     */
    NotifySessionStateChange(SessionId, EventId) {
        result := ComCall(8, this, WTS_SESSION_ID.Ptr, SessionId, "uint", EventId, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol provider of changes in the settings within the Remote Desktop Services service.
     * @param {Pointer<WRDS_SETTINGS>} pWRdsSettings A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_settings">WRDS_SETTINGS</a> structure that contains the setting changes.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifysettingschange
     */
    NotifySettingsChange(pWRdsSettings) {
        result := ComCall(9, this, WRDS_SETTINGS.Ptr, pWRdsSettings, "HRESULT")
        return result
    }

    /**
     * Uninitializes the protocol manager.
     * @remarks
     * You can implement this method to clean up resources used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-initialize">Initialize</a> method. For example, if the <b>Initialize</b> method added a reference to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocolsettings">IWRdsProtocolSettings</a> object pointer, the <b>Uninitialize</b> method can release that reference.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-uninitialize
     */
    Uninitialize() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWRdsProtocolManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.CreateListener := CallbackCreate(GetMethod(implObj, "CreateListener"), flags, 3)
        this.vtbl.NotifyServiceStateChange := CallbackCreate(GetMethod(implObj, "NotifyServiceStateChange"), flags, 2)
        this.vtbl.NotifySessionOfServiceStart := CallbackCreate(GetMethod(implObj, "NotifySessionOfServiceStart"), flags, 2)
        this.vtbl.NotifySessionOfServiceStop := CallbackCreate(GetMethod(implObj, "NotifySessionOfServiceStop"), flags, 2)
        this.vtbl.NotifySessionStateChange := CallbackCreate(GetMethod(implObj, "NotifySessionStateChange"), flags, 3)
        this.vtbl.NotifySettingsChange := CallbackCreate(GetMethod(implObj, "NotifySettingsChange"), flags, 2)
        this.vtbl.Uninitialize := CallbackCreate(GetMethod(implObj, "Uninitialize"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.CreateListener)
        CallbackFree(this.vtbl.NotifyServiceStateChange)
        CallbackFree(this.vtbl.NotifySessionOfServiceStart)
        CallbackFree(this.vtbl.NotifySessionOfServiceStop)
        CallbackFree(this.vtbl.NotifySessionStateChange)
        CallbackFree(this.vtbl.NotifySettingsChange)
        CallbackFree(this.vtbl.Uninitialize)
    }
}
