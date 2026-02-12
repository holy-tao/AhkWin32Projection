#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Graphics\Direct3D12\ID3D12Resource.ahk
#Include ..\IInspectable.ahk

/**
 * A nano-COM interface that allows COM interop with the [HolographicQuadLayer](/uwp/api/windows.graphics.holographic.holographicquadlayer) Windows Runtime class for apps that use Direct3D 12 for holographic rendering.
 * @remarks
 * To use this interface in [C++/WinRT](/windows/uwp/cpp-and-winrt-apis/), QueryInterface for the **IHolographicQuadLayerInterop** interface from the [HolographicQuadLayer](/uwp/api/windows.graphics.holographic.holographicquadlayer) object.
 * 
 * Note that you can use the [HolographicViewConfiguration](/uwp/api/windows.graphics.holographic.holographicviewconfiguration) API to determine the available options for buffer format.
 * 
 * ```cppwinrt
 * m_quadLayer = HolographicQuadLayer{ {1024, 1024} };
 * winrt::com_ptr<IHolographicQuadLayerInterop> quadLayerInterop{
 *     m_quadLayer.as<IHolographicQuadLayerInterop>() };
 * 
 * // Create/acquire buffer.
 * if (!m_D3D12ContentBuffer[m_contentBufferIndex])
 * {
 *     D3D12_RESOURCE_DESC bufferDesc{ sourceDesc };
 *     bufferDesc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
 *     bufferDesc.SampleDesc.Count = 1;
 *     bufferDesc.SampleDesc.Quality = 0;
 *     bufferDesc.MipLevels = 1;
 * 
 *     winrt::check_hresult(
 *         quadLayerInterop->CreateDirect3D12ContentBufferResource(
 *             m_deviceResources->GetD3D12Device(),
 *             &bufferDesc,
 *             &m_D3D12ContentBuffer[m_contentBufferIndex]));
 * }
 * ```
 * 
 * To use this interface in C++/CX, cast the [HolographicQuadLayer](/uwp/api/windows.graphics.holographic.holographicquadlayer) object to [IInspectable](../inspectable/nn-inspectable-iinspectable.md)\*. Then QueryInterface for the **IHolographicQuadLayerInterop** interface from the **IInspectable** pointer.
 * 
 * ```cppcx
 * m_quadLayer = ref new HolographicQuadLayer();
 * Microsoft::WRL::ComPtr<IHolographicQuadLayerInterop> quadLayerInterop;
 * {
 *     Microsoft::WRL::ComPtr<IInspectable> iInspectable = reinterpret_cast<IInspectable*>(m_quadLayer);
 *     DX::ThrowIfFailed(iInspectable.As(&quadLayerInterop));
 * }
 * 
 * // Create/acquire buffer.
 * if (!m_D3D12ContentBuffer[m_contentBufferIndex])
 * {
 *     D3D12_RESOURCE_DESC bufferDesc = sourceDesc;
 *     bufferDesc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
 *     bufferDesc.SampleDesc.Count = 1;
 *     bufferDesc.SampleDesc.Quality = 0;
 *     bufferDesc.MipLevels = 1;
 * 
 *     DX::ThrowIfFailed(quadLayerInterop->CreateDirect3D12ContentBufferResource(
 *         m_deviceResources->GetD3D12Device(),
 *         &bufferDesc,
 *         &m_D3D12ContentBuffer[m_contentBufferIndex]));
 * }
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nn-windows-graphics-holographic-interop-iholographicquadlayerinterop
 * @namespace Windows.Win32.System.WinRT.Holographic
 * @version v4.0.30319
 */
class IHolographicQuadLayerInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicQuadLayerInterop
     * @type {Guid}
     */
    static IID => Guid("{cfa688f0-639e-4a47-83d7-6b7f5ebf7fed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDirect3D12ContentBufferResource", "CreateDirect3D12HardwareProtectedContentBufferResource", "AcquireDirect3D12BufferResource", "AcquireDirect3D12BufferResourceWithTimeout", "UnacquireDirect3D12BufferResource"]

    /**
     * Creates a Direct3D 12 resource for use as a content buffer for the layer.
     * @param {ID3D12Device} pDevice Type: **[ID3D12Device](../d3d12/nn-d3d12-id3d12device.md)\***
     * 
     * A Direct3D 12 device, which will be used to create the resource.
     * @param {Pointer<D3D12_RESOURCE_DESC>} pTexture2DDesc Type: **[D3D12_RESOURCE_DESC](../d3d12/ns-d3d12-d3d12_resource_desc.md)\***
     * 
     * The Direct3D 12 resource description. This parameter is not optional.
     * 
     * **CreateDirect3D12ContentBufferResource** adjusts the description as needed to comply with platform requirements, such as buffer size or format restrictions, which are determined at runtime. Your application should inspect the descriptor for the texture returned in *ppCreatedTexture2DResource*, and respond appropriately to any differences from what was specified.
     * @returns {ID3D12Resource} Type: **[ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md)\*\***
     * 
     * If successful, the Direct3D 12 2D texture resource for use as a content buffer. Otherwise, `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographicquadlayerinterop-createdirect3d12contentbufferresource
     */
    CreateDirect3D12ContentBufferResource(pDevice, pTexture2DDesc) {
        result := ComCall(6, this, "ptr", pDevice, "ptr", pTexture2DDesc, "ptr*", &ppTexture2DResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ID3D12Resource(ppTexture2DResource)
    }

    /**
     * The IHolographicQuadLayerInterop::CreateDirect3D12HardwareProtectedContentBufferResource function creates a Direct3D 12 resource content buffer for the camera.
     * @param {ID3D12Device} pDevice Type: **[ID3D12Device](../d3d12/nn-d3d12-id3d12device.md)\***
     * 
     * A Direct3D 12 device, which will be used to create the resource.
     * @param {Pointer<D3D12_RESOURCE_DESC>} pTexture2DDesc Type: **[D3D12_RESOURCE_DESC](../d3d12/ns-d3d12-d3d12_resource_desc.md)\***
     * 
     * The Direct3D 12 resource description.
     * 
     * **CreateDirect3D12HardwareProtectedContentBufferResource** adjusts the description as needed to comply with platform requirements, such as buffer size or format restrictions, which are determined at runtime. Your application should inspect the descriptor for the texture returned in `ppCreatedTexture2DResource` and respond appropriately to any differences from what was specified.
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession Type: **[ID3D12ProtectedResourceSession](../d3d12/nn-d3d12-id3d12protectedresourcesession.md)\***
     * 
     * An optional Direct3D 12 protected resource session. Passing in a valid protected session causes this method to create a Direct3D 12 hardware-protected resource.
     * @returns {ID3D12Resource} Type: **[ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md)\*\***
     * 
     * If successful, the hardware-protected Direct3D 12 2D texture resource for use as a content buffer. Otherwise, `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographicquadlayerinterop-createdirect3d12hardwareprotectedcontentbufferresource
     */
    CreateDirect3D12HardwareProtectedContentBufferResource(pDevice, pTexture2DDesc, pProtectedResourceSession) {
        result := ComCall(7, this, "ptr", pDevice, "ptr", pTexture2DDesc, "ptr", pProtectedResourceSession, "ptr*", &ppCreatedTexture2DResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ID3D12Resource(ppCreatedTexture2DResource)
    }

    /**
     * The IHolographicQuadLayerInterop::AcquireDirect3D12BufferResource function acquires a Direct3D 12 buffer resource.
     * @param {ID3D12Resource} pResourceToAcquire Type: **[ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md)\***
     * 
     * The Direct3D 12 resource to acquire. The resource will be in the **D3D12_RESOURCE_STATE_COMMON** state when it is acquired.
     * @param {ID3D12CommandQueue} pCommandQueue Type: **[ID3D12CommandQueue](../d3d12/nn-d3d12-id3d12commandqueue.md)\***
     * 
     * The Direct3D 12 command queue to use for transitioning the state of this resource when acquiring it for your application.
     * @returns {HRESULT} **S_OK** if successful, otherwise returns an [HRESULT](/windows/win32/com/structure-of-com-error-codes) error code indicating the reason for failure. Also see [COM Error Codes (UI, Audio, DirectX, Codec)](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographicquadlayerinterop-acquiredirect3d12bufferresource
     */
    AcquireDirect3D12BufferResource(pResourceToAcquire, pCommandQueue) {
        result := ComCall(8, this, "ptr", pResourceToAcquire, "ptr", pCommandQueue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IHolographicQuadLayerInterop::AcquireDirect3D12BufferResourceWithTimeout function acquires a Direct3D 12 buffer resource, with an optional timeout.
     * @param {ID3D12Resource} pResourceToAcquire Type: **[ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md)\***
     * 
     * The Direct3D 12 resource to acquire. The resource will be in the **D3D12_RESOURCE_STATE_COMMON** state when it is acquired.
     * @param {ID3D12CommandQueue} pCommandQueue Type: **[ID3D12CommandQueue](../d3d12/nn-d3d12-id3d12commandqueue.md)\***
     * 
     * The Direct3D 12 command queue to use for transitioning the state of this resource when acquiring it for your application.
     * @param {Integer} duration Type: **[UINT64](/windows/win32/winprog/windows-data-types)**
     * 
     * If this parameter is set, the call will wait for that amount of  time for the buffer to be acquired. If the timeout period elapses before the buffer can be acquired, the method fails with the error code **E_TIMEOUT**. This parameter is in 100-nanosecond units, similar to the [TimeSpan.Duration](/uwp/api/windows.foundation.timespan.duration) field.
     * @returns {HRESULT} **S_OK** if successful, otherwise returns an [HRESULT](/windows/win32/com/structure-of-com-error-codes) error code indicating the reason for failure. Also see [COM Error Codes (UI, Audio, DirectX, Codec)](/windows/win32/com/com-error-codes-10).
     * 
     * When no timeout value is specified, if this method is called and the buffer is not ready to be acquired, the method call will fail with the error code **E_NOTREADY**.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographicquadlayerinterop-acquiredirect3d12bufferresourcewithtimeout
     */
    AcquireDirect3D12BufferResourceWithTimeout(pResourceToAcquire, pCommandQueue, duration) {
        result := ComCall(9, this, "ptr", pResourceToAcquire, "ptr", pCommandQueue, "uint", duration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IHolographicQuadLayerInterop::UnacquireDirect3D12BufferResource function un-acquires a Direct3D 12 buffer resource.
     * @param {ID3D12Resource} pResourceToUnacquire Type: **[ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md)\***
     * 
     * The Direct3D 12 resource to relinquish control of.
     * @returns {HRESULT} **S_OK** if successful, otherwise returns an [HRESULT](/windows/win32/com/structure-of-com-error-codes) error code indicating the reason for failure. Also see [COM Error Codes (UI, Audio, DirectX, Codec)](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographicquadlayerinterop-unacquiredirect3d12bufferresource
     */
    UnacquireDirect3D12BufferResource(pResourceToUnacquire) {
        result := ComCall(10, this, "ptr", pResourceToUnacquire, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
