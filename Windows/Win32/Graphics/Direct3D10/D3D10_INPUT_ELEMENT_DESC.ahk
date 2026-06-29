#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D10_INPUT_CLASSIFICATION.ahk" { D3D10_INPUT_CLASSIFICATION }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * A description of a single element for the input-assembler stage. (D3D10_INPUT_ELEMENT_DESC)
 * @remarks
 * An input-layout object contains an array of structures, each structure defines one element being read from an input slot. Create an input-layout object by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createinputlayout">ID3D10Device::CreateInputLayout</a>. For an example, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage-getting-started">Create an input-layout object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_input_element_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_INPUT_ELEMENT_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-semantics">HLSL semantic</a> associated with this element in a <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-signatures">shader input-signature</a>.
     */
    SemanticName : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The semantic index for the element. A semantic index modifies a semantic, with an integer index number. A semantic index is only needed in a case where there is more than one element with the same semantic. For example, a 4x4 matrix would have four components each with the semantic name <b>matrix</b>, however each of the four component would have different semantic indices (0, 1, 2, and 3).
     */
    SemanticIndex : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The data type of the element data. See <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>.
     */
    Format : DXGI_FORMAT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An integer value that identifies the input-assembler (see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage-getting-started">input slot</a>). Valid values are between 0 and 15, defined in D3D10.h.
     */
    InputSlot : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Optional. Offset (in bytes) between each element. Use D3D10_APPEND_ALIGNED_ELEMENT for convenience to define the current element directly after the previous one, including any packing if necessary.
     */
    AlignedByteOffset : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_input_classification">D3D10_INPUT_CLASSIFICATION</a></b>
     * 
     * Identifies the input data class for a single input slot (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_input_classification">D3D10_INPUT_CLASSIFICATION</a>).
     */
    InputSlotClass : D3D10_INPUT_CLASSIFICATION

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of instances to draw before stepping one unit forward in a vertex buffer filled with instance data. Can be any unsigned integer value (0 means do not step) when the slot class is D3D10_INPUT_PER_INSTANCE_DATA; must be 0 when the slot class is D3D10_INPUT_PER_VERTEX_DATA.
     */
    InstanceDataStepRate : UInt32

}
