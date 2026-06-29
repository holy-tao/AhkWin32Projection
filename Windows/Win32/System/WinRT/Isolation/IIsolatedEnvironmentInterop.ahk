#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Isolation
 */
export default struct IIsolatedEnvironmentInterop extends IUnknown {
    /**
     * The interface identifier for IIsolatedEnvironmentInterop
     * @type {Guid}
     */
    static IID := Guid("{85713c2e-8e62-46c5-8de2-c647e1d54636}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsolatedEnvironmentInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetHostHwndInterop : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsolatedEnvironmentInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HWND} containerHwnd 
     * @returns {HWND} 
     */
    GetHostHwndInterop(containerHwnd) {
        hostHwnd := HWND()
        result := ComCall(3, this, HWND, containerHwnd, HWND.Ptr, hostHwnd, "HRESULT")
        return hostHwnd
    }

    Query(iid) {
        if (IIsolatedEnvironmentInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHostHwndInterop := CallbackCreate(GetMethod(implObj, "GetHostHwndInterop"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHostHwndInterop)
    }
}
