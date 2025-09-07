#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of color profile.
 * @remarks
 * The PCOLORPROFILETYPE and LPCOLORPROFILETYPE data types are defined as pointers to this enumeration:
  * 
  * `typedef COLORPROFILETYPE *PCOLORPROFILETYPE, *LPCOLORPROFILETYPE;`
 * @see https://learn.microsoft.com/windows/win32/api/icm/ne-icm-colorprofiletype
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class COLORPROFILETYPE{

    /**
     * An International Color Consortium (ICC) profile. If you specify this value, only the CPST\_RGB\_WORKING\_SPACE and CPST\_CUSTOM\_WORKING\_SPACE values of [**COLORPROFILESUBTYPE**](/windows/win32/api/icm/ne-icm-colorprofilesubtype) are valid.
     * @type {Integer (Int32)}
     */
    static CPT_ICC => 0

    /**
     * A device model profile (DMP) defined in WCS. If you specify this value, only the CPST\_RGB\_WORKING\_SPACE and CPST\_CUSTOM\_WORKING\_SPACE values of [**COLORPROFILESUBTYPE**](/windows/win32/api/icm/ne-icm-colorprofilesubtype) are valid.
     * @type {Integer (Int32)}
     */
    static CPT_DMP => 1

    /**
     * A color appearance model profile (CAMP) defined in WCS. If you specify this value, only the CPST\_NONE value of [**COLORPROFILESUBTYPE**](/windows/win32/api/icm/ne-icm-colorprofilesubtype) is valid.
     * @type {Integer (Int32)}
     */
    static CPT_CAMP => 2

    /**
     * Specifies a WCS gamut map model profile (GMMP). If this value is specified, only the CPST\_PERCEPTUAL, CPST\_SATURATION, CPST\_RELATIVE\_COLORIMETRIC, and CPST\_ABSOLUTE\_COLORIMETRIC values of [**COLORPROFILESUBTYPE**](/windows/win32/api/icm/ne-icm-colorprofilesubtype) are valid. Any of these values may optionally be combined (in a bitwise **OR** operation) with CPST\_DEFAULT.
     * @type {Integer (Int32)}
     */
    static CPT_GMMP => 3
}
