#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellItem.ahk" { IShellItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposed by a client to specify how to filter the enumeration of a Shell item by a server application.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellitemfilter
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellItemFilter extends IUnknown {
    /**
     * The interface identifier for IShellItemFilter
     * @type {Guid}
     */
    static IID := Guid("{2659b475-eeb8-48b7-8f07-b378810f48cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellItemFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IncludeItem         : IntPtr
        GetEnumFlagsForItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellItemFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a given Shell item status to inclusion in the view.
     * @remarks
     * The host calls this method for each item in the folder. Returns S_OK to have the item enumerated for inclusion in the view. Returns S_FALSE to prevent the item from being enumerated for inclusion in the view.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">Shell item</a> that is to be included in the view.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemfilter-includeitem
     */
    IncludeItem(psi) {
        result := ComCall(3, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Allows a client to specify which classes of objects in a Shell item should be enumerated for inclusion in the view.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">Shell item</a> for which the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf">SHCONTF</a> enum flags are to be retrieved.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf">SHCONTF</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf">SHCONTF</a> enum flags for the given <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">Shell item</a> that specifies which classes of objects to enumerate for inclusion in the view.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemfilter-getenumflagsforitem
     */
    GetEnumFlagsForItem(psi) {
        result := ComCall(4, this, "ptr", psi, "uint*", &pgrfFlags := 0, "HRESULT")
        return pgrfFlags
    }

    Query(iid) {
        if (IShellItemFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IncludeItem := CallbackCreate(GetMethod(implObj, "IncludeItem"), flags, 2)
        this.vtbl.GetEnumFlagsForItem := CallbackCreate(GetMethod(implObj, "GetEnumFlagsForItem"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IncludeItem)
        CallbackFree(this.vtbl.GetEnumFlagsForItem)
    }
}
