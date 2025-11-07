#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags to control pipeline state.
 * @remarks
 * 
 * This enum is used by the <b>Flags</b> member of the
 *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a>and 
 *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_compute_pipeline_state_desc">D3D12_COMPUTE_PIPELINE_STATE_DESC</a>structures.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_pipeline_state_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_PIPELINE_STATE_FLAGS{

    /**
     * Indicates no flags.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_FLAG_NONE => 0

    /**
     * Indicates that the pipeline state should be compiled with additional information to assist debugging.
     *           This can only be set on WARP devices.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_FLAG_TOOL_DEBUG => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_FLAG_DYNAMIC_DEPTH_BIAS => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_FLAG_DYNAMIC_INDEX_BUFFER_STRIP_CUT => 8
}
