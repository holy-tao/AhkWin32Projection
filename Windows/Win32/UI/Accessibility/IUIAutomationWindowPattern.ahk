#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WindowInteractionState.ahk" { WindowInteractionState }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WindowVisualState.ahk" { WindowVisualState }

/**
 * Provides access to the fundamental functionality of a window.
 * @remarks
 * Examples of controls that support this control pattern include top-level application windows, multiple-document interface (MDI) child windows, and modal dialog boxes.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationwindowpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationWindowPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationWindowPattern
     * @type {Guid}
     */
    static IID := Guid("{0faef453-9208-43ef-bbb2-3b485177864f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationWindowPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Close                             : IntPtr
        WaitForInputIdle                  : IntPtr
        SetWindowVisualState              : IntPtr
        get_CurrentCanMaximize            : IntPtr
        get_CurrentCanMinimize            : IntPtr
        get_CurrentIsModal                : IntPtr
        get_CurrentIsTopmost              : IntPtr
        get_CurrentWindowVisualState      : IntPtr
        get_CurrentWindowInteractionState : IntPtr
        get_CachedCanMaximize             : IntPtr
        get_CachedCanMinimize             : IntPtr
        get_CachedIsModal                 : IntPtr
        get_CachedIsTopmost               : IntPtr
        get_CachedWindowVisualState       : IntPtr
        get_CachedWindowInteractionState  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationWindowPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {WindowVisualState} 
     */
    CurrentWindowVisualState {
        get => this.get_CurrentWindowVisualState()
    }

    /**
     * @type {WindowInteractionState} 
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
     * @type {WindowVisualState} 
     */
    CachedWindowVisualState {
        get => this.get_CachedWindowVisualState()
    }

    /**
     * @type {WindowInteractionState} 
     */
    CachedWindowInteractionState {
        get => this.get_CachedWindowInteractionState()
    }

    /**
     * Closes the window.
     * @remarks
     * When called on a split pane control, this method closes the pane and removes the associated split. This method may also close all other panes, depending on implementation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-close
     */
    Close() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Causes the calling code to block for the specified time or until the associated process enters an idle state, whichever completes first. (IUIAutomationWindowPattern.WaitForInputIdle)
     * @param {Integer} milliseconds Type: <b>int</b>
     * 
     * The amount of time, in milliseconds, to wait for the associated process to become idle.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Receives the result: <b>TRUE</b> if the window has entered the idle state, or <b>FALSE</b> if the time-out occurred.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-waitforinputidle
     */
    WaitForInputIdle(milliseconds) {
        result := ComCall(4, this, "int", milliseconds, BOOL.Ptr, &success := 0, "HRESULT")
        return success
    }

    /**
     * Minimizes, maximizes, or restores the window.
     * @param {WindowVisualState} state 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-setwindowvisualstate
     */
    SetWindowVisualState(state) {
        result := ComCall(5, this, WindowVisualState, state, "HRESULT")
        return result
    }

    /**
     * Indicates whether the window can be maximized. (IUIAutomationWindowPattern.get_CurrentCanMaximize)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentcanmaximize
     */
    get_CurrentCanMaximize() {
        result := ComCall(6, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the window can be minimized. (IUIAutomationWindowPattern.get_CurrentCanMinimize)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentcanminimize
     */
    get_CurrentCanMinimize() {
        result := ComCall(7, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the window is modal. (IUIAutomationWindowPattern.get_CurrentIsModal)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentismodal
     */
    get_CurrentIsModal() {
        result := ComCall(8, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the window is the topmost element in the z-order. (IUIAutomationWindowPattern.get_CurrentIsTopmost)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentistopmost
     */
    get_CurrentIsTopmost() {
        result := ComCall(9, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the visual state of the window; that is, whether it is in the normal, maximized, or minimized state.
     * @returns {WindowVisualState} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentwindowvisualstate
     */
    get_CurrentWindowVisualState() {
        result := ComCall(10, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the current state of the window for the purposes of user interaction.
     * @returns {WindowInteractionState} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_currentwindowinteractionstate
     */
    get_CurrentWindowInteractionState() {
        result := ComCall(11, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the window can be maximized.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedcanmaximize
     */
    get_CachedCanMaximize() {
        result := ComCall(12, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the window can be minimized.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedcanminimize
     */
    get_CachedCanMinimize() {
        result := ComCall(13, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the window is modal.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedismodal
     */
    get_CachedIsModal() {
        result := ComCall(14, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the window is the topmost element in the z-order.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedistopmost
     */
    get_CachedIsTopmost() {
        result := ComCall(15, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates the visual state of the window; that is, whether it is in the normal, maximized, or minimized state.
     * @returns {WindowVisualState} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedwindowvisualstate
     */
    get_CachedWindowVisualState() {
        result := ComCall(16, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates the current state of the window for the purposes of user interaction.
     * @returns {WindowInteractionState} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationwindowpattern-get_cachedwindowinteractionstate
     */
    get_CachedWindowInteractionState() {
        result := ComCall(17, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationWindowPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.WaitForInputIdle := CallbackCreate(GetMethod(implObj, "WaitForInputIdle"), flags, 3)
        this.vtbl.SetWindowVisualState := CallbackCreate(GetMethod(implObj, "SetWindowVisualState"), flags, 2)
        this.vtbl.get_CurrentCanMaximize := CallbackCreate(GetMethod(implObj, "get_CurrentCanMaximize"), flags, 2)
        this.vtbl.get_CurrentCanMinimize := CallbackCreate(GetMethod(implObj, "get_CurrentCanMinimize"), flags, 2)
        this.vtbl.get_CurrentIsModal := CallbackCreate(GetMethod(implObj, "get_CurrentIsModal"), flags, 2)
        this.vtbl.get_CurrentIsTopmost := CallbackCreate(GetMethod(implObj, "get_CurrentIsTopmost"), flags, 2)
        this.vtbl.get_CurrentWindowVisualState := CallbackCreate(GetMethod(implObj, "get_CurrentWindowVisualState"), flags, 2)
        this.vtbl.get_CurrentWindowInteractionState := CallbackCreate(GetMethod(implObj, "get_CurrentWindowInteractionState"), flags, 2)
        this.vtbl.get_CachedCanMaximize := CallbackCreate(GetMethod(implObj, "get_CachedCanMaximize"), flags, 2)
        this.vtbl.get_CachedCanMinimize := CallbackCreate(GetMethod(implObj, "get_CachedCanMinimize"), flags, 2)
        this.vtbl.get_CachedIsModal := CallbackCreate(GetMethod(implObj, "get_CachedIsModal"), flags, 2)
        this.vtbl.get_CachedIsTopmost := CallbackCreate(GetMethod(implObj, "get_CachedIsTopmost"), flags, 2)
        this.vtbl.get_CachedWindowVisualState := CallbackCreate(GetMethod(implObj, "get_CachedWindowVisualState"), flags, 2)
        this.vtbl.get_CachedWindowInteractionState := CallbackCreate(GetMethod(implObj, "get_CachedWindowInteractionState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.WaitForInputIdle)
        CallbackFree(this.vtbl.SetWindowVisualState)
        CallbackFree(this.vtbl.get_CurrentCanMaximize)
        CallbackFree(this.vtbl.get_CurrentCanMinimize)
        CallbackFree(this.vtbl.get_CurrentIsModal)
        CallbackFree(this.vtbl.get_CurrentIsTopmost)
        CallbackFree(this.vtbl.get_CurrentWindowVisualState)
        CallbackFree(this.vtbl.get_CurrentWindowInteractionState)
        CallbackFree(this.vtbl.get_CachedCanMaximize)
        CallbackFree(this.vtbl.get_CachedCanMinimize)
        CallbackFree(this.vtbl.get_CachedIsModal)
        CallbackFree(this.vtbl.get_CachedIsTopmost)
        CallbackFree(this.vtbl.get_CachedWindowVisualState)
        CallbackFree(this.vtbl.get_CachedWindowInteractionState)
    }
}
