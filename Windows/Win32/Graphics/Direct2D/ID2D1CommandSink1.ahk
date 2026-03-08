#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1CommandSink.ahk

/**
 * This interface performs all the same functions as the existing ID2D1CommandSink interface. It also enables access to the new primitive blend modes, MIN and ADD, through its SetPrimitiveBlend1 method.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nn-d2d1_2-id2d1commandsink1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1CommandSink1 extends ID2D1CommandSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1CommandSink1
     * @type {Guid}
     */
    static IID => Guid("{9eb767fd-4269-4467-b8c2-eb30cb305743}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPrimitiveBlend1"]

    /**
     * Sets a new primitive blend mode. (ID2D1CommandSink1.SetPrimitiveBlend1)
     * @remarks
     * <h3><a id="Blend_modes"></a><a id="blend_modes"></a><a id="BLEND_MODES"></a>Blend modes</h3>
     * For aliased rendering (except for MIN mode), the output value O is computed by linearly interpolating the value <i>blend(S, D)</i> with the destination pixel value, based on the amount that the primitive covers the destination pixel.
     * 
     * 
     * 
     * The table here shows the primitive blend modes for both aliased and antialiased blending. The equations listed in the table  use these elements:
     * 		  <ul>
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
     * <td>The resulting pixel values use the minimum of the source and destination pixel values. Available in Windows 8 and later.</td>
     * </tr>
     * <tr>
     * <td>D2D1_PRIMITIVE_BLEND_ADD</td>
     * <td>O = (S + D) * C + D * (1 – C)</td>
     * <td>O = S * C + D</td>
     * <td>The resulting pixel values are the sum of the source and destination pixel values. Available in Windows 8 and later.</td>
     * </tr>
     * </table>
     *  
     * 
     * <img alt="An illustration of Direct2D primitive blend modes with varying opacity and backgrounds." src="./images/PrimBlendDemo.png"/>
     * An illustration of the primitive blend modes with varying opacity and backgrounds.
     * 
     * The primitive blend will apply to all of the primitive drawn on the context, unless this is overridden with the <i>compositeMode</i> parameter on the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawimage(id2d1effect_constd2d1_point_2f_constd2d1_rect_f_d2d1_interpolation_mode_d2d1_composite_mode)">DrawImage</a> API.
     * 
     * The primitive blend applies to the interior of any primitives drawn on the context. In the case of <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawimage(id2d1effect_constd2d1_point_2f_constd2d1_rect_f_d2d1_interpolation_mode_d2d1_composite_mode)">DrawImage</a>, this will be implied by the image rectangle, offset and world transform.
     * 
     * If the primitive blend is anything other than <b>D2D1_PRIMITIVE_BLEND_OVER</b> then ClearType rendering will be turned off. If the application explicitly forces ClearType rendering in these modes, the drawing context will be placed in an error state. D2DERR_WRONG_STATE will be returned from either <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-flush">Flush</a>.
     * @param {Integer} primitiveBlend Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_primitive_blend">D2D1_PRIMITIVE_BLEND</a></b>
     * 
     * The primitive blend that will apply to subsequent primitives.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nf-d2d1_2-id2d1commandsink1-setprimitiveblend1
     */
    SetPrimitiveBlend1(primitiveBlend) {
        result := ComCall(28, this, "int", primitiveBlend, "HRESULT")
        return result
    }
}
