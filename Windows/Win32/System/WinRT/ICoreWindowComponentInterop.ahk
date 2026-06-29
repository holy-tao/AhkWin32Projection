#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT
 */
export default struct ICoreWindowComponentInterop extends IUnknown {
    /**
     * The interface identifier for ICoreWindowComponentInterop
     * @type {Guid}
     */
    static IID := Guid("{0576ab31-a310-4c40-ba31-fd37e0298dfa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICoreWindowComponentInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ConfigureComponentInput : IntPtr
        GetViewInstanceId       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICoreWindowComponentInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} hostViewInstanceId 
     * @param {HWND} hwndHost 
     * @param {IUnknown} inputSourceVisual 
     * @returns {HRESULT} 
     */
    ConfigureComponentInput(hostViewInstanceId, hwndHost, inputSourceVisual) {
        result := ComCall(3, this, "uint", hostViewInstanceId, HWND, hwndHost, "ptr", inputSourceVisual, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetViewInstanceId() {
        result := ComCall(4, this, "uint*", &componentViewInstanceId := 0, "HRESULT")
        return componentViewInstanceId
    }

    Query(iid) {
        if (ICoreWindowComponentInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConfigureComponentInput := CallbackCreate(GetMethod(implObj, "ConfigureComponentInput"), flags, 4)
        this.vtbl.GetViewInstanceId := CallbackCreate(GetMethod(implObj, "GetViewInstanceId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConfigureComponentInput)
        CallbackFree(this.vtbl.GetViewInstanceId)
    }
}
