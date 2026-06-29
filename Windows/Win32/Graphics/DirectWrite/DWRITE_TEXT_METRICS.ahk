#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the metrics associated with text after layout. (DWRITE_TEXT_METRICS)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_TEXT_METRICS {
    #StructPack 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the left-most point of formatted text relative to the layout box, 
     * 	  while excluding any glyph overhang.
     */
    left : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the top-most point of formatted text relative to the layout box, while excluding any glyph overhang.
     */
    top : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that indicates the width of the formatted text, while ignoring trailing whitespace 
     * 	  at the end of each line.
     */
    width : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The width of the formatted text, taking into account the 
     * 	  trailing whitespace at the end of each line.
     */
    widthIncludingTrailingWhitespace : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The height of the formatted text. The height of an empty string 
     * 	  is set to the same value as that of the default font.
     */
    height : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The initial width given to the layout. It can be either larger or smaller than the 
     * 	  text content width, depending on whether the text 
     * 	  was wrapped.
     */
    layoutWidth : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * Initial height given to the layout. Depending on the length of the text, it may be larger or smaller than the text content height.
     */
    layoutHeight : Float32

    /**
     * Type: <b>UINT32</b>
     * 
     * The maximum reordering count of any line of text, used 
     * 	  to calculate the most number of hit-testing boxes needed. 
     * 	  If the layout has no bidirectional text, or no text at all, 
     * 	  the minimum level is 1.
     */
    maxBidiReorderingDepth : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Total number of lines.
     */
    lineCount : UInt32

}
