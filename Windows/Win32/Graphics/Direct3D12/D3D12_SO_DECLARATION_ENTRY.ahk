#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a vertex element in a vertex buffer in an output slot.
 * @remarks
 * Specify an array of <b>D3D12_SO_DECLARATION_ENTRY</b> structures in the <b>pSODeclaration</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_stream_output_desc">D3D12_STREAM_OUTPUT_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_so_declaration_entry
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SO_DECLARATION_ENTRY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Zero-based, stream number.
     * @type {Integer}
     */
    Stream {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type of output element; possible values include: <b>"POSITION"</b>, <b>"NORMAL"</b>, or <b>"TEXCOORD0"</b>.
     *         Note that if <b>SemanticName</b> is <b>NULL</b> then 
     *         <b>ComponentCount</b> can be greater than 4 and the described entry will be a gap in the stream out where no data will be written.
     * @type {Pointer<Byte>}
     */
    SemanticName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Output element's zero-based index. Use, for example, if you have more than one texture coordinate stored in each vertex.
     * @type {Integer}
     */
    SemanticIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The component of the entry to begin writing out to. Valid values are 0 to 3. For example, if you only wish to output to the y and z components 
     *         of a position, <b>StartComponent</b> is 1 and <b>ComponentCount</b> is 2.
     * @type {Integer}
     */
    StartComponent {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * The number of components of the entry to write out to. Valid values are 1 to 4. For example, if you only wish to output to the y and z components 
     *         of a position, <b>StartComponent</b> is 1 and <b>ComponentCount</b> is 2.  Note that if <b>SemanticName</b> is <b>NULL</b> then 
     *         <b>ComponentCount</b> can be greater than 4 and the described entry will be a gap in the stream out where no data will be written.
     * @type {Integer}
     */
    ComponentCount {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * The associated stream output buffer that is bound to the pipeline. 
     *         The valid range for <b>OutputSlot</b> is 0 to 3.
     * @type {Integer}
     */
    OutputSlot {
        get => NumGet(this, 22, "char")
        set => NumPut("char", value, this, 22)
    }
}
