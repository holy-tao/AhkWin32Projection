#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores a pipeline state.
 * @remarks
 * 
  * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> structure, and the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_compute_pipeline_state_desc">D3D12_COMPUTE_PIPELINE_STATE_DESC</a> structure.
  * 
  * This structure is intended to be filled with the data retrieved from <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12pipelinestate-getcachedblob">ID3D12PipelineState::GetCachedBlob</a>. This cached PSO contains data specific to the hardware, driver, and machine that it was retrieved from. Compilation using this data should be faster than compilation without. The rest of the data in the PSO needs to still be valid, and needs to match the cached PSO, otherwise E_INVALIDARG might be returned.
  * 
  * If the driver has been upgraded to a D3D12 driver after the PSO was cached, you might see a D3D12_ERROR_DRIVER_VERSION_MISMATCH return code, or if you’re running on a different GPU, the D3D12_ERROR_ADAPTER_NOT_FOUND return code.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_cached_pipeline_state
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_CACHED_PIPELINE_STATE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies pointer that references the memory location of the cache.
     * @type {Pointer<Void>}
     */
    pCachedBlob {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the size of the cache in bytes.
     * @type {Pointer}
     */
    CachedBlobSizeInBytes {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
