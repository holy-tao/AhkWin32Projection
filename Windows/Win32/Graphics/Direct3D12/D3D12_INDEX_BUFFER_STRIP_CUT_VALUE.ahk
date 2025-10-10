#Requires AutoHotkey v2.0.0 64-bit

/**
 * When using triangle strip primitive topology, vertex positions are interpreted as vertices of a continuous triangle “strip”.
 * @remarks
 * 
  * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_index_buffer_strip_cut_value
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_INDEX_BUFFER_STRIP_CUT_VALUE{

    /**
     * Indicates that there is no cut value.
     * @type {Integer (Int32)}
     */
    static D3D12_INDEX_BUFFER_STRIP_CUT_VALUE_DISABLED => 0

    /**
     * Indicates that 0xFFFF should be used as the cut value.
     * @type {Integer (Int32)}
     */
    static D3D12_INDEX_BUFFER_STRIP_CUT_VALUE_0xFFFF => 1

    /**
     * Indicates that 0xFFFFFFFF should be used as the cut value.
     * @type {Integer (Int32)}
     */
    static D3D12_INDEX_BUFFER_STRIP_CUT_VALUE_0xFFFFFFFF => 2
}
