#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Receives notifications about channel state changes or data received.
 * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nn-tsvirtualchannels-iwtsvirtualchannelcallback
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSVirtualChannelCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSVirtualChannelCallback
     * @type {Guid}
     */
    static IID => Guid("{a1230204-d6a7-11d8-b9fd-000bdbd1f198}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDataReceived", "OnClose"]

    /**
     * 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsvirtualchannelcallback-ondatareceived
     */
    OnDataReceived(cbSize, pBuffer) {
        result := ComCall(3, this, "uint", cbSize, "char*", pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsvirtualchannelcallback-onclose
     */
    OnClose() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
