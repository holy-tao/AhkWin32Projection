#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDCompositionTransform.ahk" { IDCompositionTransform }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }

/**
 * Represents a 2D transformation that affects the scale of a visual along the x-axis and y-axis. The coordinate system is scaled from the specified center point.
 * @remarks
 * A scale transform represents the following 3-by-3 matrix:
 * 
 * <img alt="Three-by-three scale matrix" src="./images/scale_transform_3x3matrix.png"/>
 * 
 * The effect is to scale the coordinate system up or down and apply the corresponding translation such that the center point does not move.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionscaletransform
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionScaleTransform extends IDCompositionTransform {
    /**
     * The interface identifier for IDCompositionScaleTransform
     * @type {Guid}
     */
    static IID := Guid("{71fde914-40ef-45ef-bd51-68b037c339f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionScaleTransform interfaces
    */
    struct Vtbl extends IDCompositionTransform.Vtbl {
        SetScaleX   : IntPtr
        SetScaleX1  : IntPtr
        SetScaleY   : IntPtr
        SetScaleY1  : IntPtr
        SetCenterX  : IntPtr
        SetCenterX1 : IntPtr
        SetCenterY  : IntPtr
        SetCenterY1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionScaleTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Changes the value of the ScaleX property of a 2D scale transform.
     * @remarks
     * This method fails if the <i>scaleX</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     * 
     * 
     * If the ScaleX property was previously animated, this method removes the animation and sets the ScaleX property to the specified static value.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setscalex(float)
     */
    SetScaleX(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes the value of the ScaleX property of a 2D scale transform.
     * @remarks
     * This method fails if the <i>scaleX</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     * 
     * 
     * If the ScaleX property was previously animated, this method removes the animation and sets the ScaleX property to the specified static value.
     * @param {Float} scaleX Type: <b>float</b>
     * 
     * The new x-axis scale factor.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setscalex(float)
     */
    SetScaleX1(scaleX) {
        result := ComCall(4, this, "float", scaleX, "HRESULT")
        return result
    }

    /**
     * Changes the value of the ScaleY property of a 2D scale transform.
     * @remarks
     * This method fails if the <i>scaleY</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     * 
     * 
     * If the ScaleY property was previously animated, this method removes the animation and sets the ScaleY property to the specified static value.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setscaley(float)
     */
    SetScaleY(animation) {
        result := ComCall(5, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes the value of the ScaleY property of a 2D scale transform.
     * @remarks
     * This method fails if the <i>scaleY</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     * 
     * 
     * If the ScaleY property was previously animated, this method removes the animation and sets the ScaleY property to the specified static value.
     * @param {Float} scaleY Type: <b>float</b>
     * 
     * The new y-axis scale factor.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setscaley(float)
     */
    SetScaleY1(scaleY) {
        result := ComCall(6, this, "float", scaleY, "HRESULT")
        return result
    }

    /**
     * Animates the value of the CenterX property of a 2D scale transform.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the CenterX property unless this method is called again. If the CenterX property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation object that determines how the value of the CenterX property changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setcenterx(idcompositionanimation)
     */
    SetCenterX(animation) {
        result := ComCall(7, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of the CenterX property of a 2D scale transform.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the CenterX property unless this method is called again. If the CenterX property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Float} centerX 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setcenterx(idcompositionanimation)
     */
    SetCenterX1(centerX) {
        result := ComCall(8, this, "float", centerX, "HRESULT")
        return result
    }

    /**
     * Animates the value of the CenterY property of a 2D scale transform.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the CenterY property unless this method is called again. If the CenterY property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation object that determines how the value of the CenterY property changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setcentery(idcompositionanimation)
     */
    SetCenterY(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of the CenterY property of a 2D scale transform.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the CenterY property unless this method is called again. If the CenterY property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Float} centerY 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setcentery(idcompositionanimation)
     */
    SetCenterY1(centerY) {
        result := ComCall(10, this, "float", centerY, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionScaleTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetScaleX := CallbackCreate(GetMethod(implObj, "SetScaleX"), flags, 2)
        this.vtbl.SetScaleX1 := CallbackCreate(GetMethod(implObj, "SetScaleX1"), flags, 2)
        this.vtbl.SetScaleY := CallbackCreate(GetMethod(implObj, "SetScaleY"), flags, 2)
        this.vtbl.SetScaleY1 := CallbackCreate(GetMethod(implObj, "SetScaleY1"), flags, 2)
        this.vtbl.SetCenterX := CallbackCreate(GetMethod(implObj, "SetCenterX"), flags, 2)
        this.vtbl.SetCenterX1 := CallbackCreate(GetMethod(implObj, "SetCenterX1"), flags, 2)
        this.vtbl.SetCenterY := CallbackCreate(GetMethod(implObj, "SetCenterY"), flags, 2)
        this.vtbl.SetCenterY1 := CallbackCreate(GetMethod(implObj, "SetCenterY1"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetScaleX)
        CallbackFree(this.vtbl.SetScaleX1)
        CallbackFree(this.vtbl.SetScaleY)
        CallbackFree(this.vtbl.SetScaleY1)
        CallbackFree(this.vtbl.SetCenterX)
        CallbackFree(this.vtbl.SetCenterX1)
        CallbackFree(this.vtbl.SetCenterY)
        CallbackFree(this.vtbl.SetCenterY1)
    }
}
