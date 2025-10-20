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
     * 
     * @param {Pointer<ID2D1Image>} image 
     * @returns {String} Nothing - always returns an empty string
     */
    SetImage(image) {
        ComCall(8, this, "ptr", image)
        return result
    }

    /**
     * 
     * @param {Integer} extendModeX 
     * @returns {String} Nothing - always returns an empty string
     */
    SetExtendModeX(extendModeX) {
        ComCall(9, this, "int", extendModeX)
        return result
    }

    /**
     * 
     * @param {Integer} extendModeY 
     * @returns {String} Nothing - always returns an empty string
     */
    SetExtendModeY(extendModeY) {
        ComCall(10, this, "int", extendModeY)
        return result
    }

    /**
     * 
     * @param {Integer} interpolationMode 
     * @returns {String} Nothing - always returns an empty string
     */
    SetInterpolationMode(interpolationMode) {
        ComCall(11, this, "int", interpolationMode)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {String} Nothing - always returns an empty string
     */
    SetSourceRectangle(sourceRectangle) {
        ComCall(12, this, "ptr", sourceRectangle)
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Image>} image 
     * @returns {String} Nothing - always returns an empty string
     */
    GetImage(image) {
        ComCall(13, this, "ptr", image)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExtendModeX() {
        result := ComCall(14, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExtendModeY() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetInterpolationMode() {
        result := ComCall(16, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {String} Nothing - always returns an empty string
     */
    GetSourceRectangle(sourceRectangle) {
        ComCall(17, this, "ptr", sourceRectangle)
        return result
    }
}
