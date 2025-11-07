#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A description of a single element for the input-assembler stage.
 * @remarks
 * 
 * An input-layout object contains an array of structures, each structure defines one element being read from an input slot. Create an input-layout 
 *       object by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createinputlayout">ID3D11Device::CreateInputLayout</a>. For an example, see the "Create the Input-Layout Object" subtopic under the  <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage-getting-started">Getting Started with the Input-Assembler Stage</a> topic.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_input_element_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_INPUT_ELEMENT_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The HLSL semantic associated with this element in a shader input-signature.
     * @type {PSTR}
     */
    SemanticName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The semantic index for the element. A semantic index modifies a semantic, with an integer index number. A semantic index is only needed in a 
     *         case where there is more than one element with the same semantic. For example, a 4x4 matrix would have four components each with the semantic 
     *         name 
     * 
     * 
     * ```
     * matrix
     * ```
     * 
     * 
     * , however each of the four component would have different semantic indices (0, 1, 2, and 3).
     * @type {Integer}
     */
    SemanticIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The data type of the element data. See <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An integer value that identifies the input-assembler (see input slot). Valid values are between 0 and 15, defined in D3D11.h.
     * @type {Integer}
     */
    InputSlot {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Optional. Offset (in bytes) from the start of the vertex. Use D3D11_APPEND_ALIGNED_ELEMENT for convenience to define the current element directly 
     *         after the previous one, including any packing if necessary.
     * @type {Integer}
     */
    AlignedByteOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_input_classification">D3D11_INPUT_CLASSIFICATION</a></b>
     * 
     * Identifies the input data class for a single input slot (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_input_classification">D3D11_INPUT_CLASSIFICATION</a>).
     * @type {Integer}
     */
    InputSlotClass {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of instances to draw using the same per-instance data before advancing in the buffer by one element. This value must be 0 for an 
     *         element that contains per-vertex data (the slot class is set to D3D11_INPUT_PER_VERTEX_DATA).
     * @type {Integer}
     */
    InstanceDataStepRate {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
