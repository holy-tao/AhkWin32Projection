#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Graphics\Direct3D12\ID3D12Resource.ahk
#Include ..\IInspectable.ahk

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
 * @namespace Windows.Win32.System.WinRT.Holographic
 * @version v4.0.30319
 */
class IHolographicCameraInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicCameraInterop
     * @type {Guid}
     */
    static IID => Guid("{7cc1f9c5-6d02-41fa-9500-e1809eb48eec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDirect3D12BackBufferResource", "CreateDirect3D12HardwareProtectedBackBufferResource", "AcquireDirect3D12BufferResource", "AcquireDirect3D12BufferResourceWithTimeout", "UnacquireDirect3D12BufferResource"]

    /**
     * Creates a Direct3D 12 resource for use as a content buffer for the camera.
     * @param {ID3D12Device} pDevice Type: **[ID3D12Device](../d3d12/nn-d3d12-id3d12device.md)\***
     * 
     * A Direct3D 12 device, which will be used to create the resource.
     * @param {Pointer<D3D12_RESOURCE_DESC>} pTexture2DDesc Type: **[D3D12_RESOURCE_DESC](../d3d12/ns-d3d12-d3d12_resource_desc.md)\***
     * 
     * The Direct3D 12 resource description. This parameter is not optional.
     * 
     * **CreateDirect3D12BackBufferResource** adjusts the description as needed to comply with platform requirements, such as buffer size or format restrictions, which are determined at runtime. Your application should inspect the descriptor for the texture returned in *ppCreatedTexture2DResource*, and respond appropriately to any differences from what was specified.
     * @returns {ID3D12Resource} Type: **[ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md)\*\***
     * 
     * If successful, the Direct3D 12 2D texture resource for use as a content buffer. Otherwise, `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographiccamerainterop-createdirect3d12backbufferresource
     */
    CreateDirect3D12BackBufferResource(pDevice, pTexture2DDesc) {
        result := ComCall(6, this, "ptr", pDevice, "ptr", pTexture2DDesc, "ptr*", &ppCreatedTexture2DResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ID3D12Resource(ppCreatedTexture2DResource)
    }

    /**
     * IHolographicCameraInterop::CreateDirect3D12HardwareProtectedBackBufferResource creates a Direct3D 12 resource for use as a content buffer for the camera.
     * @param {ID3D12Device} pDevice Type: **[ID3D12Device](../d3d12/nn-d3d12-id3d12device.md)\***
     * 
     * A Direct3D 12 device, which will be used to create the resource.
     * @param {Pointer<D3D12_RESOURCE_DESC>} pTexture2DDesc Type: **[D3D12_RESOURCE_DESC](../d3d12/ns-d3d12-d3d12_resource_desc.md)\***
     * 
     * The Direct3D 12 resource description.
     * 
     * **CreateDirect3D12HardwareProtectedBackBufferResource** adjusts the description as needed to comply with platform requirements, such as buffer size or format restrictions, which are determined at runtime. Your application should inspect the descriptor for the texture returned in *ppCreatedTexture2DResource* and respond appropriately to any differences from what was specified.
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession Type: **[ID3D12ProtectedResourceSession](../d3d12/nn-d3d12-id3d12protectedresourcesession.md)\***
     * 
     * An optional Direct3D 12 protected resource session. Passing in a valid protected session will cause this method to create a Direct3D 12 hardware-protected resource.
     * @returns {ID3D12Resource} Type: **[ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md)\*\***
     * 
     * If successful, the hardware-protected Direct3D 12 2D texture resource for use as a back buffer. Otherwise, `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographiccamerainterop-createdirect3d12hardwareprotectedbackbufferresource
     */
    CreateDirect3D12HardwareProtectedBackBufferResource(pDevice, pTexture2DDesc, pProtectedResourceSession) {
        result := ComCall(7, this, "ptr", pDevice, "ptr", pTexture2DDesc, "ptr", pProtectedResourceSession, "ptr*", &ppCreatedTexture2DResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ID3D12Resource(ppCreatedTexture2DResource)
    }

    /**
     * The IHolographicCameraInterop::AcquireDirect3D12BufferResource function acquires a Direct3D 12 buffer resource.
     * @param {ID3D12Resource} pResourceToAcquire Type: **[ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md)\***
     * 
     * The Direct3D 12 resource to acquire.
     * @param {ID3D12CommandQueue} pCommandQueue Type: **[ID3D12CommandQueue](../d3d12/nn-d3d12-id3d12commandqueue.md)\***
     * 
     * The Direct3D 12 command queue to use for transitioning the state of this resource when acquiring it for your application.
     * The resource will be in the **D3D12_RESOURCE_STATE_COMMON** state when it is acquired. The resource transition command may not be queued if the resource is already in the common state when it is being acquired.
     * @returns {HRESULT} **S_OK** if successful, otherwise returns an [HRESULT](/windows/win32/com/structure-of-com-error-codes) error code indicating the reason for failure. Also see [COM Error Codes (UI, Audio, DirectX, Codec)](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographiccamerainterop-acquiredirect3d12bufferresource
     */
    AcquireDirect3D12BufferResource(pResourceToAcquire, pCommandQueue) {
        result := ComCall(8, this, "ptr", pResourceToAcquire, "ptr", pCommandQueue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IHolographicCameraInterop::AcquireDirect3D12BufferResourceWithTimeout function acquires a Direct3D 12 buffer resource, with an optional timeout.
     * @param {ID3D12Resource} pResourceToAcquire Type: **[ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md)\***
     * 
     * The Direct3D 12 resource to acquire.
     * @param {ID3D12CommandQueue} pCommandQueue Type: **[ID3D12CommandQueue](../d3d12/nn-d3d12-id3d12commandqueue.md)\***
     * 
     * The Direct3D 12 command queue to use for transitioning the state of this resource when acquiring it for your application. The resource will be in the **D3D12_RESOURCE_STATE_COMMON** state when it is acquired.
     * @param {Integer} duration Type: **[UINT64](/windows/win32/winprog/windows-data-types)**
     * 
     * If this parameter is set to a non-zero value, the call will wait for that amount of time for the buffer to be acquired. If the timeout period elapses before the buffer can be acquired, the method will fail with the error code **E_TIMEOUT**. This parameter is specified in 100-nanosecond units, similar to the [TimeSpan.Duration](/uwp/api/windows.foundation.timespan.duration) field.
     * @returns {HRESULT} **S_OK** if successful, otherwise returns an [HRESULT](/windows/win32/com/structure-of-com-error-codes) error code indicating the reason for failure. Also see [COM Error Codes (UI, Audio, DirectX, Codec)](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographiccamerainterop-acquiredirect3d12bufferresourcewithtimeout
     */
    AcquireDirect3D12BufferResourceWithTimeout(pResourceToAcquire, pCommandQueue, duration) {
        result := ComCall(9, this, "ptr", pResourceToAcquire, "ptr", pCommandQueue, "uint", duration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IHolographicCameraInterop::UnacquireDirect3D12BufferResource function un-acquires a Direct3D 12 buffer resource.
     * @param {ID3D12Resource} pResourceToUnacquire Type: **[ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md)\***
     * 
     * The Direct3D 12 resource to relinquish control of.
     * @returns {HRESULT} **S_OK** if successful, otherwise returns an [HRESULT](/windows/win32/com/structure-of-com-error-codes) error code indicating the reason for failure. Also see [COM Error Codes (UI, Audio, DirectX, Codec)](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographiccamerainterop-unacquiredirect3d12bufferresource
     */
    UnacquireDirect3D12BufferResource(pResourceToUnacquire) {
        result := ComCall(10, this, "ptr", pResourceToUnacquire, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
