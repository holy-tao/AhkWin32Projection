#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\CIEXYZ.ahk
#Include ..\..\Graphics\Gdi\CIEXYZTRIPLE.ahk

/**
 * The LOGCOLORSPACE structure contains information that defines a logical color space.
 * @remarks
 * 
 * Like palettes, but unlike pens and brushes, a pointer must be passed when creating a LogColorSpace.
 * 
 * If the <b>lcsCSType</b> member is set to LCS_sRGB or LCS_WINDOWS_COLOR_SPACE, the other members of this structure are ignored, and WCS uses the sRGB color space. The <b>lcsEndpoints,</b><b>lcsGammaRed, lcsGammaGreen,</b> and <b>lcsGammaBlue</b> members are used to describe the logical color space. The <b>lcsEndpoints</b> member is a <b>CIEXYZTRIPLE</b> that contains the x, y, and z values of the color space's RGB endpoint.
 * 
 * The required DWORD bit format for the <b>lcsGammaRed</b>, <b>lcsGammaGreen</b>, and <b>lcsGammaBlue</b> is an 8.8 fixed point interger left-shifted by 8 bits. This means 8 interger bits are followed by 8 fraction bits. Taking the bit shift into account, the required format of the 32-bit DWORD is:
 * 
 * 00000000nnnnnnnnffffffff00000000
 * 
 * Whenever the <b>lcsFilename</b> member contains a file name and the <b>lcsCSType</b> member is set to LCS_CALIBRATED_RGB, WCS ignores the other members of this structure. It uses the color space in the file as the color space to which this <b>LOGCOLORSPACE</b> structure refers.
 * 
 * The relation between tri-stimulus values X,Y,Z and chromaticity values x,y,z is as follows:
 * 
 * x = X/(X+Y+Z)
 * 
 * y = Y/(X+Y+Z)
 * 
 * z = Z/(X+Y+Z)
 * 
 * If the lcsCSType member is set to LCS_sRGB or LCS_WINDOWS_COLOR_SPACE, the other members of this structure are ignored, and ICM uses the sRGB color space. Appliations should still initialize the rest of the structure since CreateProfileFromLogColorSpace ignores lcsCSType member and uses lcsEndpoints, lcsGammaRed, lcsGammaGreen, lcsGammaBlue members to create a profile, which may not be initialized in case of LCS_sRGB or LCS_WINDOWS_COLOR_SPACE color spaces.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wingdi.h header defines LOGCOLORSPACE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-logcolorspacew
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 * @charset Unicode
 */
class LOGCOLORSPACEW extends Win32Struct
{
    static sizeof => 608

    static packingSize => 8

    /**
     * Color space signature. At present, this member should always be set to LCS_SIGNATURE.
     * @type {Integer}
     */
    lcsSignature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Version number; must be 0x400.
     * @type {Integer}
     */
    lcsVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of this structure, in bytes.
     * @type {Integer}
     */
    lcsSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    lcsCSType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * 
     * @type {Integer}
     */
    lcsIntent {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Red, green, blue endpoints.
     * @type {CIEXYZTRIPLE}
     */
    lcsEndpoints{
        get {
            if(!this.HasProp("__lcsEndpoints"))
                this.__lcsEndpoints := CIEXYZTRIPLE(24, this)
            return this.__lcsEndpoints
        }
    }

    /**
     * Scale of the red coordinate.
     * @type {Integer}
     */
    lcsGammaRed {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Scale of the green coordinate.
     * @type {Integer}
     */
    lcsGammaGreen {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Scale of the blue coordinate.
     * @type {Integer}
     */
    lcsGammaBlue {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * A null-terminated string that names a color profile file. This member is typically set to zero, but may be used to set the color space to be exactly as specified by the color profile. This is useful for devices that input color values for a specific printer, or when using an installable image color matcher. If a color profile is specified, all other members of this structure should be set to reasonable values, even if the values are not completely accurate.
     * @type {String}
     */
    lcsFilename {
        get => StrGet(this.ptr + 84, 259, "UTF-16")
        set => StrPut(value, this.ptr + 84, 259, "UTF-16")
    }
}
