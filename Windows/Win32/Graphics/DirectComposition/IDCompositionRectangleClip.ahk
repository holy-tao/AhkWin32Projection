#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionClip.ahk

/**
 * Represents a clip object that restricts the rendering of a visual subtree to the specified rectangular region. Optionally, the clip object may have rounded corners specified.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionrectangleclip
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
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-setleft(float)
     */
    SetLeft(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} left 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-setleft(float)
     */
    SetLeft1(left) {
        result := ComCall(4, this, "float", left, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-settop(float)
     */
    SetTop(animation) {
        result := ComCall(5, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} top 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-settop(float)
     */
    SetTop1(top) {
        result := ComCall(6, this, "float", top, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-setright(idcompositionanimation)
     */
    SetRight(animation) {
        result := ComCall(7, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} right 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-setright(idcompositionanimation)
     */
    SetRight1(right) {
        result := ComCall(8, this, "float", right, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-setbottom(float)
     */
    SetBottom(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} bottom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrectangleclip-setbottom(float)
     */
    SetBottom1(bottom) {
        result := ComCall(10, this, "float", bottom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settopleftradiusx
     */
    SetTopLeftRadiusX(animation) {
        result := ComCall(11, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settopleftradiusx
     */
    SetTopLeftRadiusX1(radius) {
        result := ComCall(12, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settopleftradiusy
     */
    SetTopLeftRadiusY(animation) {
        result := ComCall(13, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settopleftradiusy
     */
    SetTopLeftRadiusY1(radius) {
        result := ComCall(14, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settoprightradiusx
     */
    SetTopRightRadiusX(animation) {
        result := ComCall(15, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settoprightradiusx
     */
    SetTopRightRadiusX1(radius) {
        result := ComCall(16, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settoprightradiusy
     */
    SetTopRightRadiusY(animation) {
        result := ComCall(17, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-settoprightradiusy
     */
    SetTopRightRadiusY1(radius) {
        result := ComCall(18, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomleftradiusx
     */
    SetBottomLeftRadiusX(animation) {
        result := ComCall(19, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomleftradiusx
     */
    SetBottomLeftRadiusX1(radius) {
        result := ComCall(20, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomleftradiusy
     */
    SetBottomLeftRadiusY(animation) {
        result := ComCall(21, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomleftradiusy
     */
    SetBottomLeftRadiusY1(radius) {
        result := ComCall(22, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomrightradiusx
     */
    SetBottomRightRadiusX(animation) {
        result := ComCall(23, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomrightradiusx
     */
    SetBottomRightRadiusX1(radius) {
        result := ComCall(24, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomrightradiusy
     */
    SetBottomRightRadiusY(animation) {
        result := ComCall(25, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/directcomp/idcompositionrectangleclip-setbottomrightradiusy
     */
    SetBottomRightRadiusY1(radius) {
        result := ComCall(26, this, "float", radius, "HRESULT")
        return result
    }
}
