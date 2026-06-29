#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\WinRT\IInspectable.ahk" { IInspectable }

/**
 * Enables interoperability with a WinRT�RadialController object and provides access to RadialController members for customizing the interaction experience.
 * @see https://learn.microsoft.com/windows/win32/api/radialcontrollerinterop/nn-radialcontrollerinterop-iradialcontrollerinterop
 * @namespace Windows.Win32.UI.Input.Radial
 */
export default struct IRadialControllerInterop extends IInspectable {
    /**
     * The interface identifier for IRadialControllerInterop
     * @type {Guid}
     */
    static IID := Guid("{1b0535c9-57ad-45c1-9d79-ad5c34360513}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRadialControllerInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        CreateForWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRadialControllerInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Instantiates a RadialController object and binds it to the active application.
     * @param {HWND} _hwnd Handle to the window of the active application.
     * @param {Pointer<Guid>} riid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example, __uuidof(IRadialController) will get the GUID of the interface to a buffer resource.
     * @returns {Pointer<Void>} Address of a pointer to a <a href="https://docs.microsoft.com/uwp/api/windows.ui.input.radialcontroller">RadialController</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/radialcontrollerinterop/nf-radialcontrollerinterop-iradialcontrollerinterop-createforwindow
     */
    CreateForWindow(_hwnd, riid) {
        result := ComCall(6, this, HWND, _hwnd, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IRadialControllerInterop.IID.Equals(iid)) {
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
