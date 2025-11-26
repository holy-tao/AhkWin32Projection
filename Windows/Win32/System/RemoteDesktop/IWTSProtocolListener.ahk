#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IWTSProtocolListener is no longer available. Instead, use IWRdsProtocolListener.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwtsprotocollistener
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSProtocolListener extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSProtocolListener
     * @type {Guid}
     */
    static IID => Guid("{23083765-45f0-4394-8f69-32b2bc0ef4ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartListen", "StopListen"]

    /**
     * IWTSProtocolListener::StartListen is no longer available. Instead, use IWRdsProtocolListener::StartListen.
     * @param {IWTSProtocolListenerCallback} pCallback A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocollistenercallback">IWTSProtocolListenerCallback</a> object 
     * implemented by the Remote Desktop Servicesservice. The protocol uses the 
     * <b>IWTSProtocolListenerCallback</b> object to notify 
     * the 
     * 
     * Remote Desktop Services 
     * service about incoming connection requests. The protocol must add a reference to this object and release it when 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollistener-stoplisten">StopListen</a> is called.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, 
     * return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, 
     * see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocollistener-startlisten
     */
    StartListen(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolListener::StopListen is no longer available. Instead, use IWRdsProtocolListener::StopListen.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocollistener-stoplisten
     */
    StopListen() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
