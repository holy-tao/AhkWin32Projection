#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.holographic.interop/nn-windows-graphics-holographic-interop-iholographicquadlayerinterop
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
     * 
     * @param {ID3D12Device} pDevice 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pTexture2DDesc 
     * @param {Pointer<ID3D12Resource>} ppTexture2DResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographicquadlayerinterop-createdirect3d12contentbufferresource
     */
    CreateDirect3D12ContentBufferResource(pDevice, pTexture2DDesc, ppTexture2DResource) {
        result := ComCall(6, this, "ptr", pDevice, "ptr", pTexture2DDesc, "ptr*", ppTexture2DResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Device} pDevice 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pTexture2DDesc 
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession 
     * @param {Pointer<ID3D12Resource>} ppCreatedTexture2DResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographicquadlayerinterop-createdirect3d12hardwareprotectedcontentbufferresource
     */
    CreateDirect3D12HardwareProtectedContentBufferResource(pDevice, pTexture2DDesc, pProtectedResourceSession, ppCreatedTexture2DResource) {
        result := ComCall(7, this, "ptr", pDevice, "ptr", pTexture2DDesc, "ptr", pProtectedResourceSession, "ptr*", ppCreatedTexture2DResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Resource} pResourceToAcquire 
     * @param {ID3D12CommandQueue} pCommandQueue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographicquadlayerinterop-acquiredirect3d12bufferresource
     */
    AcquireDirect3D12BufferResource(pResourceToAcquire, pCommandQueue) {
        result := ComCall(8, this, "ptr", pResourceToAcquire, "ptr", pCommandQueue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Resource} pResourceToAcquire 
     * @param {ID3D12CommandQueue} pCommandQueue 
     * @param {Integer} duration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographicquadlayerinterop-acquiredirect3d12bufferresourcewithtimeout
     */
    AcquireDirect3D12BufferResourceWithTimeout(pResourceToAcquire, pCommandQueue, duration) {
        result := ComCall(9, this, "ptr", pResourceToAcquire, "ptr", pCommandQueue, "uint", duration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Resource} pResourceToUnacquire 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographicquadlayerinterop-unacquiredirect3d12bufferresource
     */
    UnacquireDirect3D12BufferResource(pResourceToUnacquire) {
        result := ComCall(10, this, "ptr", pResourceToUnacquire, "HRESULT")
        return result
    }
}
