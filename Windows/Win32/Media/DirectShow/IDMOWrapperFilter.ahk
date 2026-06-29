#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDMOWrapperFilter interface enables an application to use a DirectX Media Object (DMO) inside a filter graph.
 * @see https://learn.microsoft.com/windows/win32/api/dmodshow/nn-dmodshow-idmowrapperfilter
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IDMOWrapperFilter extends IUnknown {
    /**
     * The interface identifier for IDMOWrapperFilter
     * @type {Guid}
     */
    static IID := Guid("{52d6f586-9f0f-4824-8fc8-e32ca04930c2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDMOWrapperFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Init : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDMOWrapperFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Init method initializes the DMO Wrapper filter with the specified DMO.
     * @remarks
     * In some cases, the DMO Wrapper filter performs optimizations based on the category.
     * @param {Pointer<Guid>} clsidDMO Class identifier (CLSID) of the DMO.
     * @param {Pointer<Guid>} catDMO CLSID that specifies the category of the DMO.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/dmodshow/nf-dmodshow-idmowrapperfilter-init
     */
    Init(clsidDMO, catDMO) {
        result := ComCall(3, this, Guid.Ptr, clsidDMO, Guid.Ptr, catDMO, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDMOWrapperFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
    }
}
