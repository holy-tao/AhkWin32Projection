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
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} The following table shows the possible return values for this function.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wait was satisfied successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wait was terminated because the time-out interval elapsed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-waitforinputidle
     */
    WaitForInputIdle(milliseconds, pRetVal) {
        result := ComCall(5, this, "int", milliseconds, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_canmaximize
     */
    get_CanMaximize(pRetVal) {
        result := ComCall(6, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_canminimize
     */
    get_CanMinimize(pRetVal) {
        result := ComCall(7, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_ismodal
     */
    get_IsModal(pRetVal) {
        result := ComCall(8, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_windowvisualstate
     */
    get_WindowVisualState(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_windowinteractionstate
     */
    get_WindowInteractionState(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_istopmost
     */
    get_IsTopmost(pRetVal) {
        result := ComCall(11, this, "ptr", pRetVal, "HRESULT")
        return result
    }
}
