#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a JPEG AC huffman table.
 * @see https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-jpeg-ac-huffman-table
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */
export default struct DXGI_JPEG_AC_HUFFMAN_TABLE {
    #StructPack 1

    /**
     * The number of codes for each code length.
     */
    CodeCounts : Int8[16]

    /**
     * The Huffman code values, in order of increasing code length.
     */
    CodeValues : Int8[162]

}
