#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Description of a vertex element in a vertex buffer in an output slot. (D3D10_SO_DECLARATION_ENTRY)
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_so_declaration_entry
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SO_DECLARATION_ENTRY {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Type of output element.  Possible values: "POSITION", "NORMAL", or "TEXCOORD0".
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
     * Which component of the entry to begin writing out to. Valid values are 0 ~ 3. For example, if you only wish to output to the y and z components of a position, then StartComponent should be 1 and ComponentCount should be 2.
     */
    StartComponent : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The number of components of the entry to write out to. Valid values are 1 ~ 4. For example, if you only wish to output to the y and z components of a position, then StartComponent should be 1 and ComponentCount should be 2.
     */
    ComponentCount : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The output slot that contains the vertex buffer that contains this output entry.
     */
    OutputSlot : Int8

}
