#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDCompositionTransform.ahk" { IDCompositionTransform }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }

/**
 * Represents a 2D transformation that affects only the offset of a visual along the x-axis and y-axis.
 * @remarks
 * A translation transform represents the following 3-by-2 matrix:
 * 
 * <img alt="Three-by-two translation matrix" src="./images/translate_transform_3x2matrix.png"/>
 * 
 * The effect is simply to offset the coordinate system by <i>x</i> and <i>y</i>.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositiontranslatetransform
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionTranslateTransform extends IDCompositionTransform {
    /**
     * The interface identifier for IDCompositionTranslateTransform
     * @type {Guid}
     */
    static IID := Guid("{06791122-c6f0-417d-8323-269e987f5954}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionTranslateTransform interfaces
    */
    struct Vtbl extends IDCompositionTransform.Vtbl {
        SetOffsetX  : IntPtr
        SetOffsetX1 : IntPtr
        SetOffsetY  : IntPtr
        SetOffsetY1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionTranslateTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Animates the value of the OffsetX property of a 2D translation transform.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the OffsetX property unless this method is called again. If the OffsetX property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation object that determines how the value of the OffsetX property changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontranslatetransform-setoffsetx(idcompositionanimation)
     */
    SetOffsetX(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of the OffsetX property of a 2D translation transform.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the OffsetX property unless this method is called again. If the OffsetX property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Float} offsetX 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontranslatetransform-setoffsetx(idcompositionanimation)
     */
    SetOffsetX1(offsetX) {
        result := ComCall(4, this, "float", offsetX, "HRESULT")
        return result
    }

    /**
     * Changes the value of the OffsetY property of a 2D translation transform.
     * @remarks
     * This method fails if the <i>offsetY</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     * 
     * 
     * If the OffsetY property was previously animated, this method removes the animation and sets the OffsetY property to the specified static value.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontranslatetransform-setoffsety(float)
     */
    SetOffsetY(animation) {
        result := ComCall(5, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes the value of the OffsetY property of a 2D translation transform.
     * @remarks
     * This method fails if the <i>offsetY</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     * 
     * 
     * If the OffsetY property was previously animated, this method removes the animation and sets the OffsetY property to the specified static value.
     * @param {Float} offsetY Type: <b>float</b>
     * 
     * The distance to translate along the y-axis, in pixels.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontranslatetransform-setoffsety(float)
     */
    SetOffsetY1(offsetY) {
        result := ComCall(6, this, "float", offsetY, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionTranslateTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOffsetX := CallbackCreate(GetMethod(implObj, "SetOffsetX"), flags, 2)
        this.vtbl.SetOffsetX1 := CallbackCreate(GetMethod(implObj, "SetOffsetX1"), flags, 2)
        this.vtbl.SetOffsetY := CallbackCreate(GetMethod(implObj, "SetOffsetY"), flags, 2)
        this.vtbl.SetOffsetY1 := CallbackCreate(GetMethod(implObj, "SetOffsetY1"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOffsetX)
        CallbackFree(this.vtbl.SetOffsetX1)
        CallbackFree(this.vtbl.SetOffsetY)
        CallbackFree(this.vtbl.SetOffsetY1)
    }
}
