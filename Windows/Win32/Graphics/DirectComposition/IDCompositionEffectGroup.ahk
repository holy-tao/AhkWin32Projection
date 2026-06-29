#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionTransform3D.ahk" { IDCompositionTransform3D }
#Import ".\IDCompositionEffect.ahk" { IDCompositionEffect }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }

/**
 * Represents a group of bitmap effects that are applied together to modify the rasterization of a visual's subtree.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositioneffectgroup
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionEffectGroup extends IDCompositionEffect {
    /**
     * The interface identifier for IDCompositionEffectGroup
     * @type {Guid}
     */
    static IID := Guid("{a7929a74-e6b2-4bd6-8b95-4040119ca34d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionEffectGroup interfaces
    */
    struct Vtbl extends IDCompositionEffect.Vtbl {
        SetOpacity     : IntPtr
        SetOpacity1    : IntPtr
        SetTransform3D : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionEffectGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Animates the value of the Opacity property.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the Opacity property unless this method is called again. If the Opacity property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected composition effect group. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the value of the Opacity property changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioneffectgroup-setopacity(idcompositionanimation)
     */
    SetOpacity(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of the Opacity property.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the Opacity property unless this method is called again. If the Opacity property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected composition effect group. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Float} opacity 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioneffectgroup-setopacity(idcompositionanimation)
     */
    SetOpacity1(opacity) {
        result := ComCall(4, this, "float", opacity, "HRESULT")
        return result
    }

    /**
     * Sets the 3D transformation effect object that modifies the rasterization of the visuals that this effect group is applied to.
     * @remarks
     * This method fails if <i>transform3D</i> is an invalid pointer, or if the pointer was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as this effect group. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * 
     * 
     * 
     * If the <i>transform3D</i> parameter is NULL, the effect group does not apply any perspective transformations to the visuals. Setting the transform to NULL is equivalent to setting the transform to an <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionmatrixtransform3d">IDCompositionMatrixTransform3D</a> object where the specified matrix is the identity matrix. However, an application should use a NULL transform whenever possible because it is slightly faster.
     * @param {IDCompositionTransform3D} transform3D Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontransform3d">IDCompositionTransform3D</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontransform3d">IDCompositionTransform3D</a> interface or one of its derived interfaces. This parameter can be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioneffectgroup-settransform3d
     */
    SetTransform3D(transform3D) {
        result := ComCall(5, this, "ptr", transform3D, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionEffectGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOpacity := CallbackCreate(GetMethod(implObj, "SetOpacity"), flags, 2)
        this.vtbl.SetOpacity1 := CallbackCreate(GetMethod(implObj, "SetOpacity1"), flags, 2)
        this.vtbl.SetTransform3D := CallbackCreate(GetMethod(implObj, "SetTransform3D"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOpacity)
        CallbackFree(this.vtbl.SetOpacity1)
        CallbackFree(this.vtbl.SetTransform3D)
    }
}
