#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WindowInteractionState.ahk" { WindowInteractionState }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WindowVisualState.ahk" { WindowVisualState }

/**
 * Provides access to the fundamental window-based functionality of a control.
 * @remarks
 * Implemented on a Microsoft UI Automation provider that must support the [Window Control Pattern](/windows/win32/winauto/uiauto-implementingwindow) control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iwindowprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IWindowProvider extends IUnknown {
    /**
     * The interface identifier for IWindowProvider
     * @type {Guid}
     */
    static IID := Guid("{987df77b-db06-4d77-8f8a-86a9c3bb90b9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetVisualState             : IntPtr
        Close                      : IntPtr
        WaitForInputIdle           : IntPtr
        get_CanMaximize            : IntPtr
        get_CanMinimize            : IntPtr
        get_IsModal                : IntPtr
        get_WindowVisualState      : IntPtr
        get_WindowInteractionState : IntPtr
        get_IsTopmost              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {WindowVisualState} 
     */
    WindowVisualState {
        get => this.get_WindowVisualState()
    }

    /**
     * @type {WindowInteractionState} 
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
     * @param {WindowVisualState} state Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-windowvisualstate">WindowVisualState</a></b>
     * 
     * The state of the window.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-setvisualstate
     */
    SetVisualState(state) {
        result := ComCall(3, this, WindowVisualState, state, "HRESULT")
        return result
    }

    /**
     * Attempts to close the window.
     * @remarks
     * <b>IWindowProvider::Close</b> must return immediately without blocking.
     *         
     * 
     * <b>IWindowProvider::Close</b> raises the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_Window_WindowClosedEventId</a> 
     *         event. 
     *         If possible, the event should be raised after the control has completed its associated action. 
     *         
     * 
     * When called on a split pane control, this method will close the pane and remove 
     *         the associated split. 
     * 
     * This method may also close all other panes depending on implementation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Causes the calling code to block for the specified time or until the associated process enters an idle state, whichever completes first. (IWindowProvider.WaitForInputIdle)
     * @remarks
     * This method is typically used in conjunction with the handling of a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_Window_WindowOpenedEventId</a>.
     *         The implementation is dependent on the underlying application framework; 
     *         therefore this method might return some time after the window is ready for user input. 
     *         The calling code should not rely on this method to ascertain exactly when the window has become idle. 
     *         Use the value of <i>pRetVal</i> to determine if the window is ready for input or if the method timed out.
     * @param {Integer} milliseconds Type: <b>int</b>
     * 
     * The amount of time, in milliseconds, to wait for the associated process to become idle. 
     *                 The maximum is Int32.MaxValue.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Receives <b>TRUE</b> if the window has entered the idle state; <b>FALSE</b> if the time-out occurred. 
     * 				This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-waitforinputidle
     */
    WaitForInputIdle(milliseconds) {
        result := ComCall(5, this, "int", milliseconds, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the window can be maximized. (IWindowProvider.get_CanMaximize)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_canmaximize
     */
    get_CanMaximize() {
        result := ComCall(6, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the window can be minimized. (IWindowProvider.get_CanMinimize)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_canminimize
     */
    get_CanMinimize() {
        result := ComCall(7, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the window is modal. (IWindowProvider.get_IsModal)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_ismodal
     */
    get_IsModal() {
        result := ComCall(8, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the visual state of the window; that is, whether the window is normal (restored), minimized, or maximized.
     * @returns {WindowVisualState} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_windowvisualstate
     */
    get_WindowVisualState() {
        result := ComCall(9, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the current state of the window for the purposes of user interaction.
     * @returns {WindowInteractionState} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_windowinteractionstate
     */
    get_WindowInteractionState() {
        result := ComCall(10, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the window is the topmost element in the z-order. (IWindowProvider.get_IsTopmost)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_istopmost
     */
    get_IsTopmost() {
        result := ComCall(11, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (IWindowProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetVisualState := CallbackCreate(GetMethod(implObj, "SetVisualState"), flags, 2)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.WaitForInputIdle := CallbackCreate(GetMethod(implObj, "WaitForInputIdle"), flags, 3)
        this.vtbl.get_CanMaximize := CallbackCreate(GetMethod(implObj, "get_CanMaximize"), flags, 2)
        this.vtbl.get_CanMinimize := CallbackCreate(GetMethod(implObj, "get_CanMinimize"), flags, 2)
        this.vtbl.get_IsModal := CallbackCreate(GetMethod(implObj, "get_IsModal"), flags, 2)
        this.vtbl.get_WindowVisualState := CallbackCreate(GetMethod(implObj, "get_WindowVisualState"), flags, 2)
        this.vtbl.get_WindowInteractionState := CallbackCreate(GetMethod(implObj, "get_WindowInteractionState"), flags, 2)
        this.vtbl.get_IsTopmost := CallbackCreate(GetMethod(implObj, "get_IsTopmost"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetVisualState)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.WaitForInputIdle)
        CallbackFree(this.vtbl.get_CanMaximize)
        CallbackFree(this.vtbl.get_CanMinimize)
        CallbackFree(this.vtbl.get_IsModal)
        CallbackFree(this.vtbl.get_WindowVisualState)
        CallbackFree(this.vtbl.get_WindowInteractionState)
        CallbackFree(this.vtbl.get_IsTopmost)
    }
}
