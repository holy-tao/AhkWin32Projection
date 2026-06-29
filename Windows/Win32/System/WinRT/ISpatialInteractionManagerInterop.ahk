#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }

/**
 * Enables interoperability with a WinRT SpatialInteractionManager object and provides access to SpatialInteractionManager members for accessing user input from hands, motion controllers, and system voice commands.
 * @see https://learn.microsoft.com/windows/win32/api/spatialinteractionmanagerinterop/nn-spatialinteractionmanagerinterop-ispatialinteractionmanagerinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct ISpatialInteractionManagerInterop extends IInspectable {
    /**
     * The interface identifier for ISpatialInteractionManagerInterop
     * @type {Guid}
     */
    static IID := Guid("{5c4ee536-6a98-4b86-a170-587013d6fd4b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpatialInteractionManagerInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        GetForWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpatialInteractionManagerInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a SpatialInteractionManager object bound to the active application.
     * @remarks
     * This example shows how to retrieve a [SpatialInteractionManager](/uwp/api/windows.ui.input.spatial.spatialinteractionmanager) by using **ISpatialInteractionManagerInterop::GetForWindow** to retrieve the **SpatialInteractionManager** for an [HWND](/windows/desktop/winprog/windows-data-types).
     * 
     * ```cppwinrt
     * // This code example depends on these headers.
     * // <SpatialInteractionManagerInterop.h>
     * // <Windows.UI.Input.Spatial.h>
     * // <winrt/Windows.UI.Input.Spatial.h>
     *  
     * // Create the window for the HolographicSpace.
     * hWnd = CreateWindowW(
     *     m_szWindowClass, 
     *     m_szTitle,
     *     WS_VISIBLE,
     *     CW_USEDEFAULT, 
     *     0, 
     *     CW_USEDEFAULT, 
     *     0, 
     *     nullptr, 
     *     nullptr, 
     *     hInstance, 
     *     nullptr);
     *  
     * if (!hWnd)
     * {
     *     winrt::check_hresult(E_FAIL);
     * }
     *  
     * {
     *     using namespace winrt::Windows::UI::Input::Spatial;
     *     winrt::com_ptr<ISpatialInteractionManagerInterop> spatialInteractionManagerInterop = 
     *         winrt::get_activation_factory<SpatialInteractionManager, ISpatialInteractionManagerInterop>();
     *  
     *     winrt::com_ptr<ABI::Windows::UI::Input::Spatial::ISpatialInteractionManager> spSpatialInteractionManager;
     *     winrt::check_hresult(spatialInteractionManagerInterop->GetForWindow(hWnd, __uuidof(ABI::Windows::UI::Input::Spatial::ISpatialInteractionManager), winrt::put_abi(spSpatialInteractionManager)));
     *  
     *     SpatialInteractionManager spatialInteractionManager = spSpatialInteractionManager.as<SpatialInteractionManager>();
     * }
     * ```
     * @param {HWND} window Type: [HWND](/windows/desktop/winprog/windows-data-types)
     * 
     * Handle to the window of the active application.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * The GUID of the [SpatialInteractionManager](/uwp/api/windows.ui.input.spatial.spatialinteractionmanager) object.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * Address of a pointer to a [SpatialInteractionManager](/uwp/api/windows.ui.input.spatial.spatialinteractionmanager) object.
     * @see https://learn.microsoft.com/windows/win32/api/spatialinteractionmanagerinterop/nf-spatialinteractionmanagerinterop-ispatialinteractionmanagerinterop-getforwindow
     */
    GetForWindow(window, riid) {
        result := ComCall(6, this, HWND, window, Guid.Ptr, riid, "ptr*", &spatialInteractionManager := 0, "HRESULT")
        return spatialInteractionManager
    }

    Query(iid) {
        if (ISpatialInteractionManagerInterop.IID.Equals(iid)) {
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
