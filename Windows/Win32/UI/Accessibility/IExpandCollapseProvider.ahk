#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that visually expands to display content, and collapses to hide content.
 * @remarks
 * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingexpandcollapse">ExpandCollapse</a> control pattern.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nn-uiautomationcore-iexpandcollapseprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IExpandCollapseProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExpandCollapseProvider
     * @type {Guid}
     */
    static IID => Guid("{d847d3a5-cab0-4a98-8c32-ecb45c59ad24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Expand", "Collapse", "get_ExpandCollapseState"]

    /**
     * @type {Integer} 
     */
    ExpandCollapseState {
        get => this.get_ExpandCollapseState()
    }

    /**
     * Displays all child nodes, controls, or content of the control.
     * @remarks
     * This is a blocking method that returns after the control has been expanded.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-expand
     */
    Expand() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Hides all child nodes, controls, or content of this element.
     * @remarks
     * This is a blocking method that returns after the element has been collapsed.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-collapse
     */
    Collapse() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates the state, expanded or collapsed, of the control.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-get_expandcollapsestate
     */
    get_ExpandCollapseState() {
        result := ComCall(5, this, "int*", &pRetVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pRetVal
    }
}
