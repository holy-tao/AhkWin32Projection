#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_INPUT_CLASSIFICATION.ahk" { D3D12_INPUT_CLASSIFICATION }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a single element for the input-assembler stage of the graphics pipeline.
 * @remarks
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_input_layout_desc">D3D12_INPUT_LAYOUT_DESC</a> structure. A pipeline state object contains a input-layout structure that defines one element being read from an input slot.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_input_element_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_INPUT_ELEMENT_DESC {
    #StructPack 8

    /**
     * The HLSL semantic associated with this element in a shader input-signature. See <a href="https://docs.microsoft.com/windows/win32/direct3dhlsl/dx-graphics-hlsl-semantics">HLSL Semantics</a> for more info.
     */
    SemanticName : PSTR

    /**
     * The semantic index for the element. A semantic index modifies a semantic, with an integer index number. A semantic index is only needed in a
     *         case where there is more than one element with the same semantic. For example, a 4x4 matrix would have four components each with the semantic
     *         name <b>matrix</b>, however each of the four component would have different semantic indices (0, 1, 2, and 3).
     */
    SemanticIndex : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that specifies the format of the element data.
     */
    Format : DXGI_FORMAT

    /**
     * An integer value that identifies the input-assembler. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage-getting-started">Input Slots</a>. Valid values are between 0 and 15.
     */
    InputSlot : UInt32

    /**
     * Optional. Offset, in bytes, to this element from the start of the vertex. Use D3D12_APPEND_ALIGNED_ELEMENT (0xffffffff) for convenience to define the current element directly
     *         after the previous one, including any packing if necessary.
     */
    AlignedByteOffset : UInt32

    /**
     * A value that identifies the input data class for a single input slot.
     */
    InputSlotClass : D3D12_INPUT_CLASSIFICATION

    /**
     * The number of instances to draw using the same per-instance data before advancing in the buffer by one element. This value must be 0 for an
     *         element that contains per-vertex data (the slot class is set to the D3D12_INPUT_PER_VERTEX_DATA member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_input_classification">D3D12_INPUT_CLASSIFICATION</a>).
     */
    InstanceDataStepRate : UInt32

}
