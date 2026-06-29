#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MMC_EXT_VIEW_DATA.ahk" { MMC_EXT_VIEW_DATA }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IViewExtensionCallback interface is used to add a view to the result pane.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iviewextensioncallback
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IViewExtensionCallback extends IUnknown {
    /**
     * The interface identifier for IViewExtensionCallback
     * @type {Guid}
     */
    static IID := Guid("{34dd928a-7599-41e5-9f5e-d6bc3062c2da}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IViewExtensionCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddView : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IViewExtensionCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a view to the result pane.
     * @param {Pointer<MMC_EXT_VIEW_DATA>} pExtViewData A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_ext_view_data">MMC_EXT_VIEW_DATA</a> structure, which contains information about the view being added to the result pane. The bReplacesDefaultView member of the 
     * <b>MMC_EXT_VIEW_DATA</b> structure determines if the standard view is removed when adding the new view.
     * @returns {HRESULT} If successful, the return value is S_OK. Other return values indicate an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iviewextensioncallback-addview
     */
    AddView(pExtViewData) {
        result := ComCall(3, this, MMC_EXT_VIEW_DATA.Ptr, pExtViewData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IViewExtensionCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddView := CallbackCreate(GetMethod(implObj, "AddView"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddView)
    }
}
