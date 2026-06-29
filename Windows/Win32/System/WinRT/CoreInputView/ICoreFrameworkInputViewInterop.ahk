#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IInspectable.ahk" { IInspectable }

/**
 * The ICoreFrameworkInputViewInterop interface is to be determined.
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.viewmanagement.core.coreframeworkinputviewinterop/nn-windows-ui-viewmanagement-core-coreframeworkinputviewinterop-icoreframeworkinputviewinterop
 * @namespace Windows.Win32.System.WinRT.CoreInputView
 */
export default struct ICoreFrameworkInputViewInterop extends IInspectable {
    /**
     * The interface identifier for ICoreFrameworkInputViewInterop
     * @type {Guid}
     */
    static IID := Guid("{0e3da342-b11c-484b-9c1c-be0d61c2f6c5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICoreFrameworkInputViewInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        GetForWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICoreFrameworkInputViewInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ICoreFrameworkInputViewInterop::GetForWindow function is to be determined.
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.viewmanagement.core.coreframeworkinputviewinterop/nf-windows-ui-viewmanagement-core-coreframeworkinputviewinterop-icoreframeworkinputviewinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        result := ComCall(6, this, HWND, appWindow, Guid.Ptr, riid, "ptr*", &coreFrameworkInputView := 0, "HRESULT")
        return coreFrameworkInputView
    }

    Query(iid) {
        if (ICoreFrameworkInputViewInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetForWindow := CallbackCreate(GetMethod(implObj, "GetForWindow"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetForWindow)
    }
}
