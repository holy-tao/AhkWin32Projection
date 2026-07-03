#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct IContainerActivationHelper extends IUnknown {
    /**
     * The interface identifier for IContainerActivationHelper
     * @type {Guid}
     */
    static IID := Guid("{b524f93f-80d5-4ec7-ae9e-d66e93ade1fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContainerActivationHelper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CanActivateClientVM : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContainerActivationHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    CanActivateClientVM() {
        result := ComCall(3, this, VARIANT_BOOL.Ptr, &isAllowed := 0, "HRESULT")
        return isAllowed
    }

    Query(iid) {
        if (IContainerActivationHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CanActivateClientVM := CallbackCreate(GetMethod(implObj, "CanActivateClientVM"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CanActivateClientVM)
    }
}
