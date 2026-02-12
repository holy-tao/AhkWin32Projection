#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Extends [HolographicCamera](/uwp/api/windows.graphics.holographic.holographiccamera) to allow 2D texture resources to be created and used as back buffers for holographic rendering in Direct3D 12.
 * @remarks
 * To use this interface in [C++/WinRT](/windows/uwp/cpp-and-winrt-apis/), **QueryInterface** for the **IHolographicCameraInterop** interface from the [HolographicCamera](/uwp/api/windows.graphics.holographic.holographiccamera) object.
 * 
 * ```cppwinrt
 * winrt::com_ptr<IHolographicCameraInterop> spCameraInterop {
 *     m_holographicCamera.as<IHolographicCameraInterop>() };
 * 
 * D3D12_RESOURCE_DESC bufferDesc { };
 * bufferDesc.Format =
 *   SelectFormatUsingHolographicViewConfiguration(
 *     m_holographicCamera.ViewConfiguration());
 * bufferDesc.SampleDesc.Count = 1;
 * bufferDesc.SampleDesc.Quality = 0;
 * bufferDesc.MipLevels = 1;
 * bufferDesc.Width = static_cast<UINT64>(
 *   m_holographicCamera.ViewConfiguration().RenderTargetSize().Width);
 * bufferDesc.Height = static_cast<UINT64>(
 *   m_holographicCamera.ViewConfiguration().RenderTargetSize().Height);
 * 
 * winrt::check_hresult(
 *   spCameraInterop->CreateDirect3D12BackBufferResource(
 *     m_deviceResources->GetD3D12Device(),
 *     &bufferDesc,
 *     &m_D3D12BackBuffer[m_contentBufferIndex]));
 * ```
 * 
 * You can use the [HolographicViewConfiguration](/uwp/api/windows.graphics.holographic.holographicviewconfiguration) API to determine the available options for buffer format, and to acquire information about render target size for the corresponding output&mdash;for example, the [HolographicDisplay](/uwp/api/windows.graphics.holographic.holographicdisplay). If your application needs to change the buffer size for Direct3D 12 buffers from the default render target size for the [HolographicCamera](/uwp/api/windows.graphics.holographic.holographiccamera), then it should either request a new render target size using the [HolographicViewConfiguration::RequestRenderTargetSize](/uwp/api/windows.graphics.holographic.holographicviewconfiguration.requestrendertargetsize) method and create buffers using the size returned by that method, or choose an arbitrary size and override the viewport as described in the following paragraph.
 * 
 * Your Direct3D 12 application can use a viewport size chosen independently by the application. In that case, you must call the [HolographicCameraPose.OverrideViewport](/uwp/api/windows.graphics.holographic.holographiccamerapose.overrideviewport) method each frame to inform the platform about the viewport used for rendering.
 * 
 * The following code excerpt is from the [Windows Mixed Reality Direct3D 12 app template](https://marketplace.visualstudio.com/items?itemName=WindowsMixedRealityteam.WindowsMixedRealityAppTemplatesVSIX), which includes boilerplate code for most APIs that are provided in the `Windows.Graphics.Holographic.Interop.h` header.
 * 
 * ```cppwinrt
 * winrt::com_ptr<IHolographicCameraInterop> spCameraInterop = 
 *     m_holographicCamera.as<IHolographicCameraInterop>();
 * winrt::check_hresult(
 *     spCameraInterop->CreateDirect3D12BackBufferResource(
 *         spD3D12Device.get(),
 *         &bufferDesc,
 *         m_spD3D12BackBuffer[bufferSlot].put()));
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nn-windows-graphics-holographic-interop-iholographiccamerainterop
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicCamera extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicCamera
     * @type {Guid}
     */
    static IID => Guid("{e4e98445-9bed-4980-9ba0-e87680d1cb74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RenderTargetSize", "get_ViewportScaleFactor", "put_ViewportScaleFactor", "get_IsStereo", "get_Id", "SetNearPlaneDistance", "SetFarPlaneDistance"]

    /**
     * @type {SIZE} 
     */
    RenderTargetSize {
        get => this.get_RenderTargetSize()
    }

    /**
     * @type {Float} 
     */
    ViewportScaleFactor {
        get => this.get_ViewportScaleFactor()
        set => this.put_ViewportScaleFactor(value)
    }

    /**
     * @type {Boolean} 
     */
    IsStereo {
        get => this.get_IsStereo()
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_RenderTargetSize() {
        value := SIZE()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ViewportScaleFactor() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ViewportScaleFactor(value) {
        result := ComCall(8, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStereo() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    SetNearPlaneDistance(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    SetFarPlaneDistance(value) {
        result := ComCall(12, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
