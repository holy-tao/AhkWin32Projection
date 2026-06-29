#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationElement2.ahk" { IUIAutomationElement2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Extends the IUIAutomationElement2 interface.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement3
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationElement3 extends IUIAutomationElement2 {
    /**
     * The interface identifier for IUIAutomationElement3
     * @type {Guid}
     */
    static IID := Guid("{8471df34-aee0-4a01-a7de-7db9af12c296}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationElement3 interfaces
    */
    struct Vtbl extends IUIAutomationElement2.Vtbl {
        ShowContextMenu         : IntPtr
        get_CurrentIsPeripheral : IntPtr
        get_CachedIsPeripheral  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationElement3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsPeripheral {
        get => this.get_CurrentIsPeripheral()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsPeripheral {
        get => this.get_CachedIsPeripheral()
    }

    /**
     * Programmatically invokes a context menu on the target element. (IUIAutomationElement3.ShowContextMenu)
     * @remarks
     * This method returns   an error code if the context menu could not be invoked. If no context menu is available directly on the element on which it was invoked, calling this method might invoke a context menu on the Microsoft UI Automation parent of the current item.
     * 
     * The context menus themselves fire menu opened / closed events when they are invoked and dismissed.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement3-showcontextmenu
     */
    ShowContextMenu() {
        result := ComCall(91, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the current peripheral UI indicator for the element.
     * @remarks
     * When the <b>IsPeripheral</b> property is <b>TRUE</b>, a client application can't assume that focus was taken by the element even if it's currently keyboard-interactive.
     * 
     * This property is relevant for these control types:
     * 
     * <ul>
     * <li><b>UIA_GroupControlTypeId</b></li>
     * <li><b>UIA_MenuControlTypeId</b></li>
     * <li><b>UIA_PaneControlTypeId</b></li>
     * <li><b>UIA_ToolBarControlTypeId</b></li>
     * <li><b>UIA_ToolTipControlTypeId</b></li>
     * <li><b>UIA_WindowControlTypeId</b></li>
     * <li><b>UIA_CustomControlTypeId</b></li>
     * </ul>
     * The appearance of peripheral UI often triggers one of these events, if the peripheral UI supports one of the relevant patterns:
     * 
     * <ul>
     * <li><b>WindowOpened</b> (<b>UIA_Window_WindowOpenedEventId</b>)</li>
     * <li><b>MenuOpened</b> (<b>UIA_MenuOpenedEventId</b>)</li>
     * <li><b>ToolTipOpened</b> (<b>UIA_ToolTipOpenedEventId</b>)</li>
     * </ul>
     * When client applications that are assistive technologies handle one of these events, the client should check the value of <b>CurrentIsPeripheral</b>. If the value is <b>TRUE</b>, the client may need to provide an alternative representation of the peripheral UI that the user can reach with a single action, because the client can't use changed focus as an indicator of new UI or a UI of interest. The peripheral UI won't otherwise exist in the control view, tab sequence and so on. A client is guaranteed that only one peripheral UI item exists in the overall tree at any one time, opening another would close the first one automatically.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement3-get_currentisperipheral
     */
    get_CurrentIsPeripheral() {
        result := ComCall(92, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached peripheral UI indicator for the element.
     * @remarks
     * When the <b>IsPeripheral</b> property is <b>TRUE</b>, a client application can't assume that focus was taken by the element even if it's currently keyboard-interactive.
     * 
     * This property is relevant for these control types:
     * 
     * <ul>
     * <li><b>UIA_GroupControlTypeId</b></li>
     * <li><b>UIA_MenuControlTypeId</b></li>
     * <li><b>UIA_PaneControlTypeId</b></li>
     * <li><b>UIA_ToolBarControlTypeId</b></li>
     * <li><b>UIA_ToolTipControlTypeId</b></li>
     * <li><b>UIA_WindowControlTypeId</b></li>
     * <li><b>UIA_CustomControlTypeId</b></li>
     * </ul>
     * The appearance of peripheral UI often triggers one of these events, if the peripheral UI supports one of the relevant patterns:
     * 
     * <ul>
     * <li><b>WindowOpened</b> (<b>UIA_Window_WindowOpenedEventId</b>)</li>
     * <li><b>MenuOpened</b> (<b>UIA_MenuOpenedEventId</b>)</li>
     * <li><b>ToolTipOpened</b> (<b>UIA_ToolTipOpenedEventId</b>)</li>
     * </ul>
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement3-get_cachedisperipheral
     */
    get_CachedIsPeripheral() {
        result := ComCall(93, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationElement3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShowContextMenu := CallbackCreate(GetMethod(implObj, "ShowContextMenu"), flags, 1)
        this.vtbl.get_CurrentIsPeripheral := CallbackCreate(GetMethod(implObj, "get_CurrentIsPeripheral"), flags, 2)
        this.vtbl.get_CachedIsPeripheral := CallbackCreate(GetMethod(implObj, "get_CachedIsPeripheral"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShowContextMenu)
        CallbackFree(this.vtbl.get_CurrentIsPeripheral)
        CallbackFree(this.vtbl.get_CachedIsPeripheral)
    }
}
