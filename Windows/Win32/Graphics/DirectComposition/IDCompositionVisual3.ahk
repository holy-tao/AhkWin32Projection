#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionVisualDebug.ahk

/**
 * Represents one DirectComposition visual in a visual tree. (IDCompositionVisual3)
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionvisual3
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
     * Sets the depth mode property associated with this visual.
     * @param {Integer} _mode 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-setdepthmode
     */
    SetDepthMode(_mode) {
        result := ComCall(26, this, "int", _mode, "HRESULT")
        return result
    }

    /**
     * Changes the value of OffsetZ property.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-setoffsetz(float)
     */
    SetOffsetZ(animation) {
        result := ComCall(27, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes the value of OffsetZ property.
     * @param {Float} offsetZ Type: <b>float</b>
     * 
     * The new value.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-setoffsetz(float)
     */
    SetOffsetZ1(offsetZ) {
        result := ComCall(28, this, "float", offsetZ, "HRESULT")
        return result
    }

    /**
     * Animates the value of the visual's opacity property.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * The animation that will be used to control the value of the opacity property.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-setopacity(idcompositionanimation)
     */
    SetOpacity(animation) {
        result := ComCall(29, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of the visual's opacity property.
     * @param {Float} opacity 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-setopacity(idcompositionanimation)
     */
    SetOpacity1(opacity) {
        result := ComCall(30, this, "float", opacity, "HRESULT")
        return result
    }

    /**
     * Sets the Transform property of this visual to the specified 4-by-4 transform matrix.
     * @remarks
     * Setting the Transform property transforms the coordinate system of the entire visual subtree that is rooted at this visual. If the Clip property of this visual is specified, the clip rectangle is also transformed.
     * 
     * 
     * 
     * If the Transform property previously specified a transform object, the newly specified transform matrix replaces the transform object.
     * @param {IDCompositionTransform3D} transform 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-settransform(constd2d_matrix_4x4_f_)
     */
    SetTransform(transform) {
        result := ComCall(31, this, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * Sets the Transform property of this visual to the specified 4-by-4 transform matrix.
     * @remarks
     * Setting the Transform property transforms the coordinate system of the entire visual subtree that is rooted at this visual. If the Clip property of this visual is specified, the clip rectangle is also transformed.
     * 
     * 
     * 
     * If the Transform property previously specified a transform object, the newly specified transform matrix replaces the transform object.
     * @param {Pointer<D2D_MATRIX_4X4_F>} _matrix 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-settransform(constd2d_matrix_4x4_f_)
     */
    SetTransform1(_matrix) {
        result := ComCall(32, this, "ptr", _matrix, "HRESULT")
        return result
    }

    /**
     * Changes the value of the visual's Visible property.
     * @param {BOOL} visible Type: <b>BOOL</b>
     * 
     * The new value for the visible property.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-setvisible
     */
    SetVisible(visible) {
        result := ComCall(33, this, "int", visible, "HRESULT")
        return result
    }
}
