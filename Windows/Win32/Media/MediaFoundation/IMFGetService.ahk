#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Queries an object for a specified service interface. (IMFGetService)
 * @remarks
 * A service is an interface that is exposed by one object but might be implemented by another object. The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">GetService</a> method is equivalent to <b>QueryInterface</b>, with the following difference: when <b>QueryInterface</b> retrieves a pointer to an interface, it is guaranteed that you can query the returned interface and get back the original interface. The <b>GetService</b> method does not make this guarantee, because the retrieved interface might be implemented by a separate object.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfgetservice">MFGetService</a> function is a helper function that queries an object for <b>IMFGetService</b> and calls the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">GetService</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfgetservice
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFGetService extends IUnknown {
    /**
     * The interface identifier for IMFGetService
     * @type {Guid}
     */
    static IID := Guid("{fa993888-4383-415a-a930-dd472a8cf6f7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFGetService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetService : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFGetService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a service interface.
     * @param {Pointer<Guid>} guidService The service identifier (SID) of the service. For a list of service identifiers, see <a href="https://docs.microsoft.com/windows/desktop/medfound/service-interfaces">Service Interfaces</a>.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested.
     * @returns {Pointer<Void>} Receives the interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfgetservice-getservice
     */
    GetService(guidService, riid) {
        result := ComCall(3, this, Guid.Ptr, guidService, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    Query(iid) {
        if (IMFGetService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetService := CallbackCreate(GetMethod(implObj, "GetService"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetService)
    }
}
