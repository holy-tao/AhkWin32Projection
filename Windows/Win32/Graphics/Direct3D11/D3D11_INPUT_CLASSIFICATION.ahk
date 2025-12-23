#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Type of data contained in an input slot. (D3D11_INPUT_CLASSIFICATION)
 * @remarks
 * Use these values to specify the type of data for a particular input element (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_input_element_desc">D3D11_INPUT_ELEMENT_DESC</a>) of an input-layout object.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_input_classification
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_INPUT_CLASSIFICATION extends Win32Enum{

    /**
     * Input data is per-vertex data.
     * @type {Integer (Int32)}
     */
    static D3D11_INPUT_PER_VERTEX_DATA => 0

    /**
     * Input data is per-instance data.
     * @type {Integer (Int32)}
     */
    static D3D11_INPUT_PER_INSTANCE_DATA => 1
}
