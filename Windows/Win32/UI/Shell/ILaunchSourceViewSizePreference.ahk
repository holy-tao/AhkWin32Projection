#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\APPLICATION_VIEW_SIZE_PREFERENCE.ahk" { APPLICATION_VIEW_SIZE_PREFERENCE }

/**
 * Provides methods for retrieving information about the source application.
 * @remarks
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * --&gt;
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ilaunchsourceviewsizepreference
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ILaunchSourceViewSizePreference extends IUnknown {
    /**
     * The interface identifier for ILaunchSourceViewSizePreference
     * @type {Guid}
     */
    static IID := Guid("{e5aa01f7-1fb8-4830-8720-4e6734cbd5f3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILaunchSourceViewSizePreference interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSourceViewToPosition     : IntPtr
        GetSourceViewSizePreference : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILaunchSourceViewSizePreference.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the position of the source application window.
     * @returns {HWND} Type: <b>HWND*</b>
     * 
     * Contains the address of a pointer to a window handle.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ilaunchsourceviewsizepreference-getsourceviewtoposition
     */
    GetSourceViewToPosition() {
        _hwnd := HWND()
        result := ComCall(3, this, HWND.Ptr, _hwnd, "HRESULT")
        return _hwnd
    }

    /**
     * Retrieves the view size preference of the application after the application has launched.
     * @returns {APPLICATION_VIEW_SIZE_PREFERENCE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-application_view_size_preference">APPLICATION_VIEW_SIZE_PREFERENCE</a>*</b>
     * 
     * Contains the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-application_view_size_preference">APPLICATION_VIEW_SIZE_PREFERENCE</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ilaunchsourceviewsizepreference-getsourceviewsizepreference
     */
    GetSourceViewSizePreference() {
        result := ComCall(4, this, "int*", &sourceSizeAfterLaunch := 0, "HRESULT")
        return sourceSizeAfterLaunch
    }

    Query(iid) {
        if (ILaunchSourceViewSizePreference.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSourceViewToPosition := CallbackCreate(GetMethod(implObj, "GetSourceViewToPosition"), flags, 2)
        this.vtbl.GetSourceViewSizePreference := CallbackCreate(GetMethod(implObj, "GetSourceViewSizePreference"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSourceViewToPosition)
        CallbackFree(this.vtbl.GetSourceViewSizePreference)
    }
}
