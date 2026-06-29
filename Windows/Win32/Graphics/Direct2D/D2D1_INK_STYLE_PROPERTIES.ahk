#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_INK_NIB_SHAPE.ahk" { D2D1_INK_NIB_SHAPE }
#Import "Common\D2D_MATRIX_3X2_F.ahk" { D2D_MATRIX_3X2_F }

/**
 * Defines the general pen tip shape and the transform used in an ID2D1InkStyle object.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ns-d2d1_3-d2d1_ink_style_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_INK_STYLE_PROPERTIES {
    #StructPack 4

    /**
     * The pre-transform shape of the nib (pen tip) used to draw a given ink object.
     */
    nibShape : D2D1_INK_NIB_SHAPE

    /**
     * The transform applied to the nib.  Note that the translation components of the transform matrix are ignored for the purposes of rendering.
     */
    nibTransform : D2D_MATRIX_3X2_F

}
