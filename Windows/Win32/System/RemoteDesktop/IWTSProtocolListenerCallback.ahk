#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWTSProtocolConnectionCallback.ahk" { IWTSProtocolConnectionCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWTSProtocolConnection.ahk" { IWTSProtocolConnection }

/**
 * IWTSProtocolListenerCallback is no longer available. Instead, use IWRdsProtocolListenerCallback.
 * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nn-wtsprotocol-iwtsprotocollistenercallback
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSProtocolListenerCallback extends IUnknown {
    /**
     * The interface identifier for IWTSProtocolListenerCallback
     * @type {Guid}
     */
    static IID := Guid("{23083765-1a2d-4de2-97de-4a35f260f0b3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSProtocolListenerCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnConnected : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSProtocolListenerCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IWTSProtocolListenerCallback::OnConnected is no longer available. Instead, use IWRdsProtocolListenerCallback::OnConnected.
     * @param {IWTSProtocolConnection} pConnection A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocolconnection">IWTSProtocolConnection</a> interface that represents a client connection. The Remote Desktop Services service  adds a reference to this object and releases it when it closes the connection.
     * @returns {IWTSProtocolConnectionCallback} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocolconnectioncallback">IWTSProtocolConnectionCallback</a> interface used by the protocol to notify the Remote Desktop Services service about the status of a client connection. The Remote Desktop Services service  adds a reference to this object and the protocol must release it when the connection is closed.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollistenercallback-onconnected
     */
    OnConnected(pConnection) {
        result := ComCall(3, this, "ptr", pConnection, "ptr*", &pCallback := 0, "HRESULT")
        return IWTSProtocolConnectionCallback(pCallback)
    }

    Query(iid) {
        if (IWTSProtocolListenerCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnConnected := CallbackCreate(GetMethod(implObj, "OnConnected"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnConnected)
    }
}
