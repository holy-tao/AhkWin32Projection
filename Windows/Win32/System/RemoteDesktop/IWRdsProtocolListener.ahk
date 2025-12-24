#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WRDS_LISTENER_SETTINGS.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSettings", "StartListen", "StopListen"]

    /**
     * Gets the listener setting information for client connection requests.
     * @param {Integer} WRdsListenerSettingLevel The listener setting level to use.
     * @returns {WRDS_LISTENER_SETTINGS} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_listener_settings">WRDS_LISTENER_SETTINGS</a> structure that contains the returned listener settings.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocollistener-getsettings
     */
    GetSettings(WRdsListenerSettingLevel) {
        pWRdsListenerSettings := WRDS_LISTENER_SETTINGS()
        result := ComCall(3, this, "int", WRdsListenerSettingLevel, "ptr", pWRdsListenerSettings, "HRESULT")
        return pWRdsListenerSettings
    }

    /**
     * Notifies the protocol to start listening for client connection requests.
     * @param {IWRdsProtocolListenerCallback} pCallback A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocollistenercallback">IWRdsProtocolListenerCallback</a> object 
     * implemented by the Remote Desktop Servicesservice. The protocol uses the 
     * <b>IWRdsProtocolListenerCallback</b> object to notify 
     * the 
     * 
     * Remote Desktop Services 
     * service about incoming connection requests. The protocol must add a reference to this object and release it when 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocollistener-stoplisten">StopListen</a> is called.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, 
     * return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, 
     * see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocollistener-startlisten
     */
    StartListen(pCallback) {
        result := ComCall(4, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol to stop listening for client connection requests.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocollistener-stoplisten
     */
    StopListen() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
