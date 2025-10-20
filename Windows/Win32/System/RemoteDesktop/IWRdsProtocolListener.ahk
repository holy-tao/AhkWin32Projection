#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that request that the protocol start and stop listening for client connection requests.
 * @remarks
 * 
  * To avoid a possible deadlock when calling any of the methods on this interface, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwrdsprotocollistener
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsProtocolListener extends IUnknown{
    /**
     * The interface identifier for IWRdsProtocolListener
     * @type {Guid}
     */
    static IID => Guid("{fcbc131b-c686-451d-a773-e279e230f540}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} WRdsListenerSettingLevel 
     * @param {Pointer<WRDS_LISTENER_SETTINGS>} pWRdsListenerSettings 
     * @returns {HRESULT} 
     */
    GetSettings(WRdsListenerSettingLevel, pWRdsListenerSettings) {
        result := ComCall(3, this, "int", WRdsListenerSettingLevel, "ptr", pWRdsListenerSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWRdsProtocolListenerCallback>} pCallback 
     * @returns {HRESULT} 
     */
    StartListen(pCallback) {
        result := ComCall(4, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopListen() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
