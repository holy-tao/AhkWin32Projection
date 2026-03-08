#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables interoperability with a WinRT SpatialInteractionManager object and provides access to SpatialInteractionManager members for accessing user input from hands, motion controllers, and system voice commands.
 * @see https://learn.microsoft.com/windows/win32/api/spatialinteractionmanagerinterop/nn-spatialinteractionmanagerinterop-ispatialinteractionmanagerinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ISpatialInteractionManagerInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionManagerInterop
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
    static VTableNames => ["GetForWindow"]

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
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(6, this, "ptr", window, "ptr", riid, "ptr*", &spatialInteractionManager := 0, "HRESULT")
        return spatialInteractionManager
    }
}
