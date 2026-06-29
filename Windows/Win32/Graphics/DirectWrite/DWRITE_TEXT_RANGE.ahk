#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a range of text positions where format is applied in the text represented by an IDWriteTextLayout object.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_TEXT_RANGE {
    #StructPack 4

    /**
     * Type: <b>UINT32</b>
     * 
     * The start position of the text range.
     */
    startPosition : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * The number positions in the text range.
     */
    length : UInt32

}
