#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IWTSProtocolManager is no longer available. Instead, use IWRdsProtocolManager.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwtsprotocolmanager
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSProtocolManager extends IUnknown{
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
     * 
     * @param {PWSTR} wszListenerName 
     * @param {Pointer<IWTSProtocolListener>} pProtocolListener 
     * @returns {HRESULT} 
     */
    CreateListener(wszListenerName, pProtocolListener) {
        wszListenerName := wszListenerName is String ? StrPtr(wszListenerName) : wszListenerName

        result := ComCall(3, this, "ptr", wszListenerName, "ptr", pProtocolListener, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WTS_SERVICE_STATE>} pTSServiceStateChange 
     * @returns {HRESULT} 
     */
    NotifyServiceStateChange(pTSServiceStateChange) {
        result := ComCall(4, this, "ptr", pTSServiceStateChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @returns {HRESULT} 
     */
    NotifySessionOfServiceStart(SessionId) {
        result := ComCall(5, this, "ptr", SessionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @returns {HRESULT} 
     */
    NotifySessionOfServiceStop(SessionId) {
        result := ComCall(6, this, "ptr", SessionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @param {Integer} EventId 
     * @returns {HRESULT} 
     */
    NotifySessionStateChange(SessionId, EventId) {
        result := ComCall(7, this, "ptr", SessionId, "uint", EventId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
