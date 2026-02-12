#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionVisualDebug.ahk

/**
 * Represents one DirectComposition visual in a visual tree. (IDCompositionVisual3)
 * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nn-dcomp-idcompositionvisual3
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
     * @param {Integer} mode_ Type: <b>DCOMPOSITION_DEPTH_MODE</b>
     * 
     * The new depth mode.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionvisual3-setdepthmode
     */
    SetDepthMode(mode_) {
        result := ComCall(26, this, "int", mode_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Animates the value of the OffsetZ property.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * The animation to control the OffsetZ property.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionvisual3-setoffsetz(idcompositionanimation)
     */
    SetOffsetZ(animation) {
        result := ComCall(27, this, "ptr", animation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Animates the value of the OffsetZ property.
     * @param {Float} offsetZ 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionvisual3-setoffsetz(idcompositionanimation)
     */
    SetOffsetZ1(offsetZ) {
        result := ComCall(28, this, "float", offsetZ, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionvisual3-setopacity(idcompositionanimation)
     */
    SetOpacity(animation) {
        result := ComCall(29, this, "ptr", animation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Animates the value of the visual's opacity property.
     * @param {Float} opacity 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionvisual3-setopacity(idcompositionanimation)
     */
    SetOpacity1(opacity) {
        result := ComCall(30, this, "float", opacity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the Transform property of this visual to the specified 3D transform object.
     * @remarks
     * Setting the Transform property transforms the coordinate system of the entire visual subtree that is rooted at this visual. If the Clip property of this visual is specified, the clip rectangle is also transformed.
     * 
     * 
     * 
     * If the Transform property previously specified a transform matrix, the newly specified transform object replaces the transform matrix.
     * 
     * A transformation specified by the Transform property is applied after the OffsetX and OffsetY properties. In other words, the effect of setting the Transform property and the OffsetX and OffsetY properties is the same as setting only the Transform property on a transform group where the first member of the group is an <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontranslatetransform">IDCompositionTranslateTransform</a> object that has those same OffsetX and OffsetY values. However, you should use the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionvisual-setoffsetx(float)">IDCompositionVisual::SetOffsetX</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionvisual-setoffsety(idcompositionanimation)">SetOffsetY</a> methods whenever possible because they are slightly faster. 
     * 
     * This method fails if <i>transform</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface that created this visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * 
     * 
     * If the <i>transform</i> parameter is NULL, the coordinate system of this visual is transformed only by its OffsetX and OffsetY properties. Setting the Transform property to NULL is equivalent to setting it to an <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionmatrixtransform">IDCompositionMatrixTransform</a> object where the specified matrix is the identity matrix. However, an application should set the Transform property to NULL whenever possible because it is slightly faster.
     * 
     * If the OffsetX and OffsetY properties are set to 0, and the Transform property is set to NULL, the coordinate system of the visual is the same as that of its parent.
     * @param {IDCompositionTransform3D} transform Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontransform3d">IDCompositionTransform3D</a>*</b>
     * 
     * The transform object that is used to modify  the coordinate system of this visual. This parameter can point to 
     *             an <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontransform">IDCompositionTransform</a> interface or one of its derived interfaces. This parameter can be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionvisual3-settransform(idcompositiontransform3d)
     */
    SetTransform(transform) {
        result := ComCall(31, this, "ptr", transform, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the Transform property of this visual to the specified 3D transform object.
     * @remarks
     * Setting the Transform property transforms the coordinate system of the entire visual subtree that is rooted at this visual. If the Clip property of this visual is specified, the clip rectangle is also transformed.
     * 
     * 
     * 
     * If the Transform property previously specified a transform matrix, the newly specified transform object replaces the transform matrix.
     * 
     * A transformation specified by the Transform property is applied after the OffsetX and OffsetY properties. In other words, the effect of setting the Transform property and the OffsetX and OffsetY properties is the same as setting only the Transform property on a transform group where the first member of the group is an <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontranslatetransform">IDCompositionTranslateTransform</a> object that has those same OffsetX and OffsetY values. However, you should use the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionvisual-setoffsetx(float)">IDCompositionVisual::SetOffsetX</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionvisual-setoffsety(idcompositionanimation)">SetOffsetY</a> methods whenever possible because they are slightly faster. 
     * 
     * This method fails if <i>transform</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface that created this visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * 
     * 
     * If the <i>transform</i> parameter is NULL, the coordinate system of this visual is transformed only by its OffsetX and OffsetY properties. Setting the Transform property to NULL is equivalent to setting it to an <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionmatrixtransform">IDCompositionMatrixTransform</a> object where the specified matrix is the identity matrix. However, an application should set the Transform property to NULL whenever possible because it is slightly faster.
     * 
     * If the OffsetX and OffsetY properties are set to 0, and the Transform property is set to NULL, the coordinate system of the visual is the same as that of its parent.
     * @param {Pointer<D2D_MATRIX_4X4_F>} matrix_ 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionvisual3-settransform(idcompositiontransform3d)
     */
    SetTransform1(matrix_) {
        result := ComCall(32, this, "ptr", matrix_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionvisual3-setvisible
     */
    SetVisible(visible) {
        result := ComCall(33, this, "int", visible, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
