#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RGBQUAD structure describes a color consisting of relative intensities of red, green, and blue.
 * @remarks
 * The <b>bmiColors</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure consists of an array of <b>RGBQUAD</b> structures.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-rgbquad
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct RGBQUAD {
    #StructPack 1

    /**
     * The intensity of blue in the color.
     */
    rgbBlue : Int8

    /**
     * The intensity of green in the color.
     */
    rgbGreen : Int8

    /**
     * The intensity of red in the color.
     */
    rgbRed : Int8

    /**
     * This member is reserved and must be zero.
     */
    rgbReserved : Int8

}
