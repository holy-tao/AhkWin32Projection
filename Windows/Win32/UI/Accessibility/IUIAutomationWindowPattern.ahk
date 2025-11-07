#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the fundamental functionality of a window.
 * @remarks
 * 
  * Examples of controls that support this control pattern include top-level application windows, multiple-document interface (MDI) child windows, and modal dialog boxes.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationwindowpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationWindowPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationWindowPattern
     * @type {Guid}
     */
    static IID => Guid("{0faef453-9208-43ef-bbb2-3b485177864f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Close", "WaitForInputIdle", "SetWindowVisualState", "get_CurrentCanMaximize", "get_CurrentCanMinimize", "get_CurrentIsModal", "get_CurrentIsTopmost", "get_CurrentWindowVisualState", "get_CurrentWindowInteractionState", "get_CachedCanMaximize", "get_CachedCanMinimize", "get_CachedIsModal", "get_CachedIsTopmost", "get_CachedWindowVisualState", "get_CachedWindowInteractionState"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-close
     */
    Close() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Waits until the specified process has finished processing its initial input and is waiting for user input with no input pending, or until the time-out interval has elapsed.
     * @param {Integer} milliseconds 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-waitforinputidle
     */
    WaitForInputIdle(milliseconds) {
        result := ComCall(4, this, "int", milliseconds, "int*", &success := 0, "HRESULT")
        return success
    }

    /**
     * 
     * @param {Integer} state 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-setwindowvisualstate
     */
    SetWindowVisualState(state) {
        result := ComCall(5, this, "int", state, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentcanmaximize
     */
    get_CurrentCanMaximize() {
        result := ComCall(6, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentcanminimize
     */
    get_CurrentCanMinimize() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentismodal
     */
    get_CurrentIsModal() {
        result := ComCall(8, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentistopmost
     */
    get_CurrentIsTopmost() {
        result := ComCall(9, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentwindowvisualstate
     */
    get_CurrentWindowVisualState() {
        result := ComCall(10, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentwindowinteractionstate
     */
    get_CurrentWindowInteractionState() {
        result := ComCall(11, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedcanmaximize
     */
    get_CachedCanMaximize() {
        result := ComCall(12, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedcanminimize
     */
    get_CachedCanMinimize() {
        result := ComCall(13, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedismodal
     */
    get_CachedIsModal() {
        result := ComCall(14, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedistopmost
     */
    get_CachedIsTopmost() {
        result := ComCall(15, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedwindowvisualstate
     */
    get_CachedWindowVisualState() {
        result := ComCall(16, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedwindowinteractionstate
     */
    get_CachedWindowInteractionState() {
        result := ComCall(17, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}
