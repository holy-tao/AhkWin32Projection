#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The BITMAPCOREHEADER structure contains information about the dimensions and color format of a DIB.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapcoreinfo">BITMAPCOREINFO</a> structure combines the <b>BITMAPCOREHEADER</b> structure and a color table to provide a complete definition of the dimensions and colors of a DIB. For more information about specifying a DIB, see <b>BITMAPCOREINFO</b>.
  * 
  * An application should use the information stored in the <b>bcSize</b> member to locate the color table in a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapcoreinfo">BITMAPCOREINFO</a> structure, using a method such as the following:
  * 
  * 
  * ```cpp
  * 
  * pColor = ((LPBYTE) pBitmapCoreInfo + 
  *         (WORD) (pBitmapCoreInfo -> bcSize)) 
  * 
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-bitmapcoreheader
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class BITMAPCOREHEADER extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The number of bytes required by the structure.
     * @type {Integer}
     */
    bcSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The width of the bitmap, in pixels.
     * @type {Integer}
     */
    bcWidth {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The height of the bitmap, in pixels.
     * @type {Integer}
     */
    bcHeight {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * The number of planes for the target device. This value must be 1.
     * @type {Integer}
     */
    bcPlanes {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The number of bits-per-pixel. This value must be 1, 4, 8, or 24.
     * @type {Integer}
     */
    bcBitCount {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }
}
