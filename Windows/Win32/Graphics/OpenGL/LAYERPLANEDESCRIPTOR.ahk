#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * The LAYERPLANEDESCRIPTOR structure describes the pixel format of a drawing surface.
 * @remarks
 * Please notice, as documented above, that certain layer plane properties are not supported in the current implementation. The implementation is the Microsoft GDI software implementation of OpenGL. Hardware manufacturers that enhance parts of OpenGL may support some layer plane properties not supported by the generic implementation.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-layerplanedescriptor
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct LAYERPLANEDESCRIPTOR {
    #StructPack 4

    /**
     * Specifies the size of this data structure. Set this value to <b>sizeof</b>(<b>LAYERPLANEDESCRIPTOR</b>).
     */
    nSize : UInt16

    /**
     * Specifies the version of this data structure. Set this value to 1.
     */
    nVersion : UInt16

    /**
     * A set of bit flags that specify properties of the layer plane. The properties are generally not mutually exclusive; any combination of bit flags can be set, with the exceptions noted. The following bit flag constants are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>LPD_SUPPORT_OPENGL</td>
     * <td>The layer plane supports OpenGL drawing.</td>
     * </tr>
     * <tr>
     * <td>LPD_SUPPORT_GDI</td>
     * <td>The layer plane supports GDI drawing. The current implementation of OpenGL doesn't support this flag.</td>
     * </tr>
     * <tr>
     * <td>LPD_DOUBLEBUFFER</td>
     * <td>The layer plane is double-buffered. A layer plane can be double-buffered even when the main plane is single-buffered and vice versa.</td>
     * </tr>
     * <tr>
     * <td>LPD_STEREO</td>
     * <td>The layer plane is stereoscopic. A layer plane can be stereoscopic even when the main plane is monoscopic and vice versa.</td>
     * </tr>
     * <tr>
     * <td>LPD_SWAP_EXCHANGE</td>
     * <td>In a double-buffered layer plane, swapping the color buffer exchanges the front buffer and back buffer contents. The back buffer then contains the contents of the front buffer before the swap. This flag is a hint only and might not be provided by a driver.</td>
     * </tr>
     * <tr>
     * <td>LPD_SWAP_COPY</td>
     * <td>In a double-buffered layer plane, swapping the color buffer copies the back buffer contents to the front buffer. The swap does not affect the back buffer contents. This flag is a hint only and might not be provided by a driver.</td>
     * </tr>
     * <tr>
     * <td>LPD_TRANSPARENT</td>
     * <td>The <b>crTransparent</b> member of this structure contains a transparent color or index value that enables underlying layers to show through this layer. All layer planes, except the lowest-numbered underlay layer, have a transparent color or index.</td>
     * </tr>
     * <tr>
     * <td>LPD_SHARE_DEPTH</td>
     * <td>The layer plane shares the depth buffer with the main plane.</td>
     * </tr>
     * <tr>
     * <td>LPD_SHARE_STENCIL</td>
     * <td>The layer plane shares the stencil buffer with the main plane.</td>
     * </tr>
     * <tr>
     * <td>LPD_SHARE_ACCUM</td>
     * <td>The layer plane shares the accumulation buffer with the main plane.</td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Specifies the type of pixel data. The following types are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>LPD_TYPE_RGBA</td>
     * <td>RGBA pixels. Each pixel has four components: red, green, blue, and alpha.</td>
     * </tr>
     * <tr>
     * <td>LPD_TYPE_COLORINDEX</td>
     * <td>Color-index pixels. Each pixel uses a color-index value.</td>
     * </tr>
     * </table>
     */
    iPixelType : Int8

    /**
     * Specifies the number of color bitplanes in each color buffer. For RGBA pixel types, it is the size of the color buffer, excluding the alpha bitplanes. For color-index pixels, it is the size of the color-index buffer.
     */
    cColorBits : Int8

    /**
     * Specifies the number of red bitplanes in each RGBA color buffer.
     */
    cRedBits : Int8

    /**
     * Specifies the shift count for red bitplanes in each RGBA color buffer.
     */
    cRedShift : Int8

    /**
     * Specifies the number of green bitplanes in each RGBA color buffer.
     */
    cGreenBits : Int8

    /**
     * Specifies the shift count for green bitplanes in each RGBA color buffer.
     */
    cGreenShift : Int8

    /**
     * Specifies the number of blue bitplanes in each RGBA color buffer.
     */
    cBlueBits : Int8

    /**
     * Specifies the shift count for blue bitplanes in each RGBA color buffer.
     */
    cBlueShift : Int8

    /**
     * Specifies the number of alpha bitplanes in each RGBA color buffer. Alpha bitplanes are not supported.
     */
    cAlphaBits : Int8

    /**
     * Specifies the shift count for alpha bitplanes in each RGBA color buffer. Alpha bitplanes are not supported.
     */
    cAlphaShift : Int8

    /**
     * Specifies the total number of bitplanes in the accumulation buffer.
     */
    cAccumBits : Int8

    /**
     * Specifies the number of red bitplanes in the accumulation buffer.
     */
    cAccumRedBits : Int8

    /**
     * Specifies the number of green bitplanes in the accumulation buffer.
     */
    cAccumGreenBits : Int8

    /**
     * Specifies the number of blue bitplanes in the accumulation buffer.
     */
    cAccumBlueBits : Int8

    /**
     * Specifies the number of alpha bitplanes in the accumulation buffer.
     */
    cAccumAlphaBits : Int8

    /**
     * Specifies the depth of the depth (z-axis) buffer.
     */
    cDepthBits : Int8

    /**
     * Specifies the depth of the stencil buffer.
     */
    cStencilBits : Int8

    /**
     * Specifies the number of auxiliary buffers. Auxiliary buffers are not supported.
     */
    cAuxBuffers : Int8

    iLayerPlane : Int8

    /**
     * Not used. Must be zero.
     */
    bReserved : Int8

    /**
     * When the LPD_TRANSPARENT flag is set, specifies the transparent color or index value. Typically the value is zero.
     */
    crTransparent : COLORREF

}
