#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The COLORADJUSTMENT structure defines the color adjustment values used by the StretchBlt and StretchDIBits functions when the stretch mode is HALFTONE. You can set the color adjustment values by calling the SetColorAdjustment function.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-coloradjustment
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct COLORADJUSTMENT {
    #StructPack 2

    /**
     * The size, in bytes, of the structure.
     */
    caSize : UInt16

    caFlags : UInt16

    caIlluminantIndex : UInt16

    /**
     * Specifies the <i>n</i><sup>th</sup> power gamma-correction value for the red primary of the source colors. The value must be in the range from 2500 to 65,000. A value of 10,000 means no gamma correction.
     */
    caRedGamma : UInt16

    /**
     * Specifies the <i>n</i><sup>th</sup> power gamma-correction value for the green primary of the source colors. The value must be in the range from 2500 to 65,000. A value of 10,000 means no gamma correction.
     */
    caGreenGamma : UInt16

    /**
     * Specifies the <i>n</i><sup>th</sup> power gamma-correction value for the blue primary of the source colors. The value must be in the range from 2500 to 65,000. A value of 10,000 means no gamma correction.
     */
    caBlueGamma : UInt16

    /**
     * The black reference for the source colors. Any colors that are darker than this are treated as black. The value must be in the range from 0 to 4000.
     */
    caReferenceBlack : UInt16

    /**
     * The white reference for the source colors. Any colors that are lighter than this are treated as white. The value must be in the range from 6000 to 10,000.
     */
    caReferenceWhite : UInt16

    /**
     * The amount of contrast to be applied to the source object. The value must be in the range from -100 to 100. A value of 0 means no contrast adjustment.
     */
    caContrast : Int16

    /**
     * The amount of brightness to be applied to the source object. The value must be in the range from -100 to 100. A value of 0 means no brightness adjustment.
     */
    caBrightness : Int16

    /**
     * The amount of colorfulness to be applied to the source object. The value must be in the range from -100 to 100. A value of 0 means no colorfulness adjustment.
     */
    caColorfulness : Int16

    /**
     * The amount of red or green tint adjustment to be applied to the source object. The value must be in the range from -100 to 100. Positive numbers adjust toward red and negative numbers adjust toward green. Zero means no tint adjustment.
     */
    caRedGreenTint : Int16

}
