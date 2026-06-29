#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WRDS_CONNECTION_SETTINGS.ahk" { WRDS_CONNECTION_SETTINGS }
#Import ".\IWRdsProtocolConnectionCallback.ahk" { IWRdsProtocolConnectionCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWRdsProtocolConnection.ahk" { IWRdsProtocolConnection }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that notify the Remote Desktop Services service that a client has connected.
 * @remarks
 * To avoid a possible deadlock when calling any of the methods on this interface, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
 * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocollistenercallback
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWRdsProtocolListenerCallback extends IUnknown {
    /**
     * The interface identifier for IWRdsProtocolListenerCallback
     * @type {Guid}
     */
    static IID := Guid("{3ab27e5b-4449-4dc1-b74a-91621d4fe984}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWRdsProtocolListenerCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnConnected : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWRdsProtocolListenerCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the Remote Desktop Services service that a client connection request has been received.
     * @param {IWRdsProtocolConnection} pConnection A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocolconnection">IWRdsProtocolConnection</a> interface that represents a client connection. The Remote Desktop Services service  adds a reference to this object and releases it when it closes the connection.
     * @param {Pointer<WRDS_CONNECTION_SETTINGS>} pWRdsConnectionSettings A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_connection_settings">WRDS_CONNECTION_SETTINGS</a> structure that contains the connection settings for the remote session.
     * @returns {IWRdsProtocolConnectionCallback} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocolconnectioncallback">IWRdsProtocolConnectionCallback</a> interface used by the protocol to notify the Remote Desktop Services service about the status of a client connection. The Remote Desktop Services service  adds a reference to this object and the protocol must release it when the connection is closed.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocollistenercallback-onconnected
     */
    OnConnected(pConnection, pWRdsConnectionSettings) {
        result := ComCall(3, this, "ptr", pConnection, WRDS_CONNECTION_SETTINGS.Ptr, pWRdsConnectionSettings, "ptr*", &pCallback := 0, "HRESULT")
        return IWRdsProtocolConnectionCallback(pCallback)
    }

    Query(iid) {
        if (IWRdsProtocolListenerCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnConnected := CallbackCreate(GetMethod(implObj, "OnConnected"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnConnected)
    }
}
