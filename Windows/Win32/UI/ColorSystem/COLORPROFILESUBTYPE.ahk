#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the subtype of the color profile.
 * @remarks
 * For a description of rendering intents, see [Rendering Intents](/windows/win32/wcs/rendering-intents).
  * 
  * The PCOLORPROFILESUBTYPE and LPCOLORPROFILESUBTYPE data types are defined as pointers to the **COLORPROFILESUBTYPE** enumeration:
  * 
  * `typedef COLORPROFILESUBTYPE *PCOLORPROFILESUBTYPE, *LPCOLORPROFILESUBTYPE;`
  * 
  * The valid profile type/subtype combinations are
  * 
  * ${ROWSPAN3}$ COLORPROFILETYPE<br/> ${REMOVE}$  
  * 
  * Valid COLORPROFILESUBTYPE<br/>
  * 
  * ${ROWSPAN3}$ Notes<br/> ${REMOVE}$  
  * 
  * default for a device<br/>
  * 
  * global default<br/>
  * 
  * Intended Usage<br/>
  * 
  * Intended Usage<br/>
  * 
  * CPT\_ICC<br/>
  * 
  * CPST\_NONE<br/>
  * 
  * Get/Set default ICC profile associated with a device<br/>
  * 
  * CPST\_RGBWorkingSpace or CPST\_CustomWorkingSpace<br/>
  * 
  * Get/Set ICC profile as global RGB or custom working space<br/>
  * 
  * CPT\_DMP<br/>
  * 
  * CPST\_NONE<br/>
  * 
  * Get/Set default DMP profile associated with a device<br/>
  * 
  * CPST\_RGBWorkingSpace or CPST\_CustomWorkingSpace<br/>
  * 
  * Get/Set DMP as global RGB or custom working space<br/>
  * 
  * CPT\_CAMP<br/>
  * 
  * CPST\_NONE<br/>
  * 
  * Get/Set default CAMP profile associated with a device<br/>
  * 
  * CPST\_NONE<br/>
  * 
  * Get/Set CAMP profile as global color appearance profile<br/>
  * 
  * CPT\_GMMP<br/>
  * 
  * CPST\_NONE<br/>
  * 
  * Get/Set default GMMP profile associated with a device<br/>
  * 
  * CPST\_Perceptual or<br/> CPST\_Absolute\_colorimetric or<br/> CPST\_Relative\_colorimetric or<br/> CPTS\_Saturation<br/>
  * 
  * Get/Set GMMP as global gamut map model profile for a specific rendering intent as described by that subtype to be used in CreateMultiProfileTransform API when resolving the rendering intent array in WCS transform.<br/>
  * 
  * COLORPROFILESUBTYPE Global default can be or?d with WCS\_DEFAULT to set this GMMP as the global default for use in OpenColorProfile or WcsOpenColorProfile where GMMP is **NULL**.<br/>
 * @see https://learn.microsoft.com/windows/win32/api/icm/ne-icm-colorprofilesubtype
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class COLORPROFILESUBTYPE{

    /**
     * A perceptual rendering intent for gamut map model profiles (GMMPs) defined in WCS.
     * @type {Integer (Int32)}
     */
    static CPST_PERCEPTUAL => 0

    /**
     * A relative colorimetric rendering intent for GMMPs defined in WCS.
     * @type {Integer (Int32)}
     */
    static CPST_RELATIVE_COLORIMETRIC => 1

    /**
     * A saturation rendering intent for GMMPs defined in WCS.
     * @type {Integer (Int32)}
     */
    static CPST_SATURATION => 2

    /**
     * An absolute colorimetric rendering intent for GMMPs defined in WCS.
     * @type {Integer (Int32)}
     */
    static CPST_ABSOLUTE_COLORIMETRIC => 3

    /**
     * The color profile subtype is not applicable to the selected color profile type.
     * @type {Integer (Int32)}
     */
    static CPST_NONE => 4

    /**
     * The RGB color working space for International Color Consortium (ICC) profiles or device model profiles (DMPs) defined in WCS.
     * @type {Integer (Int32)}
     */
    static CPST_RGB_WORKING_SPACE => 5

    /**
     * A custom color working space.
     * @type {Integer (Int32)}
     */
    static CPST_CUSTOM_WORKING_SPACE => 6

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static CPST_STANDARD_DISPLAY_COLOR_MODE => 7

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static CPST_EXTENDED_DISPLAY_COLOR_MODE => 8
}
