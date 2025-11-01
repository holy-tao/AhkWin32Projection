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
     * 
     * @param {ID2D1Image} image 
     * @param {Integer} blendMode 
     * @param {Pointer<D2D_POINT_2F>} targetOffset 
     * @param {Pointer<D2D_RECT_F>} imageRectangle 
     * @param {Integer} interpolationMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1commandsink5-blendimage
     */
    BlendImage(image, blendMode, targetOffset, imageRectangle, interpolationMode) {
        result := ComCall(34, this, "ptr", image, "int", blendMode, "ptr", targetOffset, "ptr", imageRectangle, "int", interpolationMode, "HRESULT")
        return result
    }
}
