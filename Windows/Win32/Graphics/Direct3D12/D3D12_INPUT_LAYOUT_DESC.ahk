#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the input-buffer data for the input-assembler stage.
 * @remarks
 * 
  * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_input_layout_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_INPUT_LAYOUT_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_input_element_desc">D3D12_INPUT_ELEMENT_DESC</a> structures that describe the data types of the input-assembler stage.
     * @type {Pointer<D3D12_INPUT_ELEMENT_DESC>}
     */
    pInputElementDescs {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of input-data types in the array of input elements that the <b>pInputElementDescs</b> member points to.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
