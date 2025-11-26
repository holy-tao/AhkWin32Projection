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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Move", "Resize", "Rotate", "get_CanMove", "get_CanResize", "get_CanRotate"]

    /**
     * @type {BOOL} 
     */
    CanMove {
        get => this.get_CanMove()
    }

    /**
     * @type {BOOL} 
     */
    CanResize {
        get => this.get_CanResize()
    }

    /**
     * @type {BOOL} 
     */
    CanRotate {
        get => this.get_CanRotate()
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider-move
     */
    Move(x, y) {
        result := ComCall(3, this, "double", x, "double", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider-resize
     */
    Resize(width, height) {
        result := ComCall(4, this, "double", width, "double", height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} degrees 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider-rotate
     */
    Rotate(degrees) {
        result := ComCall(5, this, "double", degrees, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider-get_canmove
     */
    get_CanMove() {
        result := ComCall(6, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider-get_canresize
     */
    get_CanResize() {
        result := ComCall(7, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider-get_canrotate
     */
    get_CanRotate() {
        result := ComCall(8, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
