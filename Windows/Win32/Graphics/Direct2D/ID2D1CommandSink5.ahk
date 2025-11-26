#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1CommandSink4.ahk

/**
 * This interface performs all the same functions as the existing ID2D1CommandSink4 interface, plus it enables access to the BlendImage method.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1commandsink5
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1CommandSink5 extends ID2D1CommandSink4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1CommandSink5
     * @type {Guid}
     */
    static IID => Guid("{7047dd26-b1e7-44a7-959a-8349e2144fa8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 34

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BlendImage"]

    /**
     * Draws an image to the device context using the specified blend mode. Results are equivalent to using Direct2D's built-in Blend effect.
     * @param {ID2D1Image} image Type: <b>ID2D1Image*</b>
     * 
     * The image to be drawn to the device context.
     * @param {Integer} blendMode Type: <b>D2D1_BLEND_MODE</b>
     * 
     * The blend mode to be used. See <a href="https://docs.microsoft.com/windows/desktop/Direct2D/blend">Blend modes</a> for more info.
     * @param {Pointer<D2D_POINT_2F>} targetOffset Type: <b>const D2D1_POINT_2F*</b>
     * 
     * The offset in the destination space that the image will be rendered to. 
     *             The entire logical extent of the image will be rendered to the corresponding destination. 
     *             If not specified, the destination origin will be (0, 0). The top-left corner of the image will be mapped to the target offset. 
     *             This will not necessarily be the origin. The default value is NULL.
     * @param {Pointer<D2D_RECT_F>} imageRectangle Type: <b>const D2D1_RECT_F*</b>
     * 
     * The corresponding rectangle in the image space will be mapped to the given origins when processing the image. The default value is NULL.
     * @param {Integer} interpolationMode Type: <b>D2D1_INTERPOLATION_MODE</b>
     * 
     * The interpolation mode that will be used to scale the image if necessary. The default value is D2D1_INTERPOLATION_MODE_LINEAR.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1commandsink5-blendimage
     */
    BlendImage(image, blendMode, targetOffset, imageRectangle, interpolationMode) {
        result := ComCall(34, this, "ptr", image, "int", blendMode, "ptr", targetOffset, "ptr", imageRectangle, "int", interpolationMode, "HRESULT")
        return result
    }
}
