#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_SVG_ASPECT_ALIGN.ahk" { D2D1_SVG_ASPECT_ALIGN }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D2D1_SVG_ASPECT_SCALING.ahk" { D2D1_SVG_ASPECT_SCALING }

/**
 * Represents all SVG preserveAspectRatio settings.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ns-d2d1svg-d2d1_svg_preserve_aspect_ratio
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_SVG_PRESERVE_ASPECT_RATIO {
    #StructPack 4

    /**
     * Sets the 'defer' portion of the preserveAspectRatio settings. This field only has an effect on an 'image' element that references another SVG document. As
     *           this is not currently supported, the field has no impact on rendering.
     */
    defer : BOOL

    /**
     * Sets the align portion of the preserveAspectRatio settings.
     */
    align : D2D1_SVG_ASPECT_ALIGN

    /**
     * Sets the meetOrSlice portion of the preserveAspectRatio settings.
     */
    meetOrSlice : D2D1_SVG_ASPECT_SCALING

}
