#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\WinRT\IInspectable.ahk" { IInspectable }

/**
 * @namespace Windows.Win32.UI.Input.Radial
 */
export default struct IRadialControllerIndependentInputSourceInterop extends IInspectable {
    /**
     * The interface identifier for IRadialControllerIndependentInputSourceInterop
     * @type {Guid}
     */
    static IID := Guid("{3d577eff-4cee-11e6-b535-001bdc06ab3b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRadialControllerIndependentInputSourceInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        CreateForWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRadialControllerIndependentInputSourceInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HWND} _hwnd 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateForWindow(_hwnd, riid) {
        result := ComCall(6, this, HWND, _hwnd, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IRadialControllerIndependentInputSourceInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateForWindow := CallbackCreate(GetMethod(implObj, "CreateForWindow"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateForWindow)
    }
}
