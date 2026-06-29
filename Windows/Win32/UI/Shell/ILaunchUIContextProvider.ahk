#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ILaunchUIContext.ahk" { ILaunchUIContext }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ILaunchUIContextProvider extends IUnknown {
    /**
     * The interface identifier for ILaunchUIContextProvider
     * @type {Guid}
     */
    static IID := Guid("{0d12c4c8-a3d9-4e24-94c1-0e20c5a956c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILaunchUIContextProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        UpdateContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILaunchUIContextProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ILaunchUIContext} _context 
     * @returns {HRESULT} 
     */
    UpdateContext(_context) {
        result := ComCall(3, this, "ptr", _context, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILaunchUIContextProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UpdateContext := CallbackCreate(GetMethod(implObj, "UpdateContext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UpdateContext)
    }
}
