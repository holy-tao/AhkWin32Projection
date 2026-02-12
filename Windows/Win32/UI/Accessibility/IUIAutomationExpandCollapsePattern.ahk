#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that can visually expand to display content, and collapse to hide content.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nn-uiautomationclient-iuiautomationexpandcollapsepattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationExpandCollapsePattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationExpandCollapsePattern
     * @type {Guid}
     */
    static IID => Guid("{619be086-1f4e-4ee4-bafa-210128738730}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Expand", "Collapse", "get_CurrentExpandCollapseState", "get_CachedExpandCollapseState"]

    /**
     * @type {Integer} 
     */
    CurrentExpandCollapseState {
        get => this.get_CurrentExpandCollapseState()
    }

    /**
     * @type {Integer} 
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
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationexpandcollapsepattern-expand
     */
    Expand() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationexpandcollapsepattern-collapse
     */
    Collapse() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a value that indicates the state, expanded or collapsed, of the element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationexpandcollapsepattern-get_currentexpandcollapsestate
     */
    get_CurrentExpandCollapseState() {
        result := ComCall(5, this, "int*", &retVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retVal
    }

    /**
     * Retrieves a cached value that indicates the state, expanded or collapsed, of the element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationexpandcollapsepattern-get_cachedexpandcollapsestate
     */
    get_CachedExpandCollapseState() {
        result := ComCall(6, this, "int*", &retVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retVal
    }
}
