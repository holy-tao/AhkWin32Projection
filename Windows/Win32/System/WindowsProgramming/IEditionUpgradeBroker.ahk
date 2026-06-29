#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Ole\OLE_HANDLE.ahk" { OLE_HANDLE }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct IEditionUpgradeBroker extends IUnknown {
    /**
     * The interface identifier for IEditionUpgradeBroker
     * @type {Guid}
     */
    static IID := Guid("{ff19cbcf-9455-4937-b872-6b7929a460af}")

    /**
     * The class identifier for EditionUpgradeBroker
     * @type {Guid}
     */
    static CLSID := Guid("{c4270827-4f39-45df-9288-12ff6b85a921}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEditionUpgradeBroker interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitializeParentWindow : IntPtr
        UpdateOperatingSystem  : IntPtr
        ShowProductKeyUI       : IntPtr
        CanUpgrade             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEditionUpgradeBroker.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {OLE_HANDLE} parentHandle 
     * @returns {HRESULT} 
     */
    InitializeParentWindow(parentHandle) {
        result := ComCall(3, this, OLE_HANDLE, parentHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} parameter 
     * @returns {HRESULT} 
     */
    UpdateOperatingSystem(parameter) {
        parameter := parameter is String ? BSTR.Alloc(parameter).Value : parameter

        result := ComCall(4, this, BSTR, parameter, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowProductKeyUI() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CanUpgrade() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEditionUpgradeBroker.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeParentWindow := CallbackCreate(GetMethod(implObj, "InitializeParentWindow"), flags, 2)
        this.vtbl.UpdateOperatingSystem := CallbackCreate(GetMethod(implObj, "UpdateOperatingSystem"), flags, 2)
        this.vtbl.ShowProductKeyUI := CallbackCreate(GetMethod(implObj, "ShowProductKeyUI"), flags, 1)
        this.vtbl.CanUpgrade := CallbackCreate(GetMethod(implObj, "CanUpgrade"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeParentWindow)
        CallbackFree(this.vtbl.UpdateOperatingSystem)
        CallbackFree(this.vtbl.ShowProductKeyUI)
        CallbackFree(this.vtbl.CanUpgrade)
    }
}
