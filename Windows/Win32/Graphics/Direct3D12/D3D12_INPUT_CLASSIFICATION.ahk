#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the type of data contained in an input slot.
 * @remarks
 * 
 * Specify one of these values in the member of a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_input_element_desc">D3D12_INPUT_ELEMENT_DESC</a> structure to specify the type of data for the input element of a pipeline state object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_input_classification
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_INPUT_CLASSIFICATION{

    /**
     * Input data is per-vertex data.
     * @type {Integer (Int32)}
     */
    static D3D12_INPUT_CLASSIFICATION_PER_VERTEX_DATA => 0

    /**
     * Input data is per-instance data.
     * @type {Integer (Int32)}
     */
    static D3D12_INPUT_CLASSIFICATION_PER_INSTANCE_DATA => 1
}
