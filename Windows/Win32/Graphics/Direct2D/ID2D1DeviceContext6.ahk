#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1DeviceContext5.ahk

/**
 * This interface performs all the same functions as the existing ID2D1DeviceContext5 interface, plus it enables access to the BlendImage method.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1devicecontext6
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DeviceContext6 extends ID2D1DeviceContext5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1DeviceContext6
     * @type {Guid}
     */
    static IID => Guid("{985f7e37-4ed0-4a19-98a3-15b0edfde306}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 119

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
     *             If not specified, the destination origin will be (0, 0). 
     *             The top-left corner of the image will be mapped to the target offset. 
     *             This will not necessarily be the origin. The default value is NULL.
     * @param {Pointer<D2D_RECT_F>} imageRectangle Type: <b>const D2D1_RECT_F*</b>
     * 
     * The corresponding rectangle in the image space will be mapped to the given origins when processing the image. The default value is NULL.
     * @param {Integer} interpolationMode Type: <b>D2D1_INTERPOLATION_MODE</b>
     * 
     * The interpolation mode that will be used to scale the image if necessary. The default value is D2D1_INTERPOLATION_MODE_LINEAR.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1devicecontext6-blendimage
     */
    BlendImage(image, blendMode, targetOffset, imageRectangle, interpolationMode) {
        ComCall(119, this, "ptr", image, "int", blendMode, "ptr", targetOffset, "ptr", imageRectangle, "int", interpolationMode)
    }
}
