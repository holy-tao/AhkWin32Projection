#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ScrollAmount.ahk" { ScrollAmount }

/**
 * Provides access to controls that act as scrollable containers for a collection of child objects.
 * @remarks
 * Implemented on a Microsoft UI Automation provider that must 
 *             support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingscroll">Scroll</a> control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iscrollprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IScrollProvider extends IUnknown {
    /**
     * The interface identifier for IScrollProvider
     * @type {Guid}
     */
    static IID := Guid("{b38b8077-1fc3-42a5-8cae-d40c2215055a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IScrollProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Scroll                      : IntPtr
        SetScrollPercent            : IntPtr
        get_HorizontalScrollPercent : IntPtr
        get_VerticalScrollPercent   : IntPtr
        get_HorizontalViewSize      : IntPtr
        get_VerticalViewSize        : IntPtr
        get_HorizontallyScrollable  : IntPtr
        get_VerticallyScrollable    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IScrollProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
     */
    HorizontalScrollPercent {
        get => this.get_HorizontalScrollPercent()
    }

    /**
     * @type {Float} 
     */
    VerticalScrollPercent {
        get => this.get_VerticalScrollPercent()
    }

    /**
     * @type {Float} 
     */
    HorizontalViewSize {
        get => this.get_HorizontalViewSize()
    }

    /**
     * @type {Float} 
     */
    VerticalViewSize {
        get => this.get_VerticalViewSize()
    }

    /**
     * @type {BOOL} 
     */
    HorizontallyScrollable {
        get => this.get_HorizontallyScrollable()
    }

    /**
     * @type {BOOL} 
     */
    VerticallyScrollable {
        get => this.get_VerticallyScrollable()
    }

    /**
     * Scrolls the visible region of the content area horizontally and vertically. (IScrollProvider.Scroll)
     * @param {ScrollAmount} horizontalAmount 
     * @param {ScrollAmount} verticalAmount 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-scroll
     */
    Scroll(horizontalAmount, verticalAmount) {
        result := ComCall(3, this, ScrollAmount, horizontalAmount, ScrollAmount, verticalAmount, "HRESULT")
        return result
    }

    /**
     * Sets the horizontal and vertical scroll position as a percentage of the total content area within the control.
     * @remarks
     * This method is only useful when the content area of the control is 
     *             larger than the visible region.
     * @param {Float} horizontalPercent Type: <b>double</b>
     * 
     * The horizontal position as a percentage of the content area's total range, or <b>UIA_ScrollPatternNoScroll</b> if there is no horizontal scrolling.
     * @param {Float} verticalPercent Type: <b>double</b>
     * 
     * The vertical position as a percentage of the content area's total range, or <b>UIA_ScrollPatternNoScroll</b> if there is no vertical scrolling.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-setscrollpercent
     */
    SetScrollPercent(horizontalPercent, verticalPercent) {
        result := ComCall(4, this, "double", horizontalPercent, "double", verticalPercent, "HRESULT")
        return result
    }

    /**
     * Specifies the horizontal scroll position.
     * @remarks
     * The horizontal scroll position can be reported as <b>UIA_ScrollPatternNoScroll</b> if no valid position is available; for example, if the window does not have a horizontal scroll bar.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_horizontalscrollpercent
     */
    get_HorizontalScrollPercent() {
        result := ComCall(5, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the vertical scroll position.
     * @remarks
     * The vertical scroll position can be reported as <b>UIA_ScrollPatternNoScroll</b> if no valid position is available; for example, if the window does not have a vertical scroll bar.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_verticalscrollpercent
     */
    get_VerticalScrollPercent() {
        result := ComCall(6, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the horizontal size of the viewable region.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_horizontalviewsize
     */
    get_HorizontalViewSize() {
        result := ComCall(7, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the vertical size of the viewable region.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_verticalviewsize
     */
    get_VerticalViewSize() {
        result := ComCall(8, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the control can scroll horizontally.
     * @remarks
     * This property can be dynamic. For example, the content area of the control 
     *         might not be larger than the current viewable area, meaning <b>IScrollProvider::HorizontallyScrollable</b> 
     *         is <b>FALSE</b>. However, either resizing the control or adding child items may increase the bounds of the 
     *         content area beyond the viewable area, meaning <b>IScrollProvider::HorizontallyScrollable</b> is <b>TRUE</b>.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_horizontallyscrollable
     */
    get_HorizontallyScrollable() {
        result := ComCall(9, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the control can scroll vertically.
     * @remarks
     * This property can be dynamic. For example, the content area of the control 
     *         might not be larger than the viewable area, meaning <b>IScrollProvider::VerticallyScrollable</b> 
     *         is <b>FALSE</b>. However, resizing the control or adding child items may increase the bounds of the 
     *         content area beyond the viewable area, meaning that <b>IScrollProvider::VerticallyScrollable</b> is <b>TRUE</b>.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_verticallyscrollable
     */
    get_VerticallyScrollable() {
        result := ComCall(10, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (IScrollProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Scroll := CallbackCreate(GetMethod(implObj, "Scroll"), flags, 3)
        this.vtbl.SetScrollPercent := CallbackCreate(GetMethod(implObj, "SetScrollPercent"), flags, 3)
        this.vtbl.get_HorizontalScrollPercent := CallbackCreate(GetMethod(implObj, "get_HorizontalScrollPercent"), flags, 2)
        this.vtbl.get_VerticalScrollPercent := CallbackCreate(GetMethod(implObj, "get_VerticalScrollPercent"), flags, 2)
        this.vtbl.get_HorizontalViewSize := CallbackCreate(GetMethod(implObj, "get_HorizontalViewSize"), flags, 2)
        this.vtbl.get_VerticalViewSize := CallbackCreate(GetMethod(implObj, "get_VerticalViewSize"), flags, 2)
        this.vtbl.get_HorizontallyScrollable := CallbackCreate(GetMethod(implObj, "get_HorizontallyScrollable"), flags, 2)
        this.vtbl.get_VerticallyScrollable := CallbackCreate(GetMethod(implObj, "get_VerticallyScrollable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Scroll)
        CallbackFree(this.vtbl.SetScrollPercent)
        CallbackFree(this.vtbl.get_HorizontalScrollPercent)
        CallbackFree(this.vtbl.get_VerticalScrollPercent)
        CallbackFree(this.vtbl.get_HorizontalViewSize)
        CallbackFree(this.vtbl.get_VerticalViewSize)
        CallbackFree(this.vtbl.get_HorizontallyScrollable)
        CallbackFree(this.vtbl.get_VerticallyScrollable)
    }
}
