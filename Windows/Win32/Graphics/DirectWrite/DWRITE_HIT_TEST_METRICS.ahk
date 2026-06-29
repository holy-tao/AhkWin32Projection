#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes the region obtained by a hit test.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_hit_test_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_HIT_TEST_METRICS {
    #StructPack 4

    /**
     * Type: <b>UINT32</b>
     * 
     * The first text position within the hit region.
     */
    textPosition : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * The number of text positions within the hit region.
     */
    length : UInt32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The x-coordinate of the upper-left corner of the hit region.
     */
    left : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The y-coordinate of the upper-left corner of the hit region.
     */
    top : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The width of the hit region.
     */
    width : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The height of the hit region.
     */
    height : Float32

    /**
     * Type: <b>UINT32</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-analyzebidi">BIDI level</a> of the text positions within the hit region.
     */
    bidiLevel : UInt32

    /**
     * Type: <b>BOOL</b>
     * 
     * true if the hit region contains text; otherwise, false.
     */
    isText : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * true if the text range is trimmed; otherwise, false.
     */
    isTrimmed : BOOL

}
