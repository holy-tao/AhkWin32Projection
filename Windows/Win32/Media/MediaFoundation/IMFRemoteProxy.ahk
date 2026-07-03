#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposed by objects that act as a proxy for a remote object.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfremoteproxy
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFRemoteProxy extends IUnknown {
    /**
     * The interface identifier for IMFRemoteProxy
     * @type {Guid}
     */
    static IID := Guid("{994e23ad-1cc2-493c-b9fa-46f1cb040fa4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFRemoteProxy interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRemoteObject : IntPtr
        GetRemoteHost   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFRemoteProxy.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a pointer to the remote object for which this object is a proxy.
     * @param {Pointer<Guid>} riid Interface identifier (IID) of the requested interface.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfremoteproxy-getremoteobject
     */
    GetRemoteObject(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Retrieves a pointer to the object that is hosting this proxy.
     * @param {Pointer<Guid>} riid Interface identifier (IID) of the requested interface.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfremoteproxy-getremotehost
     */
    GetRemoteHost(riid) {
        result := ComCall(4, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IMFRemoteProxy.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRemoteObject := CallbackCreate(GetMethod(implObj, "GetRemoteObject"), flags, 3)
        this.vtbl.GetRemoteHost := CallbackCreate(GetMethod(implObj, "GetRemoteHost"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRemoteObject)
        CallbackFree(this.vtbl.GetRemoteHost)
    }
}
