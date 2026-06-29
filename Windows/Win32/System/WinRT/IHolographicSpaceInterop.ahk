#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }

/**
 * Enables interoperability with a WinRT HolographicSpace object and provides access to HolographicSpace members for representing a holographic scene.
 * @see https://learn.microsoft.com/windows/win32/api/holographicspaceinterop/nn-holographicspaceinterop-iholographicspaceinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IHolographicSpaceInterop extends IInspectable {
    /**
     * The interface identifier for IHolographicSpaceInterop
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
     * used for IHolographicSpaceInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        CreateForWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHolographicSpaceInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Instantiates a HolographicSpace object and binds it to the current application.
     * @remarks
     * This example shows how to use **IHolographicSpaceInterop::CreateForWindow** to create and use a [HolographicSpace](/uwp/api/windows.graphics.holographic.holographicspace) for an [HWND](/windows/desktop/winprog/windows-data-types). See the [basic hologram sample](https://github.com/Microsoft/Windows-classic-samples/tree/master/Samples/BasicHologram) for more info.
     * 
     * 
     * ```cppwinrt
     * // This code example depends on these headers.
     * // <HolographicSpaceInterop.h>
     * // <Windows.Graphics.Holographic.h>
     * // <winrt/Windows.Graphics.Holographic.h>
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
     *     // Use WinRT factory to create the holographic space.
     *     using namespace winrt::Windows::Graphics::Holographic;
     *     winrt::com_ptr<IHolographicSpaceInterop> holographicSpaceInterop = winrt::get_activation_factory<HolographicSpace, IHolographicSpaceInterop>();
     *     winrt::com_ptr<ABI::Windows::Graphics::Holographic::IHolographicSpace> spHolographicSpace;
     *     winrt::check_hresult(holographicSpaceInterop->CreateForWindow(hWnd, __uuidof(ABI::Windows::Graphics::Holographic::IHolographicSpace), winrt::put_abi(spHolographicSpace)));
     *  
     *     if (!spHolographicSpace)
     *     {
     *         winrt::check_hresult(E_FAIL);
     *     }
     *  
     *     // Store the holographic space.
     *     m_holographicSpace = spHolographicSpace.as<HolographicSpace>();
     * }
     *  
     * // The DeviceResources class uses the preferred DXGI adapter ID from the holographic
     * // space (when available) to create a Direct3D device. The HolographicSpace
     * // uses this ID3D11Device to create and manage device-based resources such as
     * // swap chains.
     * m_deviceResources->SetHolographicSpace(m_holographicSpace);
     *  
     * // The main class uses the holographic space for updates and rendering.
     * m_main->SetHolographicSpace(hWnd, m_holographicSpace);
     *  
     * // Show the window. This activates the holographic view, and switches focus to the app in Windows Mixed Reality.
     * ShowWindow(hWnd, nCmdShow);
     * UpdateWindow(hWnd);
     * ```
     * @param {HWND} window Type: [HWND](/windows/desktop/winprog/windows-data-types)
     * 
     * Handle to the window of the active application.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * The RUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example, __uuidof(IRadialController) will get the GUID of the interface to a buffer resource.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * Address of a pointer to a [HolographicSpace](/uwp/api/windows.graphics.holographic.holographicspace) object.
     * @see https://learn.microsoft.com/windows/win32/api/holographicspaceinterop/nf-holographicspaceinterop-iholographicspaceinterop-createforwindow
     */
    CreateForWindow(window, riid) {
        result := ComCall(6, this, HWND, window, Guid.Ptr, riid, "ptr*", &holographicSpace := 0, "HRESULT")
        return holographicSpace
    }

    Query(iid) {
        if (IHolographicSpaceInterop.IID.Equals(iid)) {
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
