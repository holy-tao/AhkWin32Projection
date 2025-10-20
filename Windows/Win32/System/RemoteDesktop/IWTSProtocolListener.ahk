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
     * 
     * @param {Pointer<IWTSProtocolListenerCallback>} pCallback 
     * @returns {HRESULT} 
     */
    StartListen(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopListen() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
