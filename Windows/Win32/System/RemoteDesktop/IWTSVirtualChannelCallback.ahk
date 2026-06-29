#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Receives notifications about channel state changes or data received.
 * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nn-tsvirtualchannels-iwtsvirtualchannelcallback
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSVirtualChannelCallback extends IUnknown {
    /**
     * The interface identifier for IWTSVirtualChannelCallback
     * @type {Guid}
     */
    static IID := Guid("{a1230204-d6a7-11d8-b9fd-000bdbd1f198}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSVirtualChannelCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnDataReceived : IntPtr
        OnClose        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSVirtualChannelCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the user about data that is being received.
     * @param {Integer} cbSize The size, in bytes, of the buffer to receive the data.
     * @param {Pointer<Integer>} pBuffer A pointer to a buffer to receive the data. This buffer is valid only until this call is complete.
     * @returns {HRESULT} Returns <b>S_OK</b> on success. Results in no action if the call fails.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsvirtualchannelcallback-ondatareceived
     */
    OnDataReceived(cbSize, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbSize, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }

    /**
     * Notifies the user that the channel has been closed.
     * @returns {HRESULT} Returns <b>S_OK</b> on success. Results in no action if the call fails.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsvirtualchannelcallback-onclose
     */
    OnClose() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWTSVirtualChannelCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnDataReceived := CallbackCreate(GetMethod(implObj, "OnDataReceived"), flags, 3)
        this.vtbl.OnClose := CallbackCreate(GetMethod(implObj, "OnClose"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnDataReceived)
        CallbackFree(this.vtbl.OnClose)
    }
}
