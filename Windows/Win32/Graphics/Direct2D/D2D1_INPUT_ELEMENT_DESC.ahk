#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A description of a single element to the vertex layout.
 * @remarks
 * 
  * This structure is a subset of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_input_element_desc">D3D11_INPUT_ELEMENT_DESC</a> that omits fields required to define a vertex layout.
  * 
  * If the <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-constants">D2D1_APPEND_ALIGNED_ELEMENT</a> constant is used for  <b>alignedByteOffset</b>, the elements will be packed contiguously for convenience.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/ns-d2d1effectauthor-d2d1_input_element_desc
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_INPUT_ELEMENT_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-semantics">HLSL semantic</a> associated with this element in a <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-signatures">shader input-signature</a>.
     * @type {Pointer<Byte>}
     */
    semanticName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The semantic index for the element. A semantic index modifies a semantic, with an integer index number. A semantic index is only needed in a case where there is more than one element with the same semantic. For example, a 4x4 matrix would have four components each with the semantic name matrix; however, each of the four components would have different semantic indices (0, 1, 2, and 3).
     * @type {Integer}
     */
    semanticIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The data type of the element data.
     * @type {Integer}
     */
    format {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * An integer value that identifies the input-assembler. Valid values are between 0 and 15.
     * @type {Integer}
     */
    inputSlot {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The offset in bytes between each element.
     * @type {Integer}
     */
    alignedByteOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
