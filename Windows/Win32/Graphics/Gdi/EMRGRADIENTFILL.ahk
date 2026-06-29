#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GRADIENT_FILL.ahk" { GRADIENT_FILL }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\EMR.ahk" { EMR }
#Import ".\TRIVERTEX.ahk" { TRIVERTEX }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRGRADIENTFILL structure contains members for the GradientFill enhanced metafile record.
 * @remarks
 * This is a variable-length structure. The <b>Ver</b> member designates the beginning of the variable-length area. First comes an array of <b>nVer</b> <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-trivertex">TRIVERTEX</a> structures to pass the vertices. Next comes an array of either <b>nTri</b> <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-gradient_triangle">GRADIENT_TRIANGLE</a> structures or <b>nTri</b> <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-gradient_rect">GRADIENT_RECT</a> structures, depending on the value of <b>ulMode</b> (triangles or rectangles).
 * 
 * This structure is to be used during metafile playback.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrgradientfill
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRGRADIENTFILL {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * The bounding rectangle, in device units.
     */
    rclBounds : RECTL

    /**
     * The number of vertices.
     */
    nVer : UInt32

    /**
     * The number of rectangles or triangles to be passed to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gradientfill">GradientFill</a>.
     */
    nTri : UInt32

    ulMode : GRADIENT_FILL

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-trivertex">TRIVERTEX</a> structures that each define a vertex.
     */
    Ver : TRIVERTEX[1]

}
