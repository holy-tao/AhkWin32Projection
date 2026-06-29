#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ExpandCollapseState.ahk" { ExpandCollapseState }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a control that can visually expand to display content, and collapse to hide content.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationexpandcollapsepattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationExpandCollapsePattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationExpandCollapsePattern
     * @type {Guid}
     */
    static IID := Guid("{619be086-1f4e-4ee4-bafa-210128738730}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationExpandCollapsePattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Expand                         : IntPtr
        Collapse                       : IntPtr
        get_CurrentExpandCollapseState : IntPtr
        get_CachedExpandCollapseState  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationExpandCollapsePattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ExpandCollapseState} 
     */
    CurrentExpandCollapseState {
        get => this.get_CurrentExpandCollapseState()
    }

    /**
     * @type {ExpandCollapseState} 
     */
    CachedExpandCollapseState {
        get => this.get_CachedExpandCollapseState()
    }

    /**
     * Displays all child nodes, controls, or content of the element.
     * @remarks
     * This is a blocking method that returns after the element has been expanded.
     * 
     * There are cases when a element that is marked as a leaf node might not know whether it has children until either the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationexpandcollapsepattern-collapse">IUIAutomationExpandCollapsePattern::Collapse</a> or the <b>IUIAutomationExpandCollapsePattern::Expand</b> method is called. This behavior is possible with a tree view control that does delayed loading of its child items. For example, Microsoft Windows Explorer might display the expand icon for a node even though there are currently no child items; when the icon is clicked, the control polls for child items, finds none, and removes the expand icon. In these cases clients should listen for a property-changed event on the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationexpandcollapsepattern-get_currentexpandcollapsestate">IUIAutomationExpandCollapsePattern::CurrentExpandCollapseState</a> property.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationexpandcollapsepattern-expand
     */
    Expand() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Hides all child nodes, controls, or content of the element.
     * @remarks
     * This is a blocking method that returns after the element has been collapsed.
     * 
     * There are cases when a element that is marked as a leaf node might not know whether it has children until either the <b>IUIAutomationExpandCollapsePattern::Collapse</b> or the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationexpandcollapsepattern-expand">IUIAutomationExpandCollapsePattern::Expand</a> method is called. This behavior is possible with a tree view control that does delayed loading of its child items. For example, Microsoft Windows Explorer might display the expand icon for a node even though there are currently no child items; when the icon is clicked, the control polls for child items, finds none, and removes the expand icon. In these cases clients should listen for a property-changed event on the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationexpandcollapsepattern-get_currentexpandcollapsestate">IUIAutomationExpandCollapsePattern::CurrentExpandCollapseState</a> property.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationexpandcollapsepattern-collapse
     */
    Collapse() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates the state, expanded or collapsed, of the element.
     * @returns {ExpandCollapseState} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationexpandcollapsepattern-get_currentexpandcollapsestate
     */
    get_CurrentExpandCollapseState() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates the state, expanded or collapsed, of the element.
     * @returns {ExpandCollapseState} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationexpandcollapsepattern-get_cachedexpandcollapsestate
     */
    get_CachedExpandCollapseState() {
        result := ComCall(6, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationExpandCollapsePattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Expand := CallbackCreate(GetMethod(implObj, "Expand"), flags, 1)
        this.vtbl.Collapse := CallbackCreate(GetMethod(implObj, "Collapse"), flags, 1)
        this.vtbl.get_CurrentExpandCollapseState := CallbackCreate(GetMethod(implObj, "get_CurrentExpandCollapseState"), flags, 2)
        this.vtbl.get_CachedExpandCollapseState := CallbackCreate(GetMethod(implObj, "get_CachedExpandCollapseState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Expand)
        CallbackFree(this.vtbl.Collapse)
        CallbackFree(this.vtbl.get_CurrentExpandCollapseState)
        CallbackFree(this.vtbl.get_CachedExpandCollapseState)
    }
}
