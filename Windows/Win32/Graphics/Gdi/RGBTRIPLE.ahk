#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RGBTRIPLE structure describes a color consisting of relative intensities of red, green, and blue. The bmciColors member of the BITMAPCOREINFO structure consists of an array of RGBTRIPLE structures.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-rgbtriple
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct RGBTRIPLE {
    #StructPack 1

    /**
     * The intensity of blue in the color.
     */
    rgbtBlue : Int8

    /**
     * The intensity of green in the color.
     */
    rgbtGreen : Int8

    /**
     * The intensity of red in the color.
     */
    rgbtRed : Int8

}
