#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the region obtained by a hit test.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ns-dwrite-dwrite_hit_test_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_HIT_TEST_METRICS extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * Type: <b>UINT32</b>
     * 
     * The first text position within the hit region.
     * @type {Integer}
     */
    textPosition {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The number of text positions within the hit region.
     * @type {Integer}
     */
    length {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The x-coordinate of the upper-left corner of the hit region.
     * @type {Float}
     */
    left {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The y-coordinate of the upper-left corner of the hit region.
     * @type {Float}
     */
    top {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The width of the hit region.
     * @type {Float}
     */
    width {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The height of the hit region.
     * @type {Float}
     */
    height {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-analyzebidi">BIDI level</a> of the text positions within the hit region.
     * @type {Integer}
     */
    bidiLevel {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * true if the hit region contains text; otherwise, false.
     * @type {Integer}
     */
    isText {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * true if the text range is trimmed; otherwise, false.
     * @type {Integer}
     */
    isTrimmed {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
