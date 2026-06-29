#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDataObject.ahk" { IDataObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IViewExtensionCallback.ahk" { IViewExtensionCallback }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IExtendView interface provides information about the extended view.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iextendview
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IExtendView extends IUnknown {
    /**
     * The interface identifier for IExtendView
     * @type {Guid}
     */
    static IID := Guid("{89995cee-d2ed-4c0e-ae5e-df7e76f3fa53}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExtendView interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetViews : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExtendView.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetViews method retrieves information about the extended view and adds extended views to the result pane.
     * @remarks
     * For more information and a C++ code example for <b>IExtendView::GetViews</b>, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/extending-a-primary-snap-ins-view">Extending a Primary Snap-in's View</a>.
     * @param {IDataObject} pDataObject A pointer to the snap-in data object.
     * @param {IViewExtensionCallback} pViewExtensionCallback A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iviewextensioncallback">IViewExtensionCallback</a> interface. The view extension snap-in uses the 
     * IViewExtensionCallback interface to add information about the extended view. The snap-in can also call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iviewextensioncallback-addview">IViewExtensionCallback::AddView</a> method multiple times to add multiple extended views. The value in pViewExtensionCallback is valid only during the call to <b>IExtendView::GetViews</b>; view extension snap-ins must not save this pointer for later use.
     * @returns {HRESULT} If successful, the return value is S_OK. Other return values indicate an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendview-getviews
     */
    GetViews(pDataObject, pViewExtensionCallback) {
        result := ComCall(3, this, "ptr", pDataObject, "ptr", pViewExtensionCallback, "HRESULT")
        return result
    }

    Query(iid) {
        if (IExtendView.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetViews := CallbackCreate(GetMethod(implObj, "GetViews"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetViews)
    }
}
