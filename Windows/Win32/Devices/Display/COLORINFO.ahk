#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CIECHROMA.ahk" { CIECHROMA }

/**
 * The COLORINFO structure defines a device's colors in CIE coordinate space.
 * @remarks
 * The LDECI4 type is used to represent real numbers to four decimal places. For example, (LDECI4) 10000 represents the real number 1.0000, and (LDECI4) -12345 represents -1.2345.
 * 
 * For a monochrome printer, if you set the luminance for the <b>Cyan</b> member (that is, <b>Cyan.Y</b>) to 65534 (0xFFFE), you can select any of the available halftone pattern sizes. To select a halftone pattern size for a monochrome printer, set the <b>ulHTPatternSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-gdiinfo">GDIINFO</a> structure to the halftone pattern size that you want. If <b>Cyan.Y</b> is not set to 65534 (0xFFFE), halftone pattern sizes other than HT_PATSIZE_8x8_M or HT_PATSIZE_8x8 are converted to HT_PATSIZE_DEFAULT.
 * 
 * Setting the <b>RedGamma</b>, <b>BlueGamma</b>, and <b>GreenGamma</b> members of this structure to 0xFFFF can affect color management in printers when <a href="https://docs.microsoft.com/windows-hardware/drivers/display/image-color-management">Image Color Management</a> (ICM) is disabled. In this situation, the GDI halftone module switches from performing its own color management to performing none, which potentially can cause a significant change in the resulting printer output. When ICM is enabled (and <b>RedGamma</b>, <b>BlueGamma</b>, and <b>GreenGamma</b> are set to 0XFFFF), there is no difference in color output. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/print/color-management-for-printers">Color Management for Printers</a>.
 * 
 * Any values in the COLORINFO structure that are out of the specified range default to the NTSC values.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-colorinfo
 * @namespace Windows.Win32.Devices.Display
 */
export default struct COLORINFO {
    #StructPack 4

    Red : CIECHROMA

    Green : CIECHROMA

    Blue : CIECHROMA

    Cyan : CIECHROMA

    Magenta : CIECHROMA

    Yellow : CIECHROMA

    /**
     * Specify <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-ciechroma">CIECHROMA</a> structures that each define the x-coordinate, y-coordinate, and Y-coordinate (luminance) of the named color.
     * 
     * The <b>Cyan</b> member can have a special meaning for monochrome printers. <b>Cyan.Y</b> must be set to 65534 (0xFFFE) to enable all of the grayscale halftone pattern sizes. For more information, see the following Remarks section.
     */
    AlignmentWhite : CIECHROMA

    RedGamma : Int32

    GreenGamma : Int32

    /**
     * Are the gamma corrections of display devices that permit the display device to display colors between the primary colors with accuracy. The values of these members should be in the range from 0 through 6.5535, which means that the numbers that are actually stored in these members must be in the range from 0 through 65535. For more information about these members and this data type, see the following Remarks section.
     */
    BlueGamma : Int32

    MagentaInCyanDye : Int32

    YellowInCyanDye : Int32

    CyanInMagentaDye : Int32

    YellowInMagentaDye : Int32

    CyanInYellowDye : Int32

    /**
     * Used for printing devices to describe color purity and concentration. Values should be between zero and one, which means that the numbers actually stored in these members must be in the range 0 through 10000. For more information about this data type, see the following Remarks section.
     */
    MagentaInYellowDye : Int32

}
