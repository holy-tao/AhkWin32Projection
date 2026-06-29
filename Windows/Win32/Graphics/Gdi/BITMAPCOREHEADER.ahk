#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct BITMAPCOREHEADER {
    #StructPack 4

    /**
     * The number of bytes required by the structure.
     */
    bcSize : UInt32

    /**
     * The width of the bitmap, in pixels.
     */
    bcWidth : UInt16

    /**
     * The height of the bitmap, in pixels.
     */
    bcHeight : UInt16

    /**
     * The number of planes for the target device. This value must be 1.
     */
    bcPlanes : UInt16

    /**
     * The number of bits-per-pixel. This value must be 1, 4, 8, or 24.
     */
    bcBitCount : UInt16

}
