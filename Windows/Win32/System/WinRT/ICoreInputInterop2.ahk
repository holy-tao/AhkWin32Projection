#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }

/**
 * @namespace Windows.Win32.System.WinRT
 */
export default struct ICoreInputInterop2 extends IInspectable {
    /**
     * The interface identifier for ICoreInputInterop2
     * @type {Guid}
     */
    static IID := Guid("{b8a2acd7-a0f0-40ee-8ee7-c82f59cc5cd4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICoreInputInterop2 interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        get_WindowHandle     : IntPtr
        ChangeHostingContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICoreInputInterop2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {HWND} 
     */
    WindowHandle {
        get => this.get_WindowHandle()
    }

    /**
     * 
     * @returns {HWND} 
     */
    get_WindowHandle() {
        window := HWND()
        result := ComCall(6, this, HWND.Ptr, window, "HRESULT")
        return window
    }

    /**
     * 
     * @param {HWND} newParentWindow 
     * @param {Integer} newViewInstanceId 
     * @returns {HRESULT} 
     */
    ChangeHostingContext(newParentWindow, newViewInstanceId) {
        result := ComCall(7, this, HWND, newParentWindow, "uint", newViewInstanceId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICoreInputInterop2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_WindowHandle := CallbackCreate(GetMethod(implObj, "get_WindowHandle"), flags, 2)
        this.vtbl.ChangeHostingContext := CallbackCreate(GetMethod(implObj, "ChangeHostingContext"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_WindowHandle)
        CallbackFree(this.vtbl.ChangeHostingContext)
    }
}
