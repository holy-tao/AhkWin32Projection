#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that can be moved, resized, and/or rotated within a two-dimensional space.
 * @remarks
 * 
  * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtransform">Transform</a> control pattern.
  *             
  * 
  * Support for this  control pattern is not limited to objects on the desktop. 
  *             This  control pattern must also be implemented by the children of a 
  *             container object as long as the children can be moved, resized, or rotated freely within the boundaries of the container.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-itransformprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ITransformProvider extends IUnknown{
    /**
     * The interface identifier for ITransformProvider
     * @type {Guid}
     */
    static IID => Guid("{6829ddc4-4f91-4ffa-b86f-bd3e2987cb4c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    Move(x, y) {
        result := ComCall(3, this, "double", x, "double", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {HRESULT} 
     */
    Resize(width, height) {
        result := ComCall(4, this, "double", width, "double", height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} degrees 
     * @returns {HRESULT} 
     */
    Rotate(degrees) {
        result := ComCall(5, this, "double", degrees, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     */
    get_CanMove(pRetVal) {
        result := ComCall(6, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     */
    get_CanResize(pRetVal) {
        result := ComCall(7, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     */
    get_CanRotate(pRetVal) {
        result := ComCall(8, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
