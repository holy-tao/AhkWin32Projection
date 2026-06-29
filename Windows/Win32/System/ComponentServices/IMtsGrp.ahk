#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods for enumerating through running packages.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-imtsgrp
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IMtsGrp extends IDispatch {
    /**
     * The interface identifier for IMtsGrp
     * @type {Guid}
     */
    static IID := Guid("{4b2e958c-0393-11d1-b1ab-00aa00ba3258}")

    /**
     * The class identifier for MtsGrp
     * @type {Guid}
     */
    static CLSID := Guid("{4b2e958d-0393-11d1-b1ab-00aa00ba3258}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMtsGrp interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count : IntPtr
        Item      : IntPtr
        Refresh   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMtsGrp.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * Retrieves the number of running packages in the catalog.
     * @returns {Integer} The number of running packages.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsgrp-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the IUnknown pointer for the specified package.
     * @param {Integer} lIndex The index containing running packages.
     * @returns {IUnknown} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer, which can be used to access <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imtsevents">IMtsEvents</a>.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsgrp-item
     */
    Item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "ptr*", &ppUnkDispatcher := 0, "HRESULT")
        return IUnknown(ppUnkDispatcher)
    }

    /**
     * Updates the list of IUnknown pointers that was populated upon the creation of the object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsgrp-refresh
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMtsGrp.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.Refresh)
    }
}
