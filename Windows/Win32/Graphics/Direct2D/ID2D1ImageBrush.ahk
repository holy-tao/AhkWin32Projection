#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Brush.ahk

/**
 * Represents a brush based on an ID2D1Image.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1imagebrush
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1ImageBrush extends ID2D1Brush{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1ImageBrush
     * @type {Guid}
     */
    static IID => Guid("{fe9e984d-3f95-407c-b5db-cb94d4e8f87c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetImage", "SetExtendModeX", "SetExtendModeY", "SetInterpolationMode", "SetSourceRectangle", "GetImage", "GetExtendModeX", "GetExtendModeY", "GetInterpolationMode", "GetSourceRectangle"]

    /**
     * Sets the image associated with the provided image brush.
     * @param {ID2D1Image} image Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>*</b>
     * 
     * The image to be associated with the image brush.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1imagebrush-setimage
     */
    SetImage(image) {
        ComCall(8, this, "ptr", image)
    }

    /**
     * Sets how the content inside the source rectangle in the image brush will be extended on the x-axis.
     * @param {Integer} extendModeX Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The extend mode on the x-axis of the image.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1imagebrush-setextendmodex
     */
    SetExtendModeX(extendModeX) {
        ComCall(9, this, "int", extendModeX)
    }

    /**
     * Sets the extend mode on the y-axis.
     * @param {Integer} extendModeY Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The extend mode on the y-axis of the image.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1imagebrush-setextendmodey
     */
    SetExtendModeY(extendModeY) {
        ComCall(10, this, "int", extendModeY)
    }

    /**
     * Sets the interpolation mode for the image brush.
     * @param {Integer} interpolationMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_interpolation_mode">D2D1_INTERPOLATION_MODE</a></b>
     * 
     * How the contents of the image will be interpolated to handle the brush transform.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1imagebrush-setinterpolationmode
     */
    SetInterpolationMode(interpolationMode) {
        ComCall(11, this, "int", interpolationMode)
    }

    /**
     * Sets the source rectangle in the image brush.
     * @remarks
     * 
     * The top left corner of the <i>sourceRectangle</i> parameter maps to the brush space origin. That is, if the  brush and world transforms are both identity, the portion of the image in the top left corner of the source rectangle will be rendered at (0,0) in the render target.
     * 
     * The source rectangle will be expanded differently depending on whether the input image is based on   pixels (a bitmap or effect) or by a command list.
     * 
     * 
     * 
     * <ul>
     * <li>If the input image is a bitmap or an effect, the rectangle will be expanded to encapsulate a full input pixel before being additionally down-scaled to ensure that the projected rectangle will be correct in the final scene-space.</li>
     * <li>If the input image is a command list, the command list will be slightly expanded to encapsulate a full input pixel.
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The source rectangle that defines the portion of the image to tile.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1imagebrush-setsourcerectangle
     */
    SetSourceRectangle(sourceRectangle) {
        ComCall(12, this, "ptr", sourceRectangle)
    }

    /**
     * Gets the image associated with the image brush.
     * @param {Pointer<ID2D1Image>} image Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the image associated with  this brush.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1imagebrush-getimage
     */
    GetImage(image) {
        ComCall(13, this, "ptr*", image)
    }

    /**
     * Gets the extend mode of the image brush on the x-axis.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * This method returns the x-extend mode.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1imagebrush-getextendmodex
     */
    GetExtendModeX() {
        result := ComCall(14, this, "int")
        return result
    }

    /**
     * Gets the extend mode of the image brush on the y-axis of the image.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * This method returns the  y-extend mode.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1imagebrush-getextendmodey
     */
    GetExtendModeY() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * Gets the interpolation mode of the image brush.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_interpolation_mode">D2D1_INTERPOLATION_MODE</a></b>
     * 
     * This method returns the  interpolation mode.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1imagebrush-getinterpolationmode
     */
    GetInterpolationMode() {
        result := ComCall(16, this, "int")
        return result
    }

    /**
     * Gets the rectangle that will be used as the bounds of the image when drawn as an image brush.
     * @param {Pointer<D2D_RECT_F>} sourceRectangle Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * When this method returns, contains the address of the output source rectangle.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1imagebrush-getsourcerectangle
     */
    GetSourceRectangle(sourceRectangle) {
        ComCall(17, this, "ptr", sourceRectangle)
    }
}
