#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that act as scrollable containers for a collection of child objects.
 * @remarks
 * 
  * Implemented on a Microsoft UI Automation provider that must 
  *             support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingscroll">Scroll</a> control pattern.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iscrollprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IScrollProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollProvider
     * @type {Guid}
     */
    static IID => Guid("{b38b8077-1fc3-42a5-8cae-d40c2215055a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Scroll", "SetScrollPercent", "get_HorizontalScrollPercent", "get_VerticalScrollPercent", "get_HorizontalViewSize", "get_VerticalViewSize", "get_HorizontallyScrollable", "get_VerticallyScrollable"]

    /**
     * 
     * @param {Integer} horizontalAmount 
     * @param {Integer} verticalAmount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-scroll
     */
    Scroll(horizontalAmount, verticalAmount) {
        result := ComCall(3, this, "int", horizontalAmount, "int", verticalAmount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} horizontalPercent 
     * @param {Float} verticalPercent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-setscrollpercent
     */
    SetScrollPercent(horizontalPercent, verticalPercent) {
        result := ComCall(4, this, "double", horizontalPercent, "double", verticalPercent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_horizontalscrollpercent
     */
    get_HorizontalScrollPercent(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "double*" : "ptr"

        result := ComCall(5, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_verticalscrollpercent
     */
    get_VerticalScrollPercent(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "double*" : "ptr"

        result := ComCall(6, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_horizontalviewsize
     */
    get_HorizontalViewSize(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "double*" : "ptr"

        result := ComCall(7, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_verticalviewsize
     */
    get_VerticalViewSize(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "double*" : "ptr"

        result := ComCall(8, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_horizontallyscrollable
     */
    get_HorizontallyScrollable(pRetVal) {
        result := ComCall(9, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_verticallyscrollable
     */
    get_VerticallyScrollable(pRetVal) {
        result := ComCall(10, this, "ptr", pRetVal, "HRESULT")
        return result
    }
}
