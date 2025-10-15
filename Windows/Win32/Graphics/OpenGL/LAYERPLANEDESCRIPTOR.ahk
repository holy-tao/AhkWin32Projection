#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\COLORREF.ahk

/**
 * The LAYERPLANEDESCRIPTOR structure describes the pixel format of a drawing surface.
 * @remarks
 * 
  * Please notice, as documented above, that certain layer plane properties are not supported in the current implementation. The implementation is the Microsoft GDI software implementation of OpenGL. Hardware manufacturers that enhance parts of OpenGL may support some layer plane properties not supported by the generic implementation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-layerplanedescriptor
 * @namespace Windows.Win32.Graphics.OpenGL
 * @version v4.0.30319
 */
class LAYERPLANEDESCRIPTOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Specifies the size of this data structure. Set this value to <b>sizeof</b>(<b>LAYERPLANEDESCRIPTOR</b>).
     * @type {Integer}
     */
    nSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Specifies the version of this data structure. Set this value to 1.
     * @type {Integer}
     */
    nVersion {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

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
     * @type {Integer}
     */
    iPixelType {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Specifies the number of color bitplanes in each color buffer. For RGBA pixel types, it is the size of the color buffer, excluding the alpha bitplanes. For color-index pixels, it is the size of the color-index buffer.
     * @type {Integer}
     */
    cColorBits {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * Specifies the number of red bitplanes in each RGBA color buffer.
     * @type {Integer}
     */
    cRedBits {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * Specifies the shift count for red bitplanes in each RGBA color buffer.
     * @type {Integer}
     */
    cRedShift {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * Specifies the number of green bitplanes in each RGBA color buffer.
     * @type {Integer}
     */
    cGreenBits {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * Specifies the shift count for green bitplanes in each RGBA color buffer.
     * @type {Integer}
     */
    cGreenShift {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * Specifies the number of blue bitplanes in each RGBA color buffer.
     * @type {Integer}
     */
    cBlueBits {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * Specifies the shift count for blue bitplanes in each RGBA color buffer.
     * @type {Integer}
     */
    cBlueShift {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * Specifies the number of alpha bitplanes in each RGBA color buffer. Alpha bitplanes are not supported.
     * @type {Integer}
     */
    cAlphaBits {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * Specifies the shift count for alpha bitplanes in each RGBA color buffer. Alpha bitplanes are not supported.
     * @type {Integer}
     */
    cAlphaShift {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * Specifies the total number of bitplanes in the accumulation buffer.
     * @type {Integer}
     */
    cAccumBits {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * Specifies the number of red bitplanes in the accumulation buffer.
     * @type {Integer}
     */
    cAccumRedBits {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }

    /**
     * Specifies the number of green bitplanes in the accumulation buffer.
     * @type {Integer}
     */
    cAccumGreenBits {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * Specifies the number of blue bitplanes in the accumulation buffer.
     * @type {Integer}
     */
    cAccumBlueBits {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * Specifies the number of alpha bitplanes in the accumulation buffer.
     * @type {Integer}
     */
    cAccumAlphaBits {
        get => NumGet(this, 22, "char")
        set => NumPut("char", value, this, 22)
    }

    /**
     * Specifies the depth of the depth (z-axis) buffer.
     * @type {Integer}
     */
    cDepthBits {
        get => NumGet(this, 23, "char")
        set => NumPut("char", value, this, 23)
    }

    /**
     * Specifies the depth of the stencil buffer.
     * @type {Integer}
     */
    cStencilBits {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * Specifies the number of auxiliary buffers. Auxiliary buffers are not supported.
     * @type {Integer}
     */
    cAuxBuffers {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * 
     * @type {Integer}
     */
    iLayerPlane {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }

    /**
     * Not used. Must be zero.
     * @type {Integer}
     */
    bReserved {
        get => NumGet(this, 27, "char")
        set => NumPut("char", value, this, 27)
    }

    /**
     * When the LPD_TRANSPARENT flag is set, specifies the transparent color or index value. Typically the value is zero.
     * @type {COLORREF}
     */
    crTransparent{
        get {
            if(!this.HasProp("__crTransparent"))
                this.__crTransparent := COLORREF(this.ptr + 28)
            return this.__crTransparent
        }
    }
}
