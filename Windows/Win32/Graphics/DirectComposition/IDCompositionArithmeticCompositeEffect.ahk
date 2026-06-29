#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Direct2D\Common\D2D_VECTOR_4F.ahk" { D2D_VECTOR_4F }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionFilterEffect.ahk" { IDCompositionFilterEffect }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }

/**
 * The arithmetic composite effect is used to combine 2 images using a weighted sum of pixels from the input images. (IDCompositionArithmeticCompositeEffect)
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionarithmeticcompositeeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionArithmeticCompositeEffect extends IDCompositionFilterEffect {
    /**
     * The interface identifier for IDCompositionArithmeticCompositeEffect
     * @type {Guid}
     */
    static IID := Guid("{3b67dfa8-e3dd-4e61-b640-46c2f3d739dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionArithmeticCompositeEffect interfaces
    */
    struct Vtbl extends IDCompositionFilterEffect.Vtbl {
        SetCoefficients  : IntPtr
        SetClampOutput   : IntPtr
        SetCoefficient1  : IntPtr
        SetCoefficient11 : IntPtr
        SetCoefficient2  : IntPtr
        SetCoefficient21 : IntPtr
        SetCoefficient3  : IntPtr
        SetCoefficient31 : IntPtr
        SetCoefficient4  : IntPtr
        SetCoefficient41 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionArithmeticCompositeEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the coefficients for the equation used to composite the two input images.
     * @param {Pointer<D2D_VECTOR_4F>} coefficients Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_4f">D2D1_VECTOR_4F</a></b>
     * 
     * The coefficients for the equation used to composite the two input images.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficients
     */
    SetCoefficients(coefficients) {
        result := ComCall(4, this, D2D_VECTOR_4F.Ptr, coefficients, "HRESULT")
        return result
    }

    /**
     * Specifies whether to clamp color values before the effect passes the values to the next effect in the graph.
     * @param {BOOL} clampoutput Type: <b>BOOL</b>
     * 
     * A boolean value indicating whether to clamp the color values.  A value of TRUE causes color values to be clamped between 0 and 1.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setclampoutput
     */
    SetClampOutput(clampoutput) {
        result := ComCall(5, this, BOOL, clampoutput, "HRESULT")
        return result
    }

    /**
     * Sets the first coefficient for the equation used to composite the two input images. (overload 2/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient1(float)
     */
    SetCoefficient1(animation) {
        result := ComCall(6, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the first coefficient for the equation used to composite the two input images. (overload 2/2)
     * @param {Float} Coeffcient1 Type: <b>float</b>
     * 
     * Specifies the first coefficient for the equation used to composite the two input images.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient1(float)
     */
    SetCoefficient11(Coeffcient1) {
        result := ComCall(7, this, "float", Coeffcient1, "HRESULT")
        return result
    }

    /**
     * Sets the second coefficient for the equation used to composite the two input images. (overload 2/2)
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the value of the second coefficient changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient2(idcompositionanimation)
     */
    SetCoefficient2(animation) {
        result := ComCall(8, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the second coefficient for the equation used to composite the two input images. (overload 2/2)
     * @param {Float} Coefficient2 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient2(idcompositionanimation)
     */
    SetCoefficient21(Coefficient2) {
        result := ComCall(9, this, "float", Coefficient2, "HRESULT")
        return result
    }

    /**
     * Sets the third coefficient for the equation used to composite the two input images. (overload 1/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient3(float)
     */
    SetCoefficient3(animation) {
        result := ComCall(10, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the third coefficient for the equation used to composite the two input images. (overload 1/2)
     * @param {Float} Coefficient3 Type: <b>float</b>
     * 
     * The third coefficient for the equation used to composite the two input images.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient3(float)
     */
    SetCoefficient31(Coefficient3) {
        result := ComCall(11, this, "float", Coefficient3, "HRESULT")
        return result
    }

    /**
     * Sets the fourth coefficient for the equation used to composite the two input images. (overload 2/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient4(float)
     */
    SetCoefficient4(animation) {
        result := ComCall(12, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the fourth coefficient for the equation used to composite the two input images. (overload 2/2)
     * @param {Float} Coefficient4 Type: <b>float</b>
     * 
     * The fourth coefficient for the equation used to composite the two input images.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient4(float)
     */
    SetCoefficient41(Coefficient4) {
        result := ComCall(13, this, "float", Coefficient4, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionArithmeticCompositeEffect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCoefficients := CallbackCreate(GetMethod(implObj, "SetCoefficients"), flags, 2)
        this.vtbl.SetClampOutput := CallbackCreate(GetMethod(implObj, "SetClampOutput"), flags, 2)
        this.vtbl.SetCoefficient1 := CallbackCreate(GetMethod(implObj, "SetCoefficient1"), flags, 2)
        this.vtbl.SetCoefficient11 := CallbackCreate(GetMethod(implObj, "SetCoefficient11"), flags, 2)
        this.vtbl.SetCoefficient2 := CallbackCreate(GetMethod(implObj, "SetCoefficient2"), flags, 2)
        this.vtbl.SetCoefficient21 := CallbackCreate(GetMethod(implObj, "SetCoefficient21"), flags, 2)
        this.vtbl.SetCoefficient3 := CallbackCreate(GetMethod(implObj, "SetCoefficient3"), flags, 2)
        this.vtbl.SetCoefficient31 := CallbackCreate(GetMethod(implObj, "SetCoefficient31"), flags, 2)
        this.vtbl.SetCoefficient4 := CallbackCreate(GetMethod(implObj, "SetCoefficient4"), flags, 2)
        this.vtbl.SetCoefficient41 := CallbackCreate(GetMethod(implObj, "SetCoefficient41"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCoefficients)
        CallbackFree(this.vtbl.SetClampOutput)
        CallbackFree(this.vtbl.SetCoefficient1)
        CallbackFree(this.vtbl.SetCoefficient11)
        CallbackFree(this.vtbl.SetCoefficient2)
        CallbackFree(this.vtbl.SetCoefficient21)
        CallbackFree(this.vtbl.SetCoefficient3)
        CallbackFree(this.vtbl.SetCoefficient31)
        CallbackFree(this.vtbl.SetCoefficient4)
        CallbackFree(this.vtbl.SetCoefficient41)
    }
}
