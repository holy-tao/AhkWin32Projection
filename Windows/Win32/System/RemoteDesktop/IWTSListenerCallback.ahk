#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWTSVirtualChannelCallback.ahk" { IWTSVirtualChannelCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWTSVirtualChannel.ahk" { IWTSVirtualChannel }

/**
 * Used to notify the Remote Desktop Connection (RDC) client plug-in about incoming requests on a particular listener.
 * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nn-tsvirtualchannels-iwtslistenercallback
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSListenerCallback extends IUnknown {
    /**
     * The interface identifier for IWTSListenerCallback
     * @type {Guid}
     */
    static IID := Guid("{a1230203-d6a7-11d8-b9fd-000bdbd1f198}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSListenerCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnNewChannelConnection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSListenerCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtslistenercallback-onnewchannelconnection
     */
    OnNewChannelConnection(pChannel, data, pbAccept, ppCallback) {
        data := data is String ? BSTR.Alloc(data).Value : data

        pbAcceptMarshal := pbAccept is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pChannel, BSTR, data, pbAcceptMarshal, pbAccept, IWTSVirtualChannelCallback.Ptr, ppCallback, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWTSListenerCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnNewChannelConnection := CallbackCreate(GetMethod(implObj, "OnNewChannelConnection"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnNewChannelConnection)
    }
}
