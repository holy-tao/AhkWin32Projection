#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Description of a vertex element in a vertex buffer in an output slot.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_so_declaration_entry
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_SO_DECLARATION_ENTRY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based, stream number.
     * @type {Integer}
     */
    Stream {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Type of output element; possible values include: <b>"POSITION"</b>, <b>"NORMAL"</b>, or <b>"TEXCOORD0"</b>.
     *         Note that if <i>SemanticName</i> is <b>NULL</b> then 
     *         <i>ComponentCount</i> can be greater than 4 and the described entry will be a gap in the stream out where no data will be written.
     * @type {PSTR}
     */
    SemanticName{
        get {
            if(!this.HasProp("__SemanticName"))
                this.__SemanticName := PSTR(this.ptr + 8)
            return this.__SemanticName
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Output element's zero-based index. Should be used if, for example, you have more than one texture coordinate stored in each vertex.
     * @type {Integer}
     */
    SemanticIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Which component of the entry to begin writing out to. Valid values are 0 to 3. For example, if you only wish to output to the y and z components 
     *         of a position, then StartComponent should be 1 and ComponentCount should be 2.
     * @type {Integer}
     */
    StartComponent {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The number of components of the entry to write out to. Valid values are 1 to 4. For example, if you only wish to output to the y and z components 
     *         of a position, then StartComponent should be 1 and ComponentCount should be 2.  Note that if <i>SemanticName</i> is <b>NULL</b> then 
     *         <i>ComponentCount</i> can be greater than 4 and the described entry will be a gap in the stream out where no data will be written.
     * @type {Integer}
     */
    ComponentCount {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The associated stream output buffer that is bound to the pipeline 
     *         (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-sosettargets">ID3D11DeviceContext::SOSetTargets</a>). 
     *         The valid range for <i>OutputSlot</i> is 0 to 3.
     * @type {Integer}
     */
    OutputSlot {
        get => NumGet(this, 22, "char")
        set => NumPut("char", value, this, 22)
    }
}
