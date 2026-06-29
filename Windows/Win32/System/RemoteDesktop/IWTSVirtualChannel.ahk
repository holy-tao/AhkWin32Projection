#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to control the channel state, and writes on the channel.
 * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nn-tsvirtualchannels-iwtsvirtualchannel
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSVirtualChannel extends IUnknown {
    /**
     * The interface identifier for IWTSVirtualChannel
     * @type {Guid}
     */
    static IID := Guid("{a1230207-d6a7-11d8-b9fd-000bdbd1f198}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSVirtualChannel interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Write : IntPtr
        Close : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSVirtualChannel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Starts a write request on the channel.
     * @param {Integer} cbSize The size, in bytes, of the buffer to which to write.
     * @param {Pointer<Integer>} pBuffer A pointer to a buffer on the channel to which to write the data. You can reuse this buffer as soon as the call returns.
     * @param {IUnknown} pReserved Reserved for future use. The value must be <b>NULL</b>.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsvirtualchannel-write
     */
    Write(cbSize, pBuffer, pReserved) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbSize, pBufferMarshal, pBuffer, "ptr", pReserved, "HRESULT")
        return result
    }

    /**
     * Closes the channel. (IWTSVirtualChannel.Close)
     * @returns {HRESULT} Returns <b>S_OK</b> if successful.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsvirtualchannel-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWTSVirtualChannel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Write := CallbackCreate(GetMethod(implObj, "Write"), flags, 4)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Write)
        CallbackFree(this.vtbl.Close)
    }
}
