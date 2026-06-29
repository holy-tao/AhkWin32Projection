#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }

/**
 * Enables interoperability with a WinRT [UIViewSettings](/uwp/api/Windows.UI.ViewManagement.UIViewSettings) object.
 * @see https://learn.microsoft.com/windows/win32/api/uiviewsettingsinterop/nn-uiviewsettingsinterop-iuiviewsettingsinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IUIViewSettingsInterop extends IInspectable {
    /**
     * The interface identifier for IUIViewSettingsInterop
     * @type {Guid}
     */
    static IID := Guid("{3694dbf9-8f68-44be-8ff5-195c98ede8a6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIViewSettingsInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        GetForWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIViewSettingsInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an [UIViewSettings](/uwp/api/Windows.UI.ViewManagement.UIViewSettings) object for the window of the active application.
     * @param {HWND} _hwnd Handle to the window of the active application.
     * @param {Pointer<Guid>} riid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example: 
     * 
     * `__uuidof(UIViewSettings)`
     * @returns {Pointer<Void>} Address of a pointer to a [UIViewSettings](/uwp/api/Windows.UI.ViewManagement.UIViewSettings) object.
     * @see https://learn.microsoft.com/windows/win32/api/uiviewsettingsinterop/nf-uiviewsettingsinterop-iuiviewsettingsinterop-getforwindow
     */
    GetForWindow(_hwnd, riid) {
        result := ComCall(6, this, HWND, _hwnd, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IUIViewSettingsInterop.IID.Equals(iid)) {
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
