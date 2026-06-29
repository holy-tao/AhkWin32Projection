#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionVisualDebug.ahk" { IDCompositionVisualDebug }
#Import ".\DCOMPOSITION_DEPTH_MODE.ahk" { DCOMPOSITION_DEPTH_MODE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }
#Import ".\IDCompositionTransform3D.ahk" { IDCompositionTransform3D }
#Import "..\Direct2D\Common\D2D_MATRIX_4X4_F.ahk" { D2D_MATRIX_4X4_F }

/**
 * Represents one DirectComposition visual in a visual tree. (IDCompositionVisual3)
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionvisual3
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionVisual3 extends IDCompositionVisualDebug {
    /**
     * The interface identifier for IDCompositionVisual3
     * @type {Guid}
     */
    static IID := Guid("{2775f462-b6c1-4015-b0be-b3e7d6a4976d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionVisual3 interfaces
    */
    struct Vtbl extends IDCompositionVisualDebug.Vtbl {
        SetDepthMode  : IntPtr
        SetOffsetZ    : IntPtr
        SetOffsetZ1   : IntPtr
        SetOpacity    : IntPtr
        SetOpacity1   : IntPtr
        SetTransform  : IntPtr
        SetTransform1 : IntPtr
        SetVisible    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionVisual3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the depth mode property associated with this visual.
     * @param {DCOMPOSITION_DEPTH_MODE} _mode Type: <b>DCOMPOSITION_DEPTH_MODE</b>
     * 
     * The new depth mode.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-setdepthmode
     */
    SetDepthMode(_mode) {
        result := ComCall(26, this, DCOMPOSITION_DEPTH_MODE, _mode, "HRESULT")
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
     * @param {Pointer<D2D_MATRIX_4X4_F>} _matrix Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_matrix_3x2_f">D2D_MATRIX_4X4_F</a></b>
     * 
     * The 4-by-4 transform matrix that is used to modify  the coordinate system of this visual.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual3-settransform(constd2d_matrix_4x4_f_)
     */
    SetTransform1(_matrix) {
        result := ComCall(32, this, D2D_MATRIX_4X4_F.Ptr, _matrix, "HRESULT")
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
        result := ComCall(33, this, BOOL, visible, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionVisual3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDepthMode := CallbackCreate(GetMethod(implObj, "SetDepthMode"), flags, 2)
        this.vtbl.SetOffsetZ := CallbackCreate(GetMethod(implObj, "SetOffsetZ"), flags, 2)
        this.vtbl.SetOffsetZ1 := CallbackCreate(GetMethod(implObj, "SetOffsetZ1"), flags, 2)
        this.vtbl.SetOpacity := CallbackCreate(GetMethod(implObj, "SetOpacity"), flags, 2)
        this.vtbl.SetOpacity1 := CallbackCreate(GetMethod(implObj, "SetOpacity1"), flags, 2)
        this.vtbl.SetTransform := CallbackCreate(GetMethod(implObj, "SetTransform"), flags, 2)
        this.vtbl.SetTransform1 := CallbackCreate(GetMethod(implObj, "SetTransform1"), flags, 2)
        this.vtbl.SetVisible := CallbackCreate(GetMethod(implObj, "SetVisible"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDepthMode)
        CallbackFree(this.vtbl.SetOffsetZ)
        CallbackFree(this.vtbl.SetOffsetZ1)
        CallbackFree(this.vtbl.SetOpacity)
        CallbackFree(this.vtbl.SetOpacity1)
        CallbackFree(this.vtbl.SetTransform)
        CallbackFree(this.vtbl.SetTransform1)
        CallbackFree(this.vtbl.SetVisible)
    }
}
