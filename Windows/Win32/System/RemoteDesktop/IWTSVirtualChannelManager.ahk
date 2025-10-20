#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Manages all Remote Desktop Connection (RDC) client plug-ins and dynamic virtual channel (DVC) listeners.
 * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nn-tsvirtualchannels-iwtsvirtualchannelmanager
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSVirtualChannelManager extends IUnknown{
    /**
     * The interface identifier for IWTSVirtualChannelManager
     * @type {Guid}
     */
    static IID => Guid("{a1230205-d6a7-11d8-b9fd-000bdbd1f198}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PSTR} pszChannelName 
     * @param {Integer} uFlags 
     * @param {Pointer<IWTSListenerCallback>} pListenerCallback 
     * @param {Pointer<IWTSListener>} ppListener 
     * @returns {HRESULT} 
     */
    CreateListener(pszChannelName, uFlags, pListenerCallback, ppListener) {
        result := ComCall(3, this, "ptr", pszChannelName, "uint", uFlags, "ptr", pListenerCallback, "ptr", ppListener, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
