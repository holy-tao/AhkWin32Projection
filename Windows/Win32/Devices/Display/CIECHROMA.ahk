#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CIECHROMA structure is used to describe the chromaticity coordinates, x and y, and the luminance, Y in CIE color space.
 * @remarks
 * 
 * The CIECHROMA structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-colorinfo">COLORINFO</a> structure to define colors for <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-gdiinfo">GDIINFO</a>.
 * 
 * The LDECI4 type is used to represent real numbers to four decimal places. For example, (LDECI4) 10000 represents the real number 1.0000, and (LDECI4) -12345 represents -1.2345.
 * 
 * The values of the <b>x</b> and <b>y</b> members of CIECHROMA should be in the range from 0 through 10000--that is, the values should represent the numbers 0.0000 through 1.0000. 
 * 
 * The value of the <b>Y</b> member of this structure should be in the range from 0 through 100. This member can also be 65534 (0xFFFE) under certain circumstances. For more information about these circumstances, see <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-colorinfo">COLORINFO</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-ciechroma
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class CIECHROMA extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Specifies the x-coordinate in CIE chromaticity space.
     * @type {Integer}
     */
    x {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the y-coordinate in CIE chromaticity space.
     * @type {Integer}
     */
    y {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies the luminance. For more information, see the following Remarks section.
     * @type {Integer}
     */
    Y1 {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
