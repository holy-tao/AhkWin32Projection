#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to notify the Remote Desktop Connection (RDC) client plug-in about incoming requests on a particular listener.
 * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nn-tsvirtualchannels-iwtslistenercallback
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSListenerCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSListenerCallback
     * @type {Guid}
     */
    static IID => Guid("{a1230203-d6a7-11d8-b9fd-000bdbd1f198}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnNewChannelConnection"]

    /**
     * 
     * @param {IWTSVirtualChannel} pChannel 
     * @param {BSTR} data 
     * @param {Pointer<BOOL>} pbAccept 
     * @param {Pointer<IWTSVirtualChannelCallback>} ppCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtslistenercallback-onnewchannelconnection
     */
    OnNewChannelConnection(pChannel, data, pbAccept, ppCallback) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(3, this, "ptr", pChannel, "ptr", data, "ptr", pbAccept, "ptr*", ppCallback, "HRESULT")
        return result
    }
}
