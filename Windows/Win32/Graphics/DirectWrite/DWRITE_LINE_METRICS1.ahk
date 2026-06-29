#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DWRITE_LINE_METRICS.ahk" { DWRITE_LINE_METRICS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information about a formatted line of text. (DWRITE_LINE_METRICS1)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_line_metrics1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_LINE_METRICS1 {
    #StructPack 4

    Base : DWRITE_LINE_METRICS

    /**
     * Type: <b>FLOAT</b>
     * 
     * White space before the content of the line. This is included in the line height and baseline distances.
     * If the line is formatted horizontally either with a uniform line spacing or with proportional
     * line spacing, this value represents the extra space above the content.
     */
    leadingBefore : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * White space after the content of the line. This is included in the height of the line.
     * If the line is formatted horizontally either with a uniform line spacing or with proportional
     * line spacing, this value represents the extra space below the content.
     */
    leadingAfter : Float32

}
