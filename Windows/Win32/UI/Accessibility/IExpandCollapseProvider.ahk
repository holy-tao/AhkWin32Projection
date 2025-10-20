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
     * 
     * @returns {HRESULT} 
     */
    Expand() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Collapse() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    get_ExpandCollapseState(pRetVal) {
        result := ComCall(5, this, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
