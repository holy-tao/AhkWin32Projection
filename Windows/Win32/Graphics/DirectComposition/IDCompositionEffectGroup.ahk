#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionEffect.ahk

/**
 * Represents a group of bitmap effects that are applied together to modify the rasterization of a visual's subtree.
 * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nn-dcomp-idcompositioneffectgroup
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionEffectGroup extends IDCompositionEffect{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionEffectGroup
     * @type {Guid}
     */
    static IID => Guid("{a7929a74-e6b2-4bd6-8b95-4040119ca34d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOpacity", "SetOpacity1", "SetTransform3D"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositioneffectgroup-setopacity(idcompositionanimation)
     */
    SetOpacity(animation) {
        result := ComCall(3, this, "ptr", animation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositioneffectgroup-setopacity(idcompositionanimation)
     */
    SetOpacity1(opacity) {
        result := ComCall(4, this, "float", opacity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositioneffectgroup-settransform3d
     */
    SetTransform3D(transform3D) {
        result := ComCall(5, this, "ptr", transform3D, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
