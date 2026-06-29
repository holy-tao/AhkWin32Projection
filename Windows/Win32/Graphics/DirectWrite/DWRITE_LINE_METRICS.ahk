#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information about a formatted line of text. (DWRITE_LINE_METRICS)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_line_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_LINE_METRICS {
    #StructPack 4

    /**
     * Type: <b>UINT32</b>
     * 
     * The number of text positions in the text line. 
     * 	  This includes any trailing whitespace and newline characters.
     */
    length : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * The number of whitespace positions at the end of the text line. 
     * 	  Newline sequences are considered whitespace.
     */
    trailingWhitespaceLength : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * The number of characters in the newline sequence at the end of the text line. 
     * 	  If the count is zero, then the text line was either wrapped or it is the end of the text.
     */
    newlineLength : UInt32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The height of the text line.
     */
    height : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The distance from the top of the text line to its baseline.
     */
    baseline : Float32

    /**
     * Type: <b>BOOL</b>
     * 
     * The line is trimmed.
     */
    isTrimmed : BOOL

}
