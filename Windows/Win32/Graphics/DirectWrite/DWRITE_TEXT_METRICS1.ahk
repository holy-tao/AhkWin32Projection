#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DWRITE_TEXT_METRICS.ahk" { DWRITE_TEXT_METRICS }

/**
 * Contains the metrics associated with text after layout. (DWRITE_TEXT_METRICS1)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/ns-dwrite_2-dwrite_text_metrics1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_TEXT_METRICS1 {
    #StructPack 4

    Base : DWRITE_TEXT_METRICS

    /**
     * The height of the formatted text taking into account the trailing whitespace at the end of each line. This is
     *             pertinent for vertical text.
     */
    heightIncludingTrailingWhitespace : Float32

}
