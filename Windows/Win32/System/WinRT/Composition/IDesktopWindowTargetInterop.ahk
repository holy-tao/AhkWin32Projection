#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 */
export default struct IDesktopWindowTargetInterop extends IUnknown {
    /**
     * The interface identifier for IDesktopWindowTargetInterop
     * @type {Guid}
     */
    static IID := Guid("{35dbf59e-e3f9-45b0-81e7-fe75f4145dc9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDesktopWindowTargetInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Hwnd : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDesktopWindowTargetInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {HWND} 
     */
    Hwnd {
        get => this.get_Hwnd()
    }

    /**
     * 
     * @returns {HWND} 
     */
    get_Hwnd() {
        value := HWND()
        result := ComCall(3, this, HWND.Ptr, value, "HRESULT")
        return value
    }

    Query(iid) {
        if (IDesktopWindowTargetInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Hwnd := CallbackCreate(GetMethod(implObj, "get_Hwnd"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Hwnd)
    }
}
