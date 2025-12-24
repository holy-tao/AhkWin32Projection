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
     * @type {BOOL} 
     */
    CurrentCanMaximize {
        get => this.get_CurrentCanMaximize()
    }

    /**
     * @type {BOOL} 
     */
    CurrentCanMinimize {
        get => this.get_CurrentCanMinimize()
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsModal {
        get => this.get_CurrentIsModal()
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsTopmost {
        get => this.get_CurrentIsTopmost()
    }

    /**
     * @type {Integer} 
     */
    CurrentWindowVisualState {
        get => this.get_CurrentWindowVisualState()
    }

    /**
     * @type {Integer} 
     */
    CurrentWindowInteractionState {
        get => this.get_CurrentWindowInteractionState()
    }

    /**
     * @type {BOOL} 
     */
    CachedCanMaximize {
        get => this.get_CachedCanMaximize()
    }

    /**
     * @type {BOOL} 
     */
    CachedCanMinimize {
        get => this.get_CachedCanMinimize()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsModal {
        get => this.get_CachedIsModal()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsTopmost {
        get => this.get_CachedIsTopmost()
    }

    /**
     * @type {Integer} 
     */
    CachedWindowVisualState {
        get => this.get_CachedWindowVisualState()
    }

    /**
     * @type {Integer} 
     */
    CachedWindowInteractionState {
        get => this.get_CachedWindowInteractionState()
    }

    /**
     * Closes the window.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-close
     */
    Close() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Causes the calling code to block for the specified time or until the associated process enters an idle state, whichever completes first.
     * @param {Integer} milliseconds Type: <b>int</b>
     * 
     * The amount of time, in milliseconds, to wait for the associated process to become idle.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Receives the result: <b>TRUE</b> if the window has entered the idle state, or <b>FALSE</b> if the time-out occurred.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-waitforinputidle
     */
    WaitForInputIdle(milliseconds) {
        result := ComCall(4, this, "int", milliseconds, "int*", &success := 0, "HRESULT")
        return success
    }

    /**
     * Minimizes, maximizes, or restores the window.
     * @param {Integer} state 
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-setwindowvisualstate
     */
    SetWindowVisualState(state) {
        result := ComCall(5, this, "int", state, "HRESULT")
        return result
    }

    /**
     * Indicates whether the window can be maximized.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentcanmaximize
     */
    get_CurrentCanMaximize() {
        result := ComCall(6, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the window can be minimized.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentcanminimize
     */
    get_CurrentCanMinimize() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the window is modal.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentismodal
     */
    get_CurrentIsModal() {
        result := ComCall(8, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the window is the topmost element in the z-order.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentistopmost
     */
    get_CurrentIsTopmost() {
        result := ComCall(9, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the visual state of the window; that is, whether it is in the normal, maximized, or minimized state.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentwindowvisualstate
     */
    get_CurrentWindowVisualState() {
        result := ComCall(10, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the current state of the window for the purposes of user interaction.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentwindowinteractionstate
     */
    get_CurrentWindowInteractionState() {
        result := ComCall(11, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the window can be maximized.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedcanmaximize
     */
    get_CachedCanMaximize() {
        result := ComCall(12, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the window can be minimized.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedcanminimize
     */
    get_CachedCanMinimize() {
        result := ComCall(13, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the window is modal.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedismodal
     */
    get_CachedIsModal() {
        result := ComCall(14, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the window is the topmost element in the z-order.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedistopmost
     */
    get_CachedIsTopmost() {
        result := ComCall(15, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates the visual state of the window; that is, whether it is in the normal, maximized, or minimized state.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedwindowvisualstate
     */
    get_CachedWindowVisualState() {
        result := ComCall(16, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates the current state of the window for the purposes of user interaction.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedwindowinteractionstate
     */
    get_CachedWindowInteractionState() {
        result := ComCall(17, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}
