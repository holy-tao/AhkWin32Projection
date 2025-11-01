#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that acts as a scrollable container for a collection of child elements.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationscrollpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationScrollPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationScrollPattern
     * @type {Guid}
     */
    static IID => Guid("{88f4d42a-e881-459d-a77c-73bbbb7e02dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Scroll", "SetScrollPercent", "get_CurrentHorizontalScrollPercent", "get_CurrentVerticalScrollPercent", "get_CurrentHorizontalViewSize", "get_CurrentVerticalViewSize", "get_CurrentHorizontallyScrollable", "get_CurrentVerticallyScrollable", "get_CachedHorizontalScrollPercent", "get_CachedVerticalScrollPercent", "get_CachedHorizontalViewSize", "get_CachedVerticalViewSize", "get_CachedHorizontallyScrollable", "get_CachedVerticallyScrollable"]

    /**
     * 
     * @param {Integer} horizontalAmount 
     * @param {Integer} verticalAmount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-scroll
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
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-setscrollpercent
     */
    SetScrollPercent(horizontalPercent, verticalPercent) {
        result := ComCall(4, this, "double", horizontalPercent, "double", verticalPercent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currenthorizontalscrollpercent
     */
    get_CurrentHorizontalScrollPercent(retVal) {
        retValMarshal := retVal is VarRef ? "double*" : "ptr"

        result := ComCall(5, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currentverticalscrollpercent
     */
    get_CurrentVerticalScrollPercent(retVal) {
        retValMarshal := retVal is VarRef ? "double*" : "ptr"

        result := ComCall(6, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currenthorizontalviewsize
     */
    get_CurrentHorizontalViewSize(retVal) {
        retValMarshal := retVal is VarRef ? "double*" : "ptr"

        result := ComCall(7, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currentverticalviewsize
     */
    get_CurrentVerticalViewSize(retVal) {
        retValMarshal := retVal is VarRef ? "double*" : "ptr"

        result := ComCall(8, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currenthorizontallyscrollable
     */
    get_CurrentHorizontallyScrollable(retVal) {
        result := ComCall(9, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currentverticallyscrollable
     */
    get_CurrentVerticallyScrollable(retVal) {
        result := ComCall(10, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedhorizontalscrollpercent
     */
    get_CachedHorizontalScrollPercent(retVal) {
        retValMarshal := retVal is VarRef ? "double*" : "ptr"

        result := ComCall(11, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedverticalscrollpercent
     */
    get_CachedVerticalScrollPercent(retVal) {
        retValMarshal := retVal is VarRef ? "double*" : "ptr"

        result := ComCall(12, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedhorizontalviewsize
     */
    get_CachedHorizontalViewSize(retVal) {
        retValMarshal := retVal is VarRef ? "double*" : "ptr"

        result := ComCall(13, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedverticalviewsize
     */
    get_CachedVerticalViewSize(retVal) {
        retValMarshal := retVal is VarRef ? "double*" : "ptr"

        result := ComCall(14, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedhorizontallyscrollable
     */
    get_CachedHorizontallyScrollable(retVal) {
        result := ComCall(15, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedverticallyscrollable
     */
    get_CachedVerticallyScrollable(retVal) {
        result := ComCall(16, this, "ptr", retVal, "HRESULT")
        return result
    }
}
