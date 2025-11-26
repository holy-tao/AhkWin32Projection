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
     * @type {Float} 
     */
    CurrentHorizontalScrollPercent {
        get => this.get_CurrentHorizontalScrollPercent()
    }

    /**
     * @type {Float} 
     */
    CurrentVerticalScrollPercent {
        get => this.get_CurrentVerticalScrollPercent()
    }

    /**
     * @type {Float} 
     */
    CurrentHorizontalViewSize {
        get => this.get_CurrentHorizontalViewSize()
    }

    /**
     * @type {Float} 
     */
    CurrentVerticalViewSize {
        get => this.get_CurrentVerticalViewSize()
    }

    /**
     * @type {BOOL} 
     */
    CurrentHorizontallyScrollable {
        get => this.get_CurrentHorizontallyScrollable()
    }

    /**
     * @type {BOOL} 
     */
    CurrentVerticallyScrollable {
        get => this.get_CurrentVerticallyScrollable()
    }

    /**
     * @type {Float} 
     */
    CachedHorizontalScrollPercent {
        get => this.get_CachedHorizontalScrollPercent()
    }

    /**
     * @type {Float} 
     */
    CachedVerticalScrollPercent {
        get => this.get_CachedVerticalScrollPercent()
    }

    /**
     * @type {Float} 
     */
    CachedHorizontalViewSize {
        get => this.get_CachedHorizontalViewSize()
    }

    /**
     * @type {Float} 
     */
    CachedVerticalViewSize {
        get => this.get_CachedVerticalViewSize()
    }

    /**
     * @type {BOOL} 
     */
    CachedHorizontallyScrollable {
        get => this.get_CachedHorizontallyScrollable()
    }

    /**
     * @type {BOOL} 
     */
    CachedVerticallyScrollable {
        get => this.get_CachedVerticallyScrollable()
    }

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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currenthorizontalscrollpercent
     */
    get_CurrentHorizontalScrollPercent() {
        result := ComCall(5, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currentverticalscrollpercent
     */
    get_CurrentVerticalScrollPercent() {
        result := ComCall(6, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currenthorizontalviewsize
     */
    get_CurrentHorizontalViewSize() {
        result := ComCall(7, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currentverticalviewsize
     */
    get_CurrentVerticalViewSize() {
        result := ComCall(8, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currenthorizontallyscrollable
     */
    get_CurrentHorizontallyScrollable() {
        result := ComCall(9, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currentverticallyscrollable
     */
    get_CurrentVerticallyScrollable() {
        result := ComCall(10, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedhorizontalscrollpercent
     */
    get_CachedHorizontalScrollPercent() {
        result := ComCall(11, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedverticalscrollpercent
     */
    get_CachedVerticalScrollPercent() {
        result := ComCall(12, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedhorizontalviewsize
     */
    get_CachedHorizontalViewSize() {
        result := ComCall(13, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedverticalviewsize
     */
    get_CachedVerticalViewSize() {
        result := ComCall(14, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedhorizontallyscrollable
     */
    get_CachedHorizontallyScrollable() {
        result := ComCall(15, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedverticallyscrollable
     */
    get_CachedVerticallyScrollable() {
        result := ComCall(16, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}
