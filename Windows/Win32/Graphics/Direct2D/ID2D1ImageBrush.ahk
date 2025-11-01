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
     * 
     * @param {ID2D1Image} image 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-setimage
     */
    SetImage(image) {
        ComCall(8, this, "ptr", image)
    }

    /**
     * 
     * @param {Integer} extendModeX 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-setextendmodex
     */
    SetExtendModeX(extendModeX) {
        ComCall(9, this, "int", extendModeX)
    }

    /**
     * 
     * @param {Integer} extendModeY 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-setextendmodey
     */
    SetExtendModeY(extendModeY) {
        ComCall(10, this, "int", extendModeY)
    }

    /**
     * 
     * @param {Integer} interpolationMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-setinterpolationmode
     */
    SetInterpolationMode(interpolationMode) {
        ComCall(11, this, "int", interpolationMode)
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-setsourcerectangle
     */
    SetSourceRectangle(sourceRectangle) {
        ComCall(12, this, "ptr", sourceRectangle)
    }

    /**
     * 
     * @param {Pointer<ID2D1Image>} image 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-getimage
     */
    GetImage(image) {
        ComCall(13, this, "ptr*", image)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-getextendmodex
     */
    GetExtendModeX() {
        result := ComCall(14, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-getextendmodey
     */
    GetExtendModeY() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-getinterpolationmode
     */
    GetInterpolationMode() {
        result := ComCall(16, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-getsourcerectangle
     */
    GetSourceRectangle(sourceRectangle) {
        ComCall(17, this, "ptr", sourceRectangle)
    }
}
