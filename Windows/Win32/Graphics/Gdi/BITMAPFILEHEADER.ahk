#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The BITMAPFILEHEADER structure contains information about the type, size, and layout of a file that contains a DIB.
 * @remarks
 * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapcoreinfo">BITMAPCOREINFO</a> structure immediately follows the <b>BITMAPFILEHEADER</b> structure in the DIB file. For more information, see <a href="https://docs.microsoft.com/windows/desktop/gdi/bitmap-storage">Bitmap Storage</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-bitmapfileheader
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct BITMAPFILEHEADER {
    #StructPack 4

    /**
     * The file type; must be BM.
     */
    bfType : UInt16

    /**
     * The size, in bytes, of the bitmap file.
     */
    bfSize : UInt32

    /**
     * Reserved; must be zero.
     */
    bfReserved1 : UInt16

    /**
     * Reserved; must be zero.
     */
    bfReserved2 : UInt16

    /**
     * The offset, in bytes, from the beginning of the <b>BITMAPFILEHEADER</b> structure to the bitmap bits.
     */
    bfOffBits : UInt32

}
