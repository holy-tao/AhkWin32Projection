#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWRdsProtocolConnectionCallback.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that notify the Remote Desktop Services service that a client has connected.
 * @remarks
 * 
 * To avoid a possible deadlock when calling any of the methods on this interface, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwrdsprotocollistenercallback
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsProtocolListenerCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWRdsProtocolListenerCallback
     * @type {Guid}
     */
    static IID => Guid("{3ab27e5b-4449-4dc1-b74a-91621d4fe984}")

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
     * Notifies the Remote Desktop Services service that a client connection request has been received.
     * @param {IWRdsProtocolConnection} pConnection A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocolconnection">IWRdsProtocolConnection</a> interface that represents a client connection. The Remote Desktop Services service  adds a reference to this object and releases it when it closes the connection.
     * @param {Pointer<WRDS_CONNECTION_SETTINGS>} pWRdsConnectionSettings A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_connection_settings">WRDS_CONNECTION_SETTINGS</a> structure that contains the connection settings for the remote session.
     * @returns {IWRdsProtocolConnectionCallback} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocolconnectioncallback">IWRdsProtocolConnectionCallback</a> interface used by the protocol to notify the Remote Desktop Services service about the status of a client connection. The Remote Desktop Services service  adds a reference to this object and the protocol must release it when the connection is closed.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocollistenercallback-onconnected
     */
    OnConnected(pConnection, pWRdsConnectionSettings) {
        result := ComCall(3, this, "ptr", pConnection, "ptr", pWRdsConnectionSettings, "ptr*", &pCallback := 0, "HRESULT")
        return IWRdsProtocolConnectionCallback(pCallback)
    }
}
