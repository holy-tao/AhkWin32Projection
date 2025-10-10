#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The BITMAPFILEHEADER structure contains information about the type, size, and layout of a file that contains a DIB.
 * @remarks
 * 
  * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapcoreinfo">BITMAPCOREINFO</a> structure immediately follows the <b>BITMAPFILEHEADER</b> structure in the DIB file. For more information, see <a href="https://docs.microsoft.com/windows/desktop/gdi/bitmap-storage">Bitmap Storage</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-bitmapfileheader
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class BITMAPFILEHEADER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The file type; must be BM.
     * @type {Integer}
     */
    bfType {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The size, in bytes, of the bitmap file.
     * @type {Integer}
     */
    bfSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved; must be zero.
     * @type {Integer}
     */
    bfReserved1 {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Reserved; must be zero.
     * @type {Integer}
     */
    bfReserved2 {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The offset, in bytes, from the beginning of the <b>BITMAPFILEHEADER</b> structure to the bitmap bits.
     * @type {Integer}
     */
    bfOffBits {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
