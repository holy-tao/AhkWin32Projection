#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionClip.ahk" { IDCompositionClip }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }

/**
 * Represents a clip object that restricts the rendering of a visual subtree to the specified rectangular region. Optionally, the clip object may have rounded corners specified.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionrectangleclip
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionRectangleClip extends IDCompositionClip {
    /**
     * The interface identifier for IDCompositionRectangleClip
     * @type {Guid}
     */
    static IID := Guid("{9842ad7d-d9cf-4908-aed7-48b51da5e7c2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionRectangleClip interfaces
    */
    struct Vtbl extends IDCompositionClip.Vtbl {
        SetLeft                : IntPtr
        SetLeft1               : IntPtr
        SetTop                 : IntPtr
        SetTop1                : IntPtr
        SetRight               : IntPtr
        SetRight1              : IntPtr
        SetBottom              : IntPtr
        SetBottom1             : IntPtr
        SetTopLeftRadiusX      : IntPtr
        SetTopLeftRadiusX1     : IntPtr
        SetTopLeftRadiusY      : IntPtr
        SetTopLeftRadiusY1     : IntPtr
        SetTopRightRadiusX     : IntPtr
        SetTopRightRadiusX1    : IntPtr
        SetTopRightRadiusY     : IntPtr
        SetTopRightRadiusY1    : IntPtr
        SetBottomLeftRadiusX   : IntPtr
        SetBottomLeftRadiusX1  : IntPtr
        SetBottomLeftRadiusY   : IntPtr
        SetBottomLeftRadiusY1  : IntPtr
        SetBottomRightRadiusX  : IntPtr
        SetBottomRightRadiusX1 : IntPtr
        SetBottomRightRadiusY  : IntPtr
        SetBottomRightRadiusY1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionRectangleClip.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Changes the value of the Left property of a clip rectangle.
     * @remarks
     * This method fails if the <i>left</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     *       
     * 
     * If the Left property was previously animated, this method removes the animation and sets the Left property to the specified static value.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-setleft(float)
     */
    SetLeft(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes the value of the Left property of a clip rectangle.
     * @remarks
     * This method fails if the <i>left</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     *       
     * 
     * If the Left property was previously animated, this method removes the animation and sets the Left property to the specified static value.
     * @param {Float} left Type: <b>float</b>
     * 
     * The new value of the Left property, in pixels. This parameter has a numerical limit of -2^21 to 2^21. 
     *             The API accepts numbers outside of this range, but they are always clamped to this range.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-setleft(float)
     */
    SetLeft1(left) {
        result := ComCall(4, this, "float", left, "HRESULT")
        return result
    }

    /**
     * Changes the value of the Top property of a clip rectangle.
     * @remarks
     * This method fails if the <i>top</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     *       
     * 
     * If the Top property was previously animated, this method removes the animation and sets the Top property to the specified static value.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-settop(float)
     */
    SetTop(animation) {
        result := ComCall(5, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes the value of the Top property of a clip rectangle.
     * @remarks
     * This method fails if the <i>top</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     *       
     * 
     * If the Top property was previously animated, this method removes the animation and sets the Top property to the specified static value.
     * @param {Float} top Type: <b>float</b>
     * 
     * The new value of the Top property, in pixels. This parameter has a numerical limit of -2^21 to 2^21. 
     *             The API accepts numbers outside of this range, but they are always clamped to this range.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-settop(float)
     */
    SetTop1(top) {
        result := ComCall(6, this, "float", top, "HRESULT")
        return result
    }

    /**
     * Animates the value of the Right property of a clip rectangle.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the Right property unless this method is called again. If the Right  property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation object that determines how the value of the Right property changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-setright(idcompositionanimation)
     */
    SetRight(animation) {
        result := ComCall(7, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of the Right property of a clip rectangle.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the Right property unless this method is called again. If the Right  property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Float} right 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-setright(idcompositionanimation)
     */
    SetRight1(right) {
        result := ComCall(8, this, "float", right, "HRESULT")
        return result
    }

    /**
     * Changes the value of the Bottom property of a clip object.
     * @remarks
     * This method fails if the <i>bottom</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     *       
     * 
     * If the Bottom property was previously animated, this method removes the animation and sets the Bottom property to the specified static value.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. 
     *               See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-setbottom(float)
     */
    SetBottom(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes the value of the Bottom property of a clip object.
     * @remarks
     * This method fails if the <i>bottom</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     *       
     * 
     * If the Bottom property was previously animated, this method removes the animation and sets the Bottom property to the specified static value.
     * @param {Float} bottom Type: <b>float</b>
     * 
     * The new value of the Bottom property, in pixels. This parameter has a numerical limit of -2^21 to 2^21. 
     *             The API accepts numbers outside of this range, but they are always clamped to this range.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. 
     *               See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-setbottom(float)
     */
    SetBottom1(bottom) {
        result := ComCall(10, this, "float", bottom, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the TopLeftRadiusX property of this clip. The TopLeftRadiusX property specifies the x radius of the ellipse that rounds the top-left corner of the clip.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settopleftradiusx
     */
    SetTopLeftRadiusX(animation) {
        result := ComCall(11, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the TopLeftRadiusX property of this clip. The TopLeftRadiusX property specifies the x radius of the ellipse that rounds the top-left corner of the clip.
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settopleftradiusx
     */
    SetTopLeftRadiusX1(radius) {
        result := ComCall(12, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the TopLeftRadiusY property of this clip. The TopLeftRadiusY property specifies the y radius of the ellipse that rounds the top-left corner of the clip.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settopleftradiusy
     */
    SetTopLeftRadiusY(animation) {
        result := ComCall(13, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the TopLeftRadiusY property of this clip. The TopLeftRadiusY property specifies the y radius of the ellipse that rounds the top-left corner of the clip.
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settopleftradiusy
     */
    SetTopLeftRadiusY1(radius) {
        result := ComCall(14, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the TopRightRadiusX property of this clip. The TopRightRadiusX property specifies the x radius of the ellipse that rounds the top-right corner of the clip.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settoprightradiusx
     */
    SetTopRightRadiusX(animation) {
        result := ComCall(15, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the TopRightRadiusX property of this clip. The TopRightRadiusX property specifies the x radius of the ellipse that rounds the top-right corner of the clip.
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settoprightradiusx
     */
    SetTopRightRadiusX1(radius) {
        result := ComCall(16, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the TopRightRadiusY property of this clip. The TopRightRadiusY property specifies the y radius of the ellipse that rounds the top-right corner of the clip.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settoprightradiusy
     */
    SetTopRightRadiusY(animation) {
        result := ComCall(17, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the TopRightRadiusY property of this clip. The TopRightRadiusY property specifies the y radius of the ellipse that rounds the top-right corner of the clip.
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settoprightradiusy
     */
    SetTopRightRadiusY1(radius) {
        result := ComCall(18, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the BottomLeftRadiusX property of this clip. The BottomLeftRadiusX property specifies the x radius of the ellipse that rounds the lower-left corner of the clip.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomleftradiusx
     */
    SetBottomLeftRadiusX(animation) {
        result := ComCall(19, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the BottomLeftRadiusX property of this clip. The BottomLeftRadiusX property specifies the x radius of the ellipse that rounds the lower-left corner of the clip.
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomleftradiusx
     */
    SetBottomLeftRadiusX1(radius) {
        result := ComCall(20, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the BottomLeftRadiusY property of this clip. The BottomLeftRadiusY property specifies the y radius of the ellipse that rounds the lower-left corner of the clip.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomleftradiusy
     */
    SetBottomLeftRadiusY(animation) {
        result := ComCall(21, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the BottomLeftRadiusY property of this clip. The BottomLeftRadiusY property specifies the y radius of the ellipse that rounds the lower-left corner of the clip.
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomleftradiusy
     */
    SetBottomLeftRadiusY1(radius) {
        result := ComCall(22, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the BottomRightRadiusX property of this clip. The BottomRightRadiusX property specifies the x radius of the ellipse that rounds the lower-right corner of the clip.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomrightradiusx
     */
    SetBottomRightRadiusX(animation) {
        result := ComCall(23, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the BottomRightRadiusX property of this clip. The BottomRightRadiusX property specifies the x radius of the ellipse that rounds the lower-right corner of the clip.
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomrightradiusx
     */
    SetBottomRightRadiusX1(radius) {
        result := ComCall(24, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the BottomRightRadiusY property of this clip. The BottomRightRadiusY property specifies the y radius of the ellipse that rounds the lower-right corner of the clip.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomrightradiusy
     */
    SetBottomRightRadiusY(animation) {
        result := ComCall(25, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes or animates the value of the BottomRightRadiusY property of this clip. The BottomRightRadiusY property specifies the y radius of the ellipse that rounds the lower-right corner of the clip.
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomrightradiusy
     */
    SetBottomRightRadiusY1(radius) {
        result := ComCall(26, this, "float", radius, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionRectangleClip.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetLeft := CallbackCreate(GetMethod(implObj, "SetLeft"), flags, 2)
        this.vtbl.SetLeft1 := CallbackCreate(GetMethod(implObj, "SetLeft1"), flags, 2)
        this.vtbl.SetTop := CallbackCreate(GetMethod(implObj, "SetTop"), flags, 2)
        this.vtbl.SetTop1 := CallbackCreate(GetMethod(implObj, "SetTop1"), flags, 2)
        this.vtbl.SetRight := CallbackCreate(GetMethod(implObj, "SetRight"), flags, 2)
        this.vtbl.SetRight1 := CallbackCreate(GetMethod(implObj, "SetRight1"), flags, 2)
        this.vtbl.SetBottom := CallbackCreate(GetMethod(implObj, "SetBottom"), flags, 2)
        this.vtbl.SetBottom1 := CallbackCreate(GetMethod(implObj, "SetBottom1"), flags, 2)
        this.vtbl.SetTopLeftRadiusX := CallbackCreate(GetMethod(implObj, "SetTopLeftRadiusX"), flags, 2)
        this.vtbl.SetTopLeftRadiusX1 := CallbackCreate(GetMethod(implObj, "SetTopLeftRadiusX1"), flags, 2)
        this.vtbl.SetTopLeftRadiusY := CallbackCreate(GetMethod(implObj, "SetTopLeftRadiusY"), flags, 2)
        this.vtbl.SetTopLeftRadiusY1 := CallbackCreate(GetMethod(implObj, "SetTopLeftRadiusY1"), flags, 2)
        this.vtbl.SetTopRightRadiusX := CallbackCreate(GetMethod(implObj, "SetTopRightRadiusX"), flags, 2)
        this.vtbl.SetTopRightRadiusX1 := CallbackCreate(GetMethod(implObj, "SetTopRightRadiusX1"), flags, 2)
        this.vtbl.SetTopRightRadiusY := CallbackCreate(GetMethod(implObj, "SetTopRightRadiusY"), flags, 2)
        this.vtbl.SetTopRightRadiusY1 := CallbackCreate(GetMethod(implObj, "SetTopRightRadiusY1"), flags, 2)
        this.vtbl.SetBottomLeftRadiusX := CallbackCreate(GetMethod(implObj, "SetBottomLeftRadiusX"), flags, 2)
        this.vtbl.SetBottomLeftRadiusX1 := CallbackCreate(GetMethod(implObj, "SetBottomLeftRadiusX1"), flags, 2)
        this.vtbl.SetBottomLeftRadiusY := CallbackCreate(GetMethod(implObj, "SetBottomLeftRadiusY"), flags, 2)
        this.vtbl.SetBottomLeftRadiusY1 := CallbackCreate(GetMethod(implObj, "SetBottomLeftRadiusY1"), flags, 2)
        this.vtbl.SetBottomRightRadiusX := CallbackCreate(GetMethod(implObj, "SetBottomRightRadiusX"), flags, 2)
        this.vtbl.SetBottomRightRadiusX1 := CallbackCreate(GetMethod(implObj, "SetBottomRightRadiusX1"), flags, 2)
        this.vtbl.SetBottomRightRadiusY := CallbackCreate(GetMethod(implObj, "SetBottomRightRadiusY"), flags, 2)
        this.vtbl.SetBottomRightRadiusY1 := CallbackCreate(GetMethod(implObj, "SetBottomRightRadiusY1"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetLeft)
        CallbackFree(this.vtbl.SetLeft1)
        CallbackFree(this.vtbl.SetTop)
        CallbackFree(this.vtbl.SetTop1)
        CallbackFree(this.vtbl.SetRight)
        CallbackFree(this.vtbl.SetRight1)
        CallbackFree(this.vtbl.SetBottom)
        CallbackFree(this.vtbl.SetBottom1)
        CallbackFree(this.vtbl.SetTopLeftRadiusX)
        CallbackFree(this.vtbl.SetTopLeftRadiusX1)
        CallbackFree(this.vtbl.SetTopLeftRadiusY)
        CallbackFree(this.vtbl.SetTopLeftRadiusY1)
        CallbackFree(this.vtbl.SetTopRightRadiusX)
        CallbackFree(this.vtbl.SetTopRightRadiusX1)
        CallbackFree(this.vtbl.SetTopRightRadiusY)
        CallbackFree(this.vtbl.SetTopRightRadiusY1)
        CallbackFree(this.vtbl.SetBottomLeftRadiusX)
        CallbackFree(this.vtbl.SetBottomLeftRadiusX1)
        CallbackFree(this.vtbl.SetBottomLeftRadiusY)
        CallbackFree(this.vtbl.SetBottomLeftRadiusY1)
        CallbackFree(this.vtbl.SetBottomRightRadiusX)
        CallbackFree(this.vtbl.SetBottomRightRadiusX1)
        CallbackFree(this.vtbl.SetBottomRightRadiusY)
        CallbackFree(this.vtbl.SetBottomRightRadiusY1)
    }
}
