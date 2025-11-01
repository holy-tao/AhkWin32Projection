#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionEffect.ahk

/**
 * Represents a group of bitmap effects that are applied together to modify the rasterization of a visual's subtree.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositioneffectgroup
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
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioneffectgroup-setopacity(idcompositionanimation)
     */
    SetOpacity(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} opacity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioneffectgroup-setopacity(idcompositionanimation)
     */
    SetOpacity1(opacity) {
        result := ComCall(4, this, "float", opacity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionTransform3D} transform3D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioneffectgroup-settransform3d
     */
    SetTransform3D(transform3D) {
        result := ComCall(5, this, "ptr", transform3D, "HRESULT")
        return result
    }
}
