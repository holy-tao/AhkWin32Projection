#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Description of a vertex element in a vertex buffer in an output slot. (D3D11_SO_DECLARATION_ENTRY)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_so_declaration_entry
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_SO_DECLARATION_ENTRY {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based, stream number.
     */
    Stream : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Type of output element; possible values include: <b>"POSITION"</b>, <b>"NORMAL"</b>, or <b>"TEXCOORD0"</b>.
     *         Note that if <i>SemanticName</i> is <b>NULL</b> then 
     *         <i>ComponentCount</i> can be greater than 4 and the described entry will be a gap in the stream out where no data will be written.
     */
    SemanticName : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Output element's zero-based index. Should be used if, for example, you have more than one texture coordinate stored in each vertex.
     */
    SemanticIndex : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Which component of the entry to begin writing out to. Valid values are 0 to 3. For example, if you only wish to output to the y and z components 
     *         of a position, then StartComponent should be 1 and ComponentCount should be 2.
     */
    StartComponent : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The number of components of the entry to write out to. Valid values are 1 to 4. For example, if you only wish to output to the y and z components 
     *         of a position, then StartComponent should be 1 and ComponentCount should be 2.  Note that if <i>SemanticName</i> is <b>NULL</b> then 
     *         <i>ComponentCount</i> can be greater than 4 and the described entry will be a gap in the stream out where no data will be written.
     */
    ComponentCount : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The associated stream output buffer that is bound to the pipeline 
     *         (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-sosettargets">ID3D11DeviceContext::SOSetTargets</a>). 
     *         The valid range for <i>OutputSlot</i> is 0 to 3.
     */
    OutputSlot : Int8

}
