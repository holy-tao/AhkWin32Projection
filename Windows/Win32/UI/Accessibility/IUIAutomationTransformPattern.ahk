#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that can be moved, resized, or rotated.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtransformpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTransformPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationTransformPattern
     * @type {Guid}
     */
    static IID => Guid("{a9b55844-a55d-4ef0-926d-569c16ff89bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Move", "Resize", "Rotate", "get_CurrentCanMove", "get_CurrentCanResize", "get_CurrentCanRotate", "get_CachedCanMove", "get_CachedCanResize", "get_CachedCanRotate"]

    /**
     * @type {BOOL} 
     */
    CurrentCanMove {
        get => this.get_CurrentCanMove()
    }

    /**
     * @type {BOOL} 
     */
    CurrentCanResize {
        get => this.get_CurrentCanResize()
    }

    /**
     * @type {BOOL} 
     */
    CurrentCanRotate {
        get => this.get_CurrentCanRotate()
    }

    /**
     * @type {BOOL} 
     */
    CachedCanMove {
        get => this.get_CachedCanMove()
    }

    /**
     * @type {BOOL} 
     */
    CachedCanResize {
        get => this.get_CachedCanResize()
    }

    /**
     * @type {BOOL} 
     */
    CachedCanRotate {
        get => this.get_CachedCanRotate()
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-move
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
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-resize
     */
    Resize(width, height) {
        result := ComCall(4, this, "double", width, "double", height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} degrees 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-rotate
     */
    Rotate(degrees) {
        result := ComCall(5, this, "double", degrees, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_currentcanmove
     */
    get_CurrentCanMove() {
        result := ComCall(6, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_currentcanresize
     */
    get_CurrentCanResize() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_currentcanrotate
     */
    get_CurrentCanRotate() {
        result := ComCall(8, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_cachedcanmove
     */
    get_CachedCanMove() {
        result := ComCall(9, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_cachedcanresize
     */
    get_CachedCanResize() {
        result := ComCall(10, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_cachedcanrotate
     */
    get_CachedCanRotate() {
        result := ComCall(11, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}
