#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUPnPAsyncResult interface is used to notify the UPnP control point of a completed asynchronous I/O operation.
 * @see https://learn.microsoft.com/windows/win32/api/upnp/nn-upnp-iupnpasyncresult
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPAsyncResult extends IUnknown {
    /**
     * The interface identifier for IUPnPAsyncResult
     * @type {Guid}
     */
    static IID := Guid("{4d65fd08-d13e-4274-9c8b-dd8d028c8644}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPAsyncResult interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AsyncOperationComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPAsyncResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * AsyncOperationComplete callback method provides notification of the completion of an asynchronous I/O operation.
     * @param {Integer} ullRequestID The handle identifier corresponding to the completed asynchronous I/O operation.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpasyncresult-asyncoperationcomplete
     */
    AsyncOperationComplete(ullRequestID) {
        result := ComCall(3, this, "uint", ullRequestID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUPnPAsyncResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AsyncOperationComplete := CallbackCreate(GetMethod(implObj, "AsyncOperationComplete"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AsyncOperationComplete)
    }
}
