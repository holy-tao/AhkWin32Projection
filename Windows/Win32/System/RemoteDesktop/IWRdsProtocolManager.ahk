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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IWRdsProtocolSettings} pIWRdsSettings 
     * @param {Pointer<WRDS_SETTINGS>} pWRdsSettings 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pIWRdsSettings, pWRdsSettings) {
        result := ComCall(3, this, "ptr", pIWRdsSettings, "ptr", pWRdsSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszListenerName 
     * @returns {IWRdsProtocolListener} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-createlistener
     */
    CreateListener(wszListenerName) {
        wszListenerName := wszListenerName is String ? StrPtr(wszListenerName) : wszListenerName

        result := ComCall(4, this, "ptr", wszListenerName, "ptr*", &pProtocolListener := 0, "HRESULT")
        return IWRdsProtocolListener(pProtocolListener)
    }

    /**
     * 
     * @param {Pointer<WTS_SERVICE_STATE>} pTSServiceStateChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifyservicestatechange
     */
    NotifyServiceStateChange(pTSServiceStateChange) {
        result := ComCall(5, this, "ptr", pTSServiceStateChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifysessionofservicestart
     */
    NotifySessionOfServiceStart(SessionId) {
        result := ComCall(6, this, "ptr", SessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifysessionofservicestop
     */
    NotifySessionOfServiceStop(SessionId) {
        result := ComCall(7, this, "ptr", SessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @param {Integer} EventId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifysessionstatechange
     */
    NotifySessionStateChange(SessionId, EventId) {
        result := ComCall(8, this, "ptr", SessionId, "uint", EventId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WRDS_SETTINGS>} pWRdsSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-notifysettingschange
     */
    NotifySettingsChange(pWRdsSettings) {
        result := ComCall(9, this, "ptr", pWRdsSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-uninitialize
     */
    Uninitialize() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
