#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DWRITE_MATRIX structure specifies the graphics transform to be applied to rendered glyphs.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_MATRIX {
    #StructPack 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value indicating the horizontal scaling / cosine of rotation.
     */
    m11 : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value indicating the vertical shear / sine of rotation.
     */
    m12 : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value indicating the horizontal shear / negative sine of rotation.
     */
    m21 : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value indicating the vertical scaling / cosine of rotation.
     */
    m22 : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value indicating the horizontal shift (always orthogonal regardless of rotation).
     */
    dx : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value indicating the vertical shift (always orthogonal regardless of rotation.)
     */
    dy : Float32

}
