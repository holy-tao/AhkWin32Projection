#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_INPUT_ELEMENT_DESC.ahk" { D3D12_INPUT_ELEMENT_DESC }

/**
 * Describes the input-buffer data for the input-assembler stage.
 * @remarks
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_input_layout_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_INPUT_LAYOUT_DESC {
    #StructPack 8

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_input_element_desc">D3D12_INPUT_ELEMENT_DESC</a> structures that describe the data types of the input-assembler stage.
     */
    pInputElementDescs : D3D12_INPUT_ELEMENT_DESC.Ptr

    /**
     * The number of input-data types in the array of input elements that the <b>pInputElementDescs</b> member points to.
     */
    NumElements : UInt32

}
