#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PIXELFORMATDESCRIPTOR structure describes the pixel format of a drawing surface.
 * @remarks
 * 
  * Please notice carefully, as documented above, that certain pixel format properties are not supported in the current generic implementation. The generic implementation is the Microsoft GDI software implementation of OpenGL. Hardware manufacturers may enhance parts of OpenGL, and may support some pixel format properties not supported by the generic implementation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-pixelformatdescriptor
 * @namespace Windows.Win32.Graphics.OpenGL
 * @version v4.0.30319
 */
class PIXELFORMATDESCRIPTOR extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Specifies the size of this data structure. This value should be set to <b>sizeof</b>(<b>PIXELFORMATDESCRIPTOR</b>).
     * @type {Integer}
     */
    nSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Specifies the version of this data structure. This value should be set to 1.
     * @type {Integer}
     */
    nVersion {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * A set of bit flags that specify properties of the pixel buffer. The properties are generally not mutually exclusive; you can set any combination of bit flags, with the exceptions noted. The following bit flag constants are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>PFD_DRAW_TO_WINDOW</b>
     * <dt>0x00000004</dt>
     * </td>
     * <td>The buffer can draw to a window or device surface.</td>
     * </tr>
     * <tr>
     * <td><b>PFD_DRAW_TO_BITMAP</b>
     * <dt>0x00000008</dt>
     * </td>
     * <td>The buffer can draw to a memory bitmap.</td>
     * </tr>
     * <tr>
     * <td><b>PFD_SUPPORT_GDI</b>
     * <dt>0x00000010</dt> 
     * </td>
     * <td>The buffer supports GDI drawing. This flag and PFD_DOUBLEBUFFER are mutually exclusive in the current generic implementation.</td>
     * </tr>
     * <tr>
     * <td><b>PFD_SUPPORT_OPENGL</b>
     * <dt>0x00000020</dt>
     * </td>
     * <td>The buffer supports OpenGL drawing.</td>
     * </tr>
     * <tr>
     * <td><b>PFD_GENERIC_ACCELERATED</b>
     * <dt>0x00001000</dt>
     * </td>
     * <td>The pixel format is supported by a device driver that accelerates the generic implementation. If this flag is clear and the PFD_GENERIC_FORMAT flag is set, the pixel format is supported by the generic implementation only.</td>
     * </tr>
     * <tr>
     * <td><b>PFD_GENERIC_FORMAT</b>
     * <dt>0x00000040</dt>
     * </td>
     * <td>The pixel format is supported by the GDI software implementation, which is also known as the generic implementation. If this bit is clear, the pixel format is supported by a device driver or hardware.</td>
     * </tr>
     * <tr>
     * <td><b>PFD_NEED_PALETTE</b>
     * <dt>0x00000080</dt>
     * </td>
     * <td>The buffer uses RGBA pixels on a palette-managed device. A logical palette is required to achieve the best results for this pixel type. Colors in the palette should be specified according to the values of the <b>cRedBits</b>, <b>cRedShift</b>, <b>cGreenBits</b>, <b>cGreenShift</b>, <b>cBluebits</b>, and <b>cBlueShift</b> members. The palette should be created and realized in the device context before calling <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-wglmakecurrent">wglMakeCurrent</a>.</td>
     * </tr>
     * <tr>
     * <td><b>PFD_NEED_SYSTEM_PALETTE</b>
     * <dt>0x00000100</dt>
     * </td>
     * <td>Defined in the pixel format descriptors of hardware that supports one hardware palette in 256-color mode only. For such systems to use hardware acceleration, the hardware palette must be in a fixed order (for example, 3-3-2) when in RGBA mode or must match the logical palette when in color-index mode.When this flag is set, you must call <b>SetSystemPaletteUse</b> in your program to force a one-to-one mapping of the logical palette and the system palette. If your OpenGL hardware supports multiple hardware palettes and the device driver can allocate spare hardware palettes for OpenGL, this flag is typically clear.
     * 
     * This flag is not set in the generic pixel formats.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>PFD_DOUBLEBUFFER</b>
     * <dt>0x00000001</dt>
     * </td>
     * <td>The buffer is double-buffered. This flag and PFD_SUPPORT_GDI are mutually exclusive in the current generic implementation.</td>
     * </tr>
     * <tr>
     * <td><b>PFD_STEREO</b>
     * <dt>0x00000002</dt>
     * </td>
     * <td>The buffer is stereoscopic. This flag is not supported in the current generic implementation.</td>
     * </tr>
     * <tr>
     * <td><b>PFD_SWAP_LAYER_BUFFERS</b>
     * <dt>0x00000800</dt>
     * </td>
     * <td>Indicates whether a device can swap individual layer planes with pixel formats that include double-buffered overlay or underlay planes. Otherwise all layer planes are swapped together as a group. When this flag is set, <b>wglSwapLayerBuffers</b> is supported.</td>
     * </tr>
     * </table>
     *  
     * 
     * You can specify the following bit flags when calling <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-choosepixelformat">ChoosePixelFormat</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>PFD_DEPTH_DONTCARE</b>
     * <dt>0x20000000</dt>
     * </td>
     * <td>The requested pixel format can either have or not have a depth buffer. To select a pixel format without a depth buffer, you must specify this flag. The requested pixel format can be with or without a depth buffer. Otherwise, only pixel formats with a depth buffer are considered.</td>
     * </tr>
     * <tr>
     * <td><b>PFD_DOUBLEBUFFER_DONTCARE</b>
     * <dt>0x40000000</dt>
     * </td>
     * <td>The requested pixel format can be either single- or double-buffered.</td>
     * </tr>
     * <tr>
     * <td><b>PFD_STEREO_DONTCARE</b>
     * <dt>0x80000000</dt>
     * </td>
     * <td>The requested pixel format can be either monoscopic or stereoscopic.</td>
     * </tr>
     * </table>
     *  
     * 
     * With the <b>glAddSwapHintRectWIN</b> extension function, two new flags are included for the <b>PIXELFORMATDESCRIPTOR</b> pixel format structure.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>PFD_SWAP_COPY</b>
     * <dt>0x00000400</dt>
     * </td>
     * <td>Specifies the content of the back buffer in the double-buffered main color plane following a buffer swap. Swapping the color buffers causes the content of the back buffer to be copied to the front buffer. The content of the back buffer is not affected by the swap. PFD_SWAP_COPY is a hint only and might not be provided by a driver.</td>
     * </tr>
     * <tr>
     * <td><b>PFD_SWAP_EXCHANGE</b>
     * <dt>0x00000200</dt>
     * </td>
     * <td>Specifies the content of the back buffer in the double-buffered main color plane following a buffer swap. Swapping the color buffers causes the exchange of the back buffer's content with the front buffer's content. Following the swap, the back buffer's content contains the front buffer's content before the swap. PFD_SWAP_EXCHANGE is a hint only and might not be provided by a driver.</td>
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
     * <td><b>PFD_TYPE_RGBA</b>
     * <dt>0</dt>
     * </td>
     * <td>RGBA pixels. Each pixel has four components in this order: red, green, blue, and alpha.</td>
     * </tr>
     * <tr>
     * <td><b>PFD_TYPE_COLORINDEX</b>
     * <dt>1</dt>
     * </td>
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
     * Ignored. Earlier implementations of OpenGL used this member, but it is no longer used.
     * @type {Integer}
     */
    iLayerType {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }

    /**
     * Specifies the number of overlay and underlay planes. Bits 0 through 3 specify up to 15 overlay planes and bits 4 through 7 specify up to 15 underlay planes.
     * @type {Integer}
     */
    bReserved {
        get => NumGet(this, 27, "char")
        set => NumPut("char", value, this, 27)
    }

    /**
     * Ignored. Earlier implementations of OpenGL used this member, but it is no longer used.
     * @type {Integer}
     */
    dwLayerMask {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Specifies the transparent color or index of an underlay plane. When the pixel type is RGBA, <b>dwVisibleMask</b> is a transparent RGB color value. When the pixel type is color index, it is a transparent index value.
     * @type {Integer}
     */
    dwVisibleMask {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Ignored. Earlier implementations of OpenGL used this member, but it is no longer used.
     * @type {Integer}
     */
    dwDamageMask {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
