#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionClip.ahk

/**
 * Represents a clip object that restricts the rendering of a visual subtree to the specified rectangular region. Optionally, the clip object may have rounded corners specified.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionrectangleclip
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionRectangleClip extends IDCompositionClip{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionRectangleClip
     * @type {Guid}
     */
    static IID => Guid("{9842ad7d-d9cf-4908-aed7-48b51da5e7c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLeft", "SetLeft1", "SetTop", "SetTop1", "SetRight", "SetRight1", "SetBottom", "SetBottom1", "SetTopLeftRadiusX", "SetTopLeftRadiusX1", "SetTopLeftRadiusY", "SetTopLeftRadiusY1", "SetTopRightRadiusX", "SetTopRightRadiusX1", "SetTopRightRadiusY", "SetTopRightRadiusY1", "SetBottomLeftRadiusX", "SetBottomLeftRadiusX1", "SetBottomLeftRadiusY", "SetBottomLeftRadiusY1", "SetBottomRightRadiusX", "SetBottomRightRadiusX1", "SetBottomRightRadiusY", "SetBottomRightRadiusY1"]

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
}
