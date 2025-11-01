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
     * 
     * @param {IWTSProtocolListenerCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollistener-startlisten
     */
    StartListen(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollistener-stoplisten
     */
    StopListen() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
