#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWRdsProtocolListener.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that the Remote Desktop Services service uses to communicate with the protocol provider.
 * @remarks
 * 
 * To avoid a possible deadlock when calling any of the methods on this interface, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwrdsprotocolmanager
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsProtocolManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWRdsProtocolManager
     * @type {Guid}
     */
    static IID => Guid("{dc796967-3abb-40cd-a446-105276b58950}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "CreateListener", "NotifyServiceStateChange", "NotifySessionOfServiceStart", "NotifySessionOfServiceStop", "NotifySessionStateChange", "NotifySettingsChange", "Uninitialize"]

    /**
     * Initializes the protocol manager.
     * @param {IWRdsProtocolSettings} pIWRdsSettings A pointer to an object that implements the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocolsettings">IWRdsProtocolSettings</a> interface.
     * @param {Pointer<WRDS_SETTINGS>} pWRdsSettings A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_settings">WRDS_SETTINGS</a> structure that contains the settings to use.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-initialize
     */
    Initialize(pIWRdsSettings, pWRdsSettings) {
        result := ComCall(3, this, "ptr", pIWRdsSettings, "ptr", pWRdsSettings, "HRESULT")
        return result
    }

    /**
     * Requests the creation of an IWRdsProtocolListener object that listens for incoming client connection requests.
     * @param {PWSTR} wszListenerName A pointer to a string that contains the registry GUID that specifies the listener to create.
     * @returns {IWRdsProtocolListener} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocollistener">IWRdsProtocolListener</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-createlistener
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
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifyservicestatechange
     */
    NotifyServiceStateChange(pTSServiceStateChange) {
        result := ComCall(5, this, "ptr", pTSServiceStateChange, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol provider that the Remote Desktop Services service has started for a given session.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WRDS_SESSION_ID</a> structure that uniquely identifies the session.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifysessionofservicestart
     */
    NotifySessionOfServiceStart(SessionId) {
        result := ComCall(6, this, "ptr", SessionId, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol provider that the Remote Desktop Services service has stopped for a given session.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WRDS_SESSION_ID</a> structure that uniquely identifies the session.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifysessionofservicestop
     */
    NotifySessionOfServiceStop(SessionId) {
        result := ComCall(7, this, "ptr", SessionId, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol provider of changes in the state of a session.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WRDS_SESSION_ID</a> structure that uniquely identifies the session.
     * @param {Integer} EventId An integer that contains the event ID. The following IDs can be found in Winuser.h.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifysessionstatechange
     */
    NotifySessionStateChange(SessionId, EventId) {
        result := ComCall(8, this, "ptr", SessionId, "uint", EventId, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol provider of changes in the settings within the Remote Desktop Services service.
     * @param {Pointer<WRDS_SETTINGS>} pWRdsSettings A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_settings">WRDS_SETTINGS</a> structure that contains the setting changes.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifysettingschange
     */
    NotifySettingsChange(pWRdsSettings) {
        result := ComCall(9, this, "ptr", pWRdsSettings, "HRESULT")
        return result
    }

    /**
     * Uninitializes the protocol manager.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-uninitialize
     */
    Uninitialize() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
