#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 */
export default struct ICompositorDesktopInterop extends IUnknown {
    /**
     * The interface identifier for ICompositorDesktopInterop
     * @type {Guid}
     */
    static IID := Guid("{29e691fa-4567-4dca-b319-d0f207eb6807}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICompositorDesktopInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateDesktopWindowTarget : IntPtr
        EnsureOnThread            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICompositorDesktopInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HWND} hwndTarget 
     * @param {BOOL} isTopmost 
     * @returns {Pointer} 
     */
    CreateDesktopWindowTarget(hwndTarget, isTopmost) {
        result := ComCall(3, this, HWND, hwndTarget, BOOL, isTopmost, "ptr*", &result := 0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} threadId 
     * @returns {HRESULT} 
     */
    EnsureOnThread(threadId) {
        result := ComCall(4, this, "uint", threadId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICompositorDesktopInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDesktopWindowTarget := CallbackCreate(GetMethod(implObj, "CreateDesktopWindowTarget"), flags, 4)
        this.vtbl.EnsureOnThread := CallbackCreate(GetMethod(implObj, "EnsureOnThread"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDesktopWindowTarget)
        CallbackFree(this.vtbl.EnsureOnThread)
    }
}
