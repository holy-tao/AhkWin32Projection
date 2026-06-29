#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LCSCSTYPE.ahk" { LCSCSTYPE }
#Import "..\..\Graphics\Gdi\CIEXYZ.ahk" { CIEXYZ }
#Import "..\..\Graphics\Gdi\CIEXYZTRIPLE.ahk" { CIEXYZTRIPLE }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The LOGCOLORSPACE structure contains information that defines a logical color space. (ANSI)
 * @remarks
 * Like palettes, but unlike pens and brushes, a pointer must be passed when creating a LogColorSpace.
 * 
 * If the <b>lcsCSType</b> member is set to LCS_sRGB or LCS_WINDOWS_COLOR_SPACE, the other members of this structure are ignored, and WCS uses the sRGB color space. The <b>lcsEndpoints,</b><b>lcsGammaRed, lcsGammaGreen,</b> and <b>lcsGammaBlue</b> members are used to describe the logical color space. The <b>lcsEndpoints</b> member is a <b>CIEXYZTRIPLE</b> that contains the x, y, and z values of the color space's RGB endpoint.
 * 
 * The required DWORD bit format for the <b>lcsGammaRed</b>, <b>lcsGammaGreen</b>, and <b>lcsGammaBlue</b> is an 8.8 fixed point integer left-shifted by 8 bits. This means 8 integer bits are followed by 8 fraction bits. Taking the bit shift into account, the required format of the 32-bit DWORD is:
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
 * If the lcsCSType member is set to LCS_sRGB or LCS_WINDOWS_COLOR_SPACE, the other members of this structure are ignored, and ICM uses the sRGB color space. Applications should still initialize the rest of the structure since CreateProfileFromLogColorSpace ignores lcsCSType member and uses lcsEndpoints, lcsGammaRed, lcsGammaGreen, lcsGammaBlue members to create a profile, which may not be initialized in case of LCS_sRGB or LCS_WINDOWS_COLOR_SPACE color spaces.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wingdi.h header defines LOGCOLORSPACE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-logcolorspacea
 * @namespace Windows.Win32.UI.ColorSystem
 * @charset ANSI
 */
export default struct LOGCOLORSPACEA {
    #StructPack 4

    /**
     * Color space signature. At present, this member should always be set to LCS_SIGNATURE.
     */
    lcsSignature : UInt32

    /**
     * Version number; must be 0x400.
     */
    lcsVersion : UInt32

    /**
     * Size of this structure, in bytes.
     */
    lcsSize : UInt32

    lcsCSType : LCSCSTYPE

    lcsIntent : Int32

    /**
     * Red, green, blue endpoints.
     */
    lcsEndpoints : CIEXYZTRIPLE

    /**
     * Scale of the red coordinate.
     */
    lcsGammaRed : UInt32

    /**
     * Scale of the green coordinate.
     */
    lcsGammaGreen : UInt32

    /**
     * Scale of the blue coordinate.
     */
    lcsGammaBlue : UInt32

    /**
     * A null-terminated string that names a color profile file. This member is typically set to zero, but may be used to set the color space to be exactly as specified by the color profile. This is useful for devices that input color values for a specific printer, or when using an installable image color matcher. If a color profile is specified, all other members of this structure should be set to reasonable values, even if the values are not completely accurate.
     */
    lcsFilename : CHAR[260]

}
