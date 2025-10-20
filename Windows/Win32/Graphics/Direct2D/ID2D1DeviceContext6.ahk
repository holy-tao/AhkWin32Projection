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
     * 
     * @param {ID2D1Image} image 
     * @param {Integer} blendMode 
     * @param {Pointer<D2D_POINT_2F>} targetOffset 
     * @param {Pointer<D2D_RECT_F>} imageRectangle 
     * @param {Integer} interpolationMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext6-blendimage
     */
    BlendImage(image, blendMode, targetOffset, imageRectangle, interpolationMode) {
        ComCall(119, this, "ptr", image, "int", blendMode, "ptr", targetOffset, "ptr", imageRectangle, "int", interpolationMode)
    }
}
