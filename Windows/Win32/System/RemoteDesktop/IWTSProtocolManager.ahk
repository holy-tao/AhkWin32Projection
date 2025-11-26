#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWTSProtocolListener.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IWTSProtocolManager is no longer available. Instead, use IWRdsProtocolManager.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwtsprotocolmanager
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSProtocolManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSProtocolManager
     * @type {Guid}
     */
    static IID => Guid("{f9eaf6cc-ed79-4f01-821d-1f881b9f66cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateListener", "NotifyServiceStateChange", "NotifySessionOfServiceStart", "NotifySessionOfServiceStop", "NotifySessionStateChange"]

    /**
     * IWTSProtocolManager::CreateListener is no longer available. Instead, use IWRdsProtocolManager::CreateListener.
     * @param {PWSTR} wszListenerName A pointer to a string that contains the registry GUID that specifies the listener to create.
     * @returns {IWTSProtocolListener} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocollistener">IWTSProtocolListener</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-createlistener
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
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-notifyservicestatechange
     */
    NotifyServiceStateChange(pTSServiceStateChange) {
        result := ComCall(4, this, "ptr", pTSServiceStateChange, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolManager::NotifySessionOfServiceStart is no longer available. Instead, use IWRdsProtocolManager::NotifySessionOfServiceStart.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WTS_SESSION_ID</a> structure that uniquely identifies the session.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-notifysessionofservicestart
     */
    NotifySessionOfServiceStart(SessionId) {
        result := ComCall(5, this, "ptr", SessionId, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolManager::NotifySessionOfServiceStop is no longer available. Instead, use IWRdsProtocolManager::NotifySessionOfServiceStop.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WTS_SESSION_ID</a> structure that uniquely identifies the session.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-notifysessionofservicestop
     */
    NotifySessionOfServiceStop(SessionId) {
        result := ComCall(6, this, "ptr", SessionId, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolManager::NotifySessionStateChange is no longer available. Instead, use IWRdsProtocolManager::NotifySessionStateChange.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WTS_SESSION_ID</a> structure that uniquely identifies the session.
     * @param {Integer} EventId An integer that contains the event ID. The following IDs can be found in Winuser.h.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-notifysessionstatechange
     */
    NotifySessionStateChange(SessionId, EventId) {
        result := ComCall(7, this, "ptr", SessionId, "uint", EventId, "HRESULT")
        return result
    }
}
