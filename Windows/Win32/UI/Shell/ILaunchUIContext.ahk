#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ILaunchUIContext extends IUnknown {
    /**
     * The interface identifier for ILaunchUIContext
     * @type {Guid}
     */
    static IID := Guid("{1791e8f6-21c7-4340-882a-a6a93e3fd73b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILaunchUIContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAssociatedWindow      : IntPtr
        SetTabGroupingPreference : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILaunchUIContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HWND} value 
     * @returns {HRESULT} 
     */
    SetAssociatedWindow(value) {
        result := ComCall(3, this, HWND, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetTabGroupingPreference(value) {
        result := ComCall(4, this, "uint", value, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILaunchUIContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAssociatedWindow := CallbackCreate(GetMethod(implObj, "SetAssociatedWindow"), flags, 2)
        this.vtbl.SetTabGroupingPreference := CallbackCreate(GetMethod(implObj, "SetTabGroupingPreference"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAssociatedWindow)
        CallbackFree(this.vtbl.SetTabGroupingPreference)
    }
}
