#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_SHADER_BYTECODE.ahk
#Include .\D3D12_CACHED_PIPELINE_STATE.ahk

/**
 * Describes a compute pipeline state object.
 * @remarks
 * This structure is used by <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createcomputepipelinestate">CreateComputePipelineState</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_compute_pipeline_state_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_COMPUTE_PIPELINE_STATE_DESC extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12rootsignature">ID3D12RootSignature</a> object.
     * @type {ID3D12RootSignature}
     */
    pRootSignature {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode">D3D12_SHADER_BYTECODE</a> structure that describes the compute shader.
     * @type {D3D12_SHADER_BYTECODE}
     */
    CS{
        get {
            if(!this.HasProp("__CS"))
                this.__CS := D3D12_SHADER_BYTECODE(8, this)
            return this.__CS
        }
    }

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set bits to identify the nodes (the  device's physical adapters) for which the compute pipeline state is to apply.
     *             Each bit in the mask corresponds to a single node.
     *             Refer to <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     * @type {Integer}
     */
    NodeMask {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A cached pipeline state object, as a <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_cached_pipeline_state">D3D12_CACHED_PIPELINE_STATE</a> structure. pCachedBlob and CachedBlobSizeInBytes may be set to NULL and 0 respectively.
     * @type {D3D12_CACHED_PIPELINE_STATE}
     */
    CachedPSO{
        get {
            if(!this.HasProp("__CachedPSO"))
                this.__CachedPSO := D3D12_CACHED_PIPELINE_STATE(32, this)
            return this.__CachedPSO
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_pipeline_state_flags">D3D12_PIPELINE_STATE_FLAGS</a> enumeration constant such as for "tool debug".
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
