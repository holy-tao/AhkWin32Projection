#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ScrollAmount.ahk" { ScrollAmount }

/**
 * Provides access to a control that acts as a scrollable container for a collection of child elements.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationscrollpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationScrollPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationScrollPattern
     * @type {Guid}
     */
    static IID := Guid("{88f4d42a-e881-459d-a77c-73bbbb7e02dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationScrollPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Scroll                             : IntPtr
        SetScrollPercent                   : IntPtr
        get_CurrentHorizontalScrollPercent : IntPtr
        get_CurrentVerticalScrollPercent   : IntPtr
        get_CurrentHorizontalViewSize      : IntPtr
        get_CurrentVerticalViewSize        : IntPtr
        get_CurrentHorizontallyScrollable  : IntPtr
        get_CurrentVerticallyScrollable    : IntPtr
        get_CachedHorizontalScrollPercent  : IntPtr
        get_CachedVerticalScrollPercent    : IntPtr
        get_CachedHorizontalViewSize       : IntPtr
        get_CachedVerticalViewSize         : IntPtr
        get_CachedHorizontallyScrollable   : IntPtr
        get_CachedVerticallyScrollable     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationScrollPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Scrolls the visible region of the content area horizontally and vertically. (IUIAutomationScrollPattern.Scroll)
     * @param {ScrollAmount} horizontalAmount 
     * @param {ScrollAmount} verticalAmount 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-scroll
     */
    Scroll(horizontalAmount, verticalAmount) {
        result := ComCall(3, this, ScrollAmount, horizontalAmount, ScrollAmount, verticalAmount, "HRESULT")
        return result
    }

    /**
     * Sets the horizontal and vertical scroll positions as a percentage of the total content area within the UI Automation element.
     * @remarks
     * This method is useful only when the content area of the control is larger than the visible region.
     * @param {Float} horizontalPercent Type: <b>double</b>
     * 
     * The percentage of the total horizontal content area, or <b>UIA_ScrollPatternNoScroll</b> if the horizontal position is not to be set.
     * @param {Float} verticalPercent Type: <b>double</b>
     * 
     * The percentage of the total vertical content area, or <b>UIA_ScrollPatternNoScroll</b> if the vertical position is not to be set.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-setscrollpercent
     */
    SetScrollPercent(horizontalPercent, verticalPercent) {
        result := ComCall(4, this, "double", horizontalPercent, "double", verticalPercent, "HRESULT")
        return result
    }

    /**
     * Retrieves the horizontal scroll position.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currenthorizontalscrollpercent
     */
    get_CurrentHorizontalScrollPercent() {
        result := ComCall(5, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the vertical scroll position.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currentverticalscrollpercent
     */
    get_CurrentVerticalScrollPercent() {
        result := ComCall(6, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the horizontal size of the viewable region of a scrollable element.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currenthorizontalviewsize
     */
    get_CurrentHorizontalViewSize() {
        result := ComCall(7, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the vertical size of the viewable region of a scrollable element.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currentverticalviewsize
     */
    get_CurrentVerticalViewSize() {
        result := ComCall(8, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element can scroll horizontally.
     * @remarks
     * This property can be dynamic. For example, the content area of the element might not be larger than the current viewable area, meaning that the property is <b>FALSE</b>. However, resizing the element or adding child items can increase the bounds of the content area beyond the viewable area, making the property <b>TRUE</b>.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currenthorizontallyscrollable
     */
    get_CurrentHorizontallyScrollable() {
        result := ComCall(9, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element can scroll vertically.
     * @remarks
     * This property can be dynamic. For example, the content area of the element might not be larger than the current viewable area, meaning that the property is <b>FALSE</b>. However, resizing the element or adding child items can increase the bounds of the content area beyond the viewable area, making the property <b>TRUE</b>.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_currentverticallyscrollable
     */
    get_CurrentVerticallyScrollable() {
        result := ComCall(10, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached horizontal scroll position.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedhorizontalscrollpercent
     */
    get_CachedHorizontalScrollPercent() {
        result := ComCall(11, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached vertical scroll position.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedverticalscrollpercent
     */
    get_CachedVerticalScrollPercent() {
        result := ComCall(12, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached horizontal size of the viewable region of a scrollable element.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedhorizontalviewsize
     */
    get_CachedHorizontalViewSize() {
        result := ComCall(13, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached vertical size of the viewable region of a scrollable element.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedverticalviewsize
     */
    get_CachedVerticalViewSize() {
        result := ComCall(14, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element can scroll horizontally.
     * @remarks
     * This property can be dynamic. For example, the content area of the element might not be larger than the current viewable area, meaning that the property is <b>FALSE</b>. However, resizing the element or adding child items can increase the bounds of the content area beyond the viewable area, making the property <b>TRUE</b>.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedhorizontallyscrollable
     */
    get_CachedHorizontallyScrollable() {
        result := ComCall(15, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element can scroll vertically.
     * @remarks
     * This property can be dynamic. For example, the content area of the element might not be larger than the current viewable area, meaning that the property is <b>FALSE</b>. However, resizing the element or adding child items can increase the bounds of the content area beyond the viewable area, making the property <b>TRUE</b>.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationscrollpattern-get_cachedverticallyscrollable
     */
    get_CachedVerticallyScrollable() {
        result := ComCall(16, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationScrollPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Scroll := CallbackCreate(GetMethod(implObj, "Scroll"), flags, 3)
        this.vtbl.SetScrollPercent := CallbackCreate(GetMethod(implObj, "SetScrollPercent"), flags, 3)
        this.vtbl.get_CurrentHorizontalScrollPercent := CallbackCreate(GetMethod(implObj, "get_CurrentHorizontalScrollPercent"), flags, 2)
        this.vtbl.get_CurrentVerticalScrollPercent := CallbackCreate(GetMethod(implObj, "get_CurrentVerticalScrollPercent"), flags, 2)
        this.vtbl.get_CurrentHorizontalViewSize := CallbackCreate(GetMethod(implObj, "get_CurrentHorizontalViewSize"), flags, 2)
        this.vtbl.get_CurrentVerticalViewSize := CallbackCreate(GetMethod(implObj, "get_CurrentVerticalViewSize"), flags, 2)
        this.vtbl.get_CurrentHorizontallyScrollable := CallbackCreate(GetMethod(implObj, "get_CurrentHorizontallyScrollable"), flags, 2)
        this.vtbl.get_CurrentVerticallyScrollable := CallbackCreate(GetMethod(implObj, "get_CurrentVerticallyScrollable"), flags, 2)
        this.vtbl.get_CachedHorizontalScrollPercent := CallbackCreate(GetMethod(implObj, "get_CachedHorizontalScrollPercent"), flags, 2)
        this.vtbl.get_CachedVerticalScrollPercent := CallbackCreate(GetMethod(implObj, "get_CachedVerticalScrollPercent"), flags, 2)
        this.vtbl.get_CachedHorizontalViewSize := CallbackCreate(GetMethod(implObj, "get_CachedHorizontalViewSize"), flags, 2)
        this.vtbl.get_CachedVerticalViewSize := CallbackCreate(GetMethod(implObj, "get_CachedVerticalViewSize"), flags, 2)
        this.vtbl.get_CachedHorizontallyScrollable := CallbackCreate(GetMethod(implObj, "get_CachedHorizontallyScrollable"), flags, 2)
        this.vtbl.get_CachedVerticallyScrollable := CallbackCreate(GetMethod(implObj, "get_CachedVerticallyScrollable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Scroll)
        CallbackFree(this.vtbl.SetScrollPercent)
        CallbackFree(this.vtbl.get_CurrentHorizontalScrollPercent)
        CallbackFree(this.vtbl.get_CurrentVerticalScrollPercent)
        CallbackFree(this.vtbl.get_CurrentHorizontalViewSize)
        CallbackFree(this.vtbl.get_CurrentVerticalViewSize)
        CallbackFree(this.vtbl.get_CurrentHorizontallyScrollable)
        CallbackFree(this.vtbl.get_CurrentVerticallyScrollable)
        CallbackFree(this.vtbl.get_CachedHorizontalScrollPercent)
        CallbackFree(this.vtbl.get_CachedVerticalScrollPercent)
        CallbackFree(this.vtbl.get_CachedHorizontalViewSize)
        CallbackFree(this.vtbl.get_CachedVerticalViewSize)
        CallbackFree(this.vtbl.get_CachedHorizontallyScrollable)
        CallbackFree(this.vtbl.get_CachedVerticallyScrollable)
    }
}
