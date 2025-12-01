#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDCOLORCONTROL structure defines the color controls associated with a Microsoft DirectDraw [*video port extensions (VPE)*](/windows-hardware/drivers/display/video-port-extensions-to-directx) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddcolorcontrol
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDCOLORCONTROL extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Specifies the size in bytes of this DDCOLORCONTROL structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates a set of flags that specify what structure members contain valid data. When the structure is returned by [*DdVideoPortColorControl*](https://msdn.microsoft.com/library/ff550383\(v=vs.85\)), it also indicates what options are supported by the VPE object. This member can be a bitwise OR of the values listed in the following table.
     * 
     * <table>
     * <colgroup>
     * <col style="width: 50%" />
     * <col style="width: 50%" />
     * </colgroup>
     * <thead>
     * <tr class="header">
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * </thead>
     * <tbody>
     * <tr class="odd">
     * <td><p>DDCOLOR_BRIGHTNESS</p></td>
     * <td><p>The <strong>lBrightness</strong> member contains valid data.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDCOLOR_CONTRAST</p></td>
     * <td><p>The <strong>lContrast</strong> member contains valid data.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><p>DDCOLOR_COLORENABLE</p></td>
     * <td><p>The <strong>lColorEnable</strong> member contains valid data.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDCOLOR_GAMMA</p></td>
     * <td><p>The <strong>lGamma</strong> member contains valid data.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><p>DDCOLOR_HUE</p></td>
     * <td><p>The <strong>lHue</strong> member contains valid data.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDCOLOR_SATURATION</p></td>
     * <td><p>The <strong>lSaturation</strong> member contains valid data.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><p>DDCOLOR_SHARPNESS</p></td>
     * <td><p>The <strong>lSharpness</strong> member contains valid data.</p></td>
     * </tr>
     * </tbody>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the luminance intensity (Black Level), in IRE units\*100. This member can range from 0 to 10,000, with a default value of 750 (7.5 IRE).
     * @type {Integer}
     */
    lBrightness {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Specifies the relative difference between higher and lower intensity luminance values, in IRE units\*100. This member can range from 0 to 20,000, with a default value of 10,000 (100 IRE). Higher values of contrast cause darker luminance values to tend toward black, and cause lighter luminance values to tend toward white. Lower values of contrast cause all luminance values to move toward the middle luminance values.
     * @type {Integer}
     */
    lContrast {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Specifies the phase relationship of the chrominance components. Hue is specified in degrees, with a valid range of -180 to 180. The default is 0 degrees.
     * @type {Integer}
     */
    lHue {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Specifies the color intensity, in IRE units\*100. This member can range from 0 to 20,000, with a default value of 10,000 (100 IRE).
     * @type {Integer}
     */
    lSaturation {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Specifies the sharpness in arbitrary units. The valid range is 0 to 10, with a default value of 5.
     * @type {Integer}
     */
    lSharpness {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Controls the amount of gamma correction applied to the luminance values. The valid range is 1 to 500 gamma units, with a default of 1.
     * @type {Integer}
     */
    lGamma {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Specifies a flag indicating whether color is used. If this member is zero, color is not used; if it is 1, then color is used. The default value is 1.
     * @type {Integer}
     */
    lColorEnable {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Reserved for system use, and should be ignored.
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
