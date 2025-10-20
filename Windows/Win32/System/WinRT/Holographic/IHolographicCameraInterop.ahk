#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Holographic
 * @version v4.0.30319
 */
class IHolographicCameraInterop extends IInspectable{
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
     * 
     * @param {Pointer<ID3D12Device>} pDevice 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pTexture2DDesc 
     * @param {Pointer<ID3D12Resource>} ppCreatedTexture2DResource 
     * @returns {HRESULT} 
     */
    CreateDirect3D12BackBufferResource(pDevice, pTexture2DDesc, ppCreatedTexture2DResource) {
        result := ComCall(6, this, "ptr", pDevice, "ptr", pTexture2DDesc, "ptr", ppCreatedTexture2DResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Device>} pDevice 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pTexture2DDesc 
     * @param {Pointer<ID3D12ProtectedResourceSession>} pProtectedResourceSession 
     * @param {Pointer<ID3D12Resource>} ppCreatedTexture2DResource 
     * @returns {HRESULT} 
     */
    CreateDirect3D12HardwareProtectedBackBufferResource(pDevice, pTexture2DDesc, pProtectedResourceSession, ppCreatedTexture2DResource) {
        result := ComCall(7, this, "ptr", pDevice, "ptr", pTexture2DDesc, "ptr", pProtectedResourceSession, "ptr", ppCreatedTexture2DResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResourceToAcquire 
     * @param {Pointer<ID3D12CommandQueue>} pCommandQueue 
     * @returns {HRESULT} 
     */
    AcquireDirect3D12BufferResource(pResourceToAcquire, pCommandQueue) {
        result := ComCall(8, this, "ptr", pResourceToAcquire, "ptr", pCommandQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResourceToAcquire 
     * @param {Pointer<ID3D12CommandQueue>} pCommandQueue 
     * @param {Integer} duration 
     * @returns {HRESULT} 
     */
    AcquireDirect3D12BufferResourceWithTimeout(pResourceToAcquire, pCommandQueue, duration) {
        result := ComCall(9, this, "ptr", pResourceToAcquire, "ptr", pCommandQueue, "uint", duration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResourceToUnacquire 
     * @returns {HRESULT} 
     */
    UnacquireDirect3D12BufferResource(pResourceToUnacquire) {
        result := ComCall(10, this, "ptr", pResourceToUnacquire, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
