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
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_currentcanmove
     */
    get_CurrentCanMove(retVal) {
        result := ComCall(6, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_currentcanresize
     */
    get_CurrentCanResize(retVal) {
        result := ComCall(7, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_currentcanrotate
     */
    get_CurrentCanRotate(retVal) {
        result := ComCall(8, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_cachedcanmove
     */
    get_CachedCanMove(retVal) {
        result := ComCall(9, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_cachedcanresize
     */
    get_CachedCanResize(retVal) {
        result := ComCall(10, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_cachedcanrotate
     */
    get_CachedCanRotate(retVal) {
        result := ComCall(11, this, "ptr", retVal, "HRESULT")
        return result
    }
}
