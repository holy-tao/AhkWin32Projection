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
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetLeft(animation) {
        result := ComCall(3, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} left 
     * @returns {HRESULT} 
     */
    SetLeft(left) {
        result := ComCall(4, this, "float", left, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetTop(animation) {
        result := ComCall(5, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} top 
     * @returns {HRESULT} 
     */
    SetTop(top) {
        result := ComCall(6, this, "float", top, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetRight(animation) {
        result := ComCall(7, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} right 
     * @returns {HRESULT} 
     */
    SetRight(right) {
        result := ComCall(8, this, "float", right, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetBottom(animation) {
        result := ComCall(9, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} bottom 
     * @returns {HRESULT} 
     */
    SetBottom(bottom) {
        result := ComCall(10, this, "float", bottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetTopLeftRadiusX(animation) {
        result := ComCall(11, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     */
    SetTopLeftRadiusX(radius) {
        result := ComCall(12, this, "float", radius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetTopLeftRadiusY(animation) {
        result := ComCall(13, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     */
    SetTopLeftRadiusY(radius) {
        result := ComCall(14, this, "float", radius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetTopRightRadiusX(animation) {
        result := ComCall(15, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     */
    SetTopRightRadiusX(radius) {
        result := ComCall(16, this, "float", radius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetTopRightRadiusY(animation) {
        result := ComCall(17, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     */
    SetTopRightRadiusY(radius) {
        result := ComCall(18, this, "float", radius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetBottomLeftRadiusX(animation) {
        result := ComCall(19, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     */
    SetBottomLeftRadiusX(radius) {
        result := ComCall(20, this, "float", radius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetBottomLeftRadiusY(animation) {
        result := ComCall(21, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     */
    SetBottomLeftRadiusY(radius) {
        result := ComCall(22, this, "float", radius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetBottomRightRadiusX(animation) {
        result := ComCall(23, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     */
    SetBottomRightRadiusX(radius) {
        result := ComCall(24, this, "float", radius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetBottomRightRadiusY(animation) {
        result := ComCall(25, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     */
    SetBottomRightRadiusY(radius) {
        result := ComCall(26, this, "float", radius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
