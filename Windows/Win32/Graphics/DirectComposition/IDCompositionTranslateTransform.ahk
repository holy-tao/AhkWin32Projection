#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform.ahk

/**
 * Represents a 2D transformation that affects only the offset of a visual along the x-axis and y-axis.
 * @remarks
 * 
  * A translation transform represents the following 3-by-2 matrix:
  * 
  * <img alt="Three-by-two translation matrix" src="./images/translate_transform_3x2matrix.png"/>
  * 
  * The effect is simply to offset the coordinate system by <i>x</i> and <i>y</i>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositiontranslatetransform
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionTranslateTransform extends IDCompositionTransform{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionTranslateTransform
     * @type {Guid}
     */
    static IID => Guid("{06791122-c6f0-417d-8323-269e987f5954}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOffsetX", "SetOffsetX1", "SetOffsetY", "SetOffsetY1"]

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontranslatetransform-setoffsetx(idcompositionanimation)
     */
    SetOffsetX(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} offsetX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontranslatetransform-setoffsetx(idcompositionanimation)
     */
    SetOffsetX1(offsetX) {
        result := ComCall(4, this, "float", offsetX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontranslatetransform-setoffsety(float)
     */
    SetOffsetY(animation) {
        result := ComCall(5, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} offsetY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontranslatetransform-setoffsety(float)
     */
    SetOffsetY1(offsetY) {
        result := ComCall(6, this, "float", offsetY, "HRESULT")
        return result
    }
}
