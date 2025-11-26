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
     * @type {BOOL} 
     */
    CanMaximize {
        get => this.get_CanMaximize()
    }

    /**
     * @type {BOOL} 
     */
    CanMinimize {
        get => this.get_CanMinimize()
    }

    /**
     * @type {BOOL} 
     */
    IsModal {
        get => this.get_IsModal()
    }

    /**
     * @type {Integer} 
     */
    WindowVisualState {
        get => this.get_WindowVisualState()
    }

    /**
     * @type {Integer} 
     */
    WindowInteractionState {
        get => this.get_WindowInteractionState()
    }

    /**
     * @type {BOOL} 
     */
    IsTopmost {
        get => this.get_IsTopmost()
    }

    /**
     * Changes the visual state of the window. For example, minimizes or maximizes it.
     * @param {Integer} state Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-windowvisualstate">WindowVisualState</a></b>
     * 
     * The state of the window.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iwindowprovider-setvisualstate
     */
    SetVisualState(state) {
        result := ComCall(3, this, "int", state, "HRESULT")
        return result
    }

    /**
     * Attempts to close the window.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iwindowprovider-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Causes the calling code to block for the specified time or until the associated process enters an idle state, whichever completes first.
     * @param {Integer} milliseconds Type: <b>int</b>
     * 
     * The amount of time, in milliseconds, to wait for the associated process to become idle. 
     *                 The maximum is Int32.MaxValue.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Receives <b>TRUE</b> if the window has entered the idle state; <b>FALSE</b> if the time-out occurred. 
     * 				This parameter is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iwindowprovider-waitforinputidle
     */
    WaitForInputIdle(milliseconds) {
        result := ComCall(5, this, "int", milliseconds, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the window can be maximized.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iwindowprovider-get_canmaximize
     */
    get_CanMaximize() {
        result := ComCall(6, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the window can be minimized.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iwindowprovider-get_canminimize
     */
    get_CanMinimize() {
        result := ComCall(7, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the window is modal.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iwindowprovider-get_ismodal
     */
    get_IsModal() {
        result := ComCall(8, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the visual state of the window; that is, whether the window is normal (restored), minimized, or maximized.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iwindowprovider-get_windowvisualstate
     */
    get_WindowVisualState() {
        result := ComCall(9, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the current state of the window for the purposes of user interaction.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iwindowprovider-get_windowinteractionstate
     */
    get_WindowInteractionState() {
        result := ComCall(10, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the window is the topmost element in the z-order.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iwindowprovider-get_istopmost
     */
    get_IsTopmost() {
        result := ComCall(11, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
