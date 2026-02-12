#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables interoperability with a WinRT HolographicSpace object and provides access to HolographicSpace members for representing a holographic scene.
 * @see https://learn.microsoft.com/windows/win32/api//content/holographicspaceinterop/nn-holographicspaceinterop-iholographicspaceinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IHolographicSpaceInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicSpaceInterop
     * @type {Guid}
     */
    static IID => Guid("{5c4ee536-6a98-4b86-a170-587013d6fd4b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateForWindow"]

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
     * @returns {Pointer<Pointer<Void>>} Type: **void\*\***
     * 
     * Address of a pointer to a [HolographicSpace](/uwp/api/windows.graphics.holographic.holographicspace) object.
     * @see https://learn.microsoft.com/windows/win32/api//content/holographicspaceinterop/nf-holographicspaceinterop-iholographicspaceinterop-createforwindow
     */
    CreateForWindow(window, riid) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(6, this, "ptr", window, "ptr", riid, "ptr*", &holographicSpace := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return holographicSpace
    }
}
