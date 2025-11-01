#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that visually expands to display content, and collapses to hide content.
 * @remarks
 * 
  * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingexpandcollapse">ExpandCollapse</a> control pattern.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iexpandcollapseprovider
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-expand
     */
    Expand() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-collapse
     */
    Collapse() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-get_expandcollapsestate
     */
    get_ExpandCollapseState(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }
}
