#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWTSProtocolConnectionCallback.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IWTSProtocolListenerCallback is no longer available. Instead, use IWRdsProtocolListenerCallback.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwtsprotocollistenercallback
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSProtocolListenerCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSProtocolListenerCallback
     * @type {Guid}
     */
    static IID => Guid("{23083765-1a2d-4de2-97de-4a35f260f0b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnConnected"]

    /**
     * IWTSProtocolListenerCallback::OnConnected is no longer available. Instead, use IWRdsProtocolListenerCallback::OnConnected.
     * @param {IWTSProtocolConnection} pConnection A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocolconnection">IWTSProtocolConnection</a> interface that represents a client connection. The Remote Desktop Services service  adds a reference to this object and releases it when it closes the connection.
     * @returns {IWTSProtocolConnectionCallback} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocolconnectioncallback">IWTSProtocolConnectionCallback</a> interface used by the protocol to notify the Remote Desktop Services service about the status of a client connection. The Remote Desktop Services service  adds a reference to this object and the protocol must release it when the connection is closed.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocollistenercallback-onconnected
     */
    OnConnected(pConnection) {
        result := ComCall(3, this, "ptr", pConnection, "ptr*", &pCallback := 0, "HRESULT")
        return IWTSProtocolConnectionCallback(pCallback)
    }
}
