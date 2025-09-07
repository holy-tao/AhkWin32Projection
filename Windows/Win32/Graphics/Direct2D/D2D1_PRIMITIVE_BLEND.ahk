#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used to specify the geometric blend mode for all Direct2D primitives.
 * @remarks
 * <h3><a id="Blend_modes"></a><a id="blend_modes"></a><a id="BLEND_MODES"></a>Blend modes</h3>
  * For aliased rendering (except for MIN mode), the output value O is computed by linearly interpolating the value <i>blend(S, D)</i> with the destination pixel value, based on the amount that the primitive covers the destination pixel.
  *           
  * 
  * 
  * 
  * The table here shows the primitive blend modes for both aliased and antialiased blending. The equations listed in the table  use these elements:
  *             <ul>
  * <li>O = Output</li>
  * <li>S = Source</li>
  * <li>SA = Source Alpha</li>
  * <li>D = Destination</li>
  * <li>DA = Destination Alpha</li>
  * <li>C = Pixel coverage</li>
  * </ul>
  * 
  * 
  * <table>
  * <tr>
  * <th>Primitive blend mode</th>
  * <th>Aliased blending</th>
  * <th>Antialiased blending</th>
  * <th>Description</th>
  * </tr>
  * <tr>
  * <td>D2D1_PRIMITIVE_BLEND_SOURCE_OVER</td>
  * <td>O = (S + (1 – SA) * D) * C + D * (1 – C)</td>
  * <td>O = S * C + D *(1 – SA *C)</td>
  * <td>The standard source-over-destination blend mode.</td>
  * </tr>
  * <tr>
  * <td>D2D1_PRIMITIVE_BLEND_COPY</td>
  * <td>O = S * C + D * (1 – C)</td>
  * <td>O = S * C + D * (1 – C)</td>
  * <td>The source is copied to the destination; the destination pixels are ignored.</td>
  * </tr>
  * <tr>
  * <td>D2D1_PRIMITIVE_BLEND_MIN</td>
  * <td>O = Min(S + 1-SA, D) </td>
  * <td>O = Min(S * C + 1 – SA *C, D)</td>
  * <td>The resulting pixel values use the minimum of the source and destination pixel values. Available in Windows 8.1 and later.
  *               </td>
  * </tr>
  * <tr>
  * <td>D2D1_PRIMITIVE_BLEND_ADD</td>
  * <td>O = (S + D) * C + D * (1 – C)</td>
  * <td>O = S * C + D</td>
  * <td>The resulting pixel values are the sum of the source and destination pixel values. Available in Windows 8.1 and later.
  *               </td>
  * </tr>
  * </table>
  *  
  * 
  * <img alt="An illustration of Direct2D primitive blend modes with varying opacity and backgrounds." src="./images/PrimBlendDemo.png"/>
  * An illustration of the primitive blend modes with varying opacity and backgrounds.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ne-d2d1_1-d2d1_primitive_blend
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_PRIMITIVE_BLEND{

    /**
     * The standard source-over-destination blend mode.
     * @type {Integer (Int32)}
     */
    static D2D1_PRIMITIVE_BLEND_SOURCE_OVER => 0

    /**
     * The source is copied to the destination; the destination pixels are ignored.
     * @type {Integer (Int32)}
     */
    static D2D1_PRIMITIVE_BLEND_COPY => 1

    /**
     * The resulting pixel values use the minimum of the source and destination pixel values. Available in Windows 8 and later.
     * @type {Integer (Int32)}
     */
    static D2D1_PRIMITIVE_BLEND_MIN => 2

    /**
     * The resulting pixel values are the sum of the source and destination pixel values. Available in Windows 8 and later.
     * @type {Integer (Int32)}
     */
    static D2D1_PRIMITIVE_BLEND_ADD => 3

    /**
     * The resulting pixel values use the maximum of the source and destination pixel values. 
 *           Available in Windows 10 and later (set using <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nf-d2d1_3-id2d1commandsink4-setprimitiveblend2">ID21CommandSink4::SetPrimitiveBlend2</a>).
     * @type {Integer (Int32)}
     */
    static D2D1_PRIMITIVE_BLEND_MAX => 4
}
