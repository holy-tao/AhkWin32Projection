#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CIECHROMA structure is used to describe the chromaticity coordinates, x and y, and the luminance, Y in CIE color space.
 * @remarks
 * The CIECHROMA structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-colorinfo">COLORINFO</a> structure to define colors for <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-gdiinfo">GDIINFO</a>.
 * 
 * The LDECI4 type is used to represent real numbers to four decimal places. For example, (LDECI4) 10000 represents the real number 1.0000, and (LDECI4) -12345 represents -1.2345.
 * 
 * The values of the <b>x</b> and <b>y</b> members of CIECHROMA should be in the range from 0 through 10000--that is, the values should represent the numbers 0.0000 through 1.0000. 
 * 
 * The value of the <b>Y</b> member of this structure should be in the range from 0 through 100. This member can also be 65534 (0xFFFE) under certain circumstances. For more information about these circumstances, see <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-colorinfo">COLORINFO</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-ciechroma
 * @namespace Windows.Win32.Devices.Display
 */
export default struct CIECHROMA {
    #StructPack 4

    /**
     * Specifies the x-coordinate in CIE chromaticity space.
     */
    x : Int32

    /**
     * Specifies the y-coordinate in CIE chromaticity space.
     */
    y : Int32

    /**
     * Specifies the luminance. For more information, see the following Remarks section.
     */
    Y1 : Int32

}
