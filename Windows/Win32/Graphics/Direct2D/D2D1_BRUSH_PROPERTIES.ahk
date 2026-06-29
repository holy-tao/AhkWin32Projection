#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\D2D_MATRIX_3X2_F.ahk" { D2D_MATRIX_3X2_F }

/**
 * Describes the opacity and transformation of a brush.
 * @remarks
 * This structure is used when creating a brush. For convenience, Direct2D provides the <a href="https://docs.microsoft.com/windows/win32/api/d2d1helper/nf-d2d1helper-brushproperties">D2D1::BrushProperties</a> function for creating <b>D2D1_BRUSH_PROPERTIES</b> structures.
 * 
 * 
 * After creating a brush, you can change its opacity or transform by calling the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1brush-setopacity">SetOpacity</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1brush-settransform(constd2d1_matrix_3x2_f_)">SetTransform</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_brush_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_BRUSH_PROPERTIES {
    #StructPack 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value between 0.0f and 1.0f, inclusive, that specifies the degree of opacity of the brush.
     */
    opacity : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a></b>
     * 
     * The transformation that is applied to the brush.
     */
    transform : D2D_MATRIX_3X2_F

}
