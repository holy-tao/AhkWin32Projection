#Requires AutoHotkey v2.0.0 64-bit

/**
 * Type of data contained in an input slot.
 * @remarks
 * 
  * Use these values to specify the type of data for a particular input element (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_input_element_desc">D3D10_INPUT_ELEMENT_DESC</a>) of an input-layout object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ne-d3d10-d3d10_input_classification
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_INPUT_CLASSIFICATION{

    /**
     * Input data is per-vertex data.
     * @type {Integer (Int32)}
     */
    static D3D10_INPUT_PER_VERTEX_DATA => 0

    /**
     * Input data is per-instance data.
     * @type {Integer (Int32)}
     */
    static D3D10_INPUT_PER_INSTANCE_DATA => 1
}
