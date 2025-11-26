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
     * Allows the Remote Desktop Connection (RDC) client plug-in to accept or deny a connection request for an incoming connection.
     * @param {IWTSVirtualChannel} pChannel An <a href="https://docs.microsoft.com/windows/desktop/api/tsvirtualchannels/nn-tsvirtualchannels-iwtsvirtualchannelcallback">IWTSVirtualChannel</a> object that 
     *       represents the incoming connection. This object will only be connected if the connection is accepted by this 
     *       method.
     * @param {BSTR} data This parameter is not implemented and is reserved for future use.
     * @param {Pointer<BOOL>} pbAccept Indicates whether the connection should be accepted. Receives <b>TRUE</b> if the 
     *       connection should be accepted or <b>FALSE</b> otherwise.
     * @param {Pointer<IWTSVirtualChannelCallback>} ppCallback Receives an 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/tsvirtualchannels/nn-tsvirtualchannels-iwtsvirtualchannelcallback">IWTSVirtualChannelCallback</a> object that 
     *       receives notifications for the connection. This object is created by the plug-in.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nf-tsvirtualchannels-iwtslistenercallback-onnewchannelconnection
     */
    OnNewChannelConnection(pChannel, data, pbAccept, ppCallback) {
        data := data is String ? BSTR.Alloc(data).Value : data

        pbAcceptMarshal := pbAccept is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pChannel, "ptr", data, pbAcceptMarshal, pbAccept, "ptr*", ppCallback, "HRESULT")
        return result
    }
}
