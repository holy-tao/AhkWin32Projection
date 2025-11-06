#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the fundamental window-based functionality of a control.
 * @remarks
 * 
  * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingwindow">Window</a> control pattern.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iwindowprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IWindowProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowProvider
     * @type {Guid}
     */
    static IID => Guid("{987df77b-db06-4d77-8f8a-86a9c3bb90b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetVisualState", "Close", "WaitForInputIdle", "get_CanMaximize", "get_CanMinimize", "get_IsModal", "get_WindowVisualState", "get_WindowInteractionState", "get_IsTopmost"]

    /**
     * 
     * @param {Integer} state 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-setvisualstate
     */
    SetVisualState(state) {
        result := ComCall(3, this, "int", state, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Waits until the specified process has finished processing its initial input and is waiting for user input with no input pending, or until the time-out interval has elapsed.
     * @param {Integer} milliseconds 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-waitforinputidle
     */
    WaitForInputIdle(milliseconds) {
        result := ComCall(5, this, "int", milliseconds, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_canmaximize
     */
    get_CanMaximize() {
        result := ComCall(6, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_canminimize
     */
    get_CanMinimize() {
        result := ComCall(7, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_ismodal
     */
    get_IsModal() {
        result := ComCall(8, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_windowvisualstate
     */
    get_WindowVisualState() {
        result := ComCall(9, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_windowinteractionstate
     */
    get_WindowInteractionState() {
        result := ComCall(10, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_istopmost
     */
    get_IsTopmost() {
        result := ComCall(11, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
