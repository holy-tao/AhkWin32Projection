#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DWRITE_SCRIPT_SHAPES.ahk" { DWRITE_SCRIPT_SHAPES }

/**
 * Stores the association of text and its writing system script, as well as some display attributes.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_script_analysis
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_SCRIPT_ANALYSIS {
    #StructPack 4

    /**
     * Type: <b>UINT16</b>
     * 
     * The zero-based index representation of writing system script.
     */
    script : UInt16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_script_shapes">DWRITE_SCRIPT_SHAPES</a></b>
     * 
     * A value that indicates additional shaping requirement of text.
     */
    shapes : DWRITE_SCRIPT_SHAPES

}
