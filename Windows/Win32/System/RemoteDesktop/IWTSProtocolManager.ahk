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
     * 
     * @param {PWSTR} wszListenerName 
     * @returns {IWTSProtocolListener} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-createlistener
     */
    CreateListener(wszListenerName) {
        wszListenerName := wszListenerName is String ? StrPtr(wszListenerName) : wszListenerName

        result := ComCall(3, this, "ptr", wszListenerName, "ptr*", &pProtocolListener := 0, "HRESULT")
        return IWTSProtocolListener(pProtocolListener)
    }

    /**
     * 
     * @param {Pointer<WTS_SERVICE_STATE>} pTSServiceStateChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-notifyservicestatechange
     */
    NotifyServiceStateChange(pTSServiceStateChange) {
        result := ComCall(4, this, "ptr", pTSServiceStateChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-notifysessionofservicestart
     */
    NotifySessionOfServiceStart(SessionId) {
        result := ComCall(5, this, "ptr", SessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-notifysessionofservicestop
     */
    NotifySessionOfServiceStop(SessionId) {
        result := ComCall(6, this, "ptr", SessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @param {Integer} EventId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-notifysessionstatechange
     */
    NotifySessionStateChange(SessionId, EventId) {
        result := ComCall(7, this, "ptr", SessionId, "uint", EventId, "HRESULT")
        return result
    }
}
