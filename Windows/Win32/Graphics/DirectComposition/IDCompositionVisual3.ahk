#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionVisualDebug.ahk

/**
 * Represents one DirectComposition visual in a visual tree.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionvisual3
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionVisual3 extends IDCompositionVisualDebug{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionVisual3
     * @type {Guid}
     */
    static IID => Guid("{2775f462-b6c1-4015-b0be-b3e7d6a4976d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDepthMode", "SetOffsetZ", "SetOffsetZ1", "SetOpacity", "SetOpacity1", "SetTransform", "SetTransform1", "SetVisible"]

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-setdepthmode
     */
    SetDepthMode(mode) {
        result := ComCall(26, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-setoffsetz(float)
     */
    SetOffsetZ(animation) {
        result := ComCall(27, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} offsetZ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-setoffsetz(float)
     */
    SetOffsetZ1(offsetZ) {
        result := ComCall(28, this, "float", offsetZ, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-setopacity(idcompositionanimation)
     */
    SetOpacity(animation) {
        result := ComCall(29, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} opacity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-setopacity(idcompositionanimation)
     */
    SetOpacity1(opacity) {
        result := ComCall(30, this, "float", opacity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionTransform3D} transform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-settransform(constd2d_matrix_4x4_f_)
     */
    SetTransform(transform) {
        result := ComCall(31, this, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_4X4_F>} matrix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-settransform(constd2d_matrix_4x4_f_)
     */
    SetTransform1(matrix) {
        result := ComCall(32, this, "ptr", matrix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} visible 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-setvisible
     */
    SetVisible(visible) {
        result := ComCall(33, this, "int", visible, "HRESULT")
        return result
    }
}
