#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1StrokeStyle.ahk

/**
 * Describes the caps, miter limit, line join, and dash information for a stroke.
 * @remarks
 * 
 * This interface adds functionality to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1strokestyle">ID2D1StrokeStyle</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1strokestyle1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1StrokeStyle1 extends ID2D1StrokeStyle{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1StrokeStyle1
     * @type {Guid}
     */
    static IID => Guid("{10a72a66-e91c-43f4-993f-ddf4b82b0b4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStrokeTransformType"]

    /**
     * Gets the stroke transform type.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_stroke_transform_type">D2D1_STROKE_TRANSFORM_TYPE</a></b>
     * 
     * This method returns the stroke transform type.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1strokestyle1-getstroketransformtype
     */
    GetStrokeTransformType() {
        result := ComCall(13, this, "int")
        return result
    }
}
