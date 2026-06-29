#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\WinRT\IInspectable.ahk" { IInspectable }

/**
 * Enables interoperability with a WinRT�RadialControllerConfiguration object and provides access to RadialControllerConfiguration members for customizing a RadialController menu.
 * @see https://learn.microsoft.com/windows/win32/api/radialcontrollerinterop/nn-radialcontrollerinterop-iradialcontrollerconfigurationinterop
 * @namespace Windows.Win32.UI.Input.Radial
 */
export default struct IRadialControllerConfigurationInterop extends IInspectable {
    /**
     * The interface identifier for IRadialControllerConfigurationInterop
     * @type {Guid}
     */
    static IID := Guid("{787cdaac-3186-476d-87e4-b9374a7b9970}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRadialControllerConfigurationInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        GetForWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRadialControllerConfigurationInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a RadialControllerConfiguration object bound to the active application.
     * @param {HWND} _hwnd Handle to the window of the active application.
     * @param {Pointer<Guid>} riid The GUID of the <a href="https://docs.microsoft.com/uwp/api/windows.ui.input.radialcontrollerconfiguration">RadialControllerConfiguration</a> object.
     * @returns {Pointer<Void>} Address of a pointer to a <a href="https://docs.microsoft.com/uwp/api/windows.ui.input.radialcontrollerconfiguration">RadialControllerConfiguration</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/radialcontrollerinterop/nf-radialcontrollerinterop-iradialcontrollerconfigurationinterop-getforwindow
     */
    GetForWindow(_hwnd, riid) {
        result := ComCall(6, this, HWND, _hwnd, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IRadialControllerConfigurationInterop.IID.Equals(iid)) {
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
