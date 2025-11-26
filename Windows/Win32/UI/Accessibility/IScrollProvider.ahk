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
     * Scrolls the visible region of the content area horizontally and vertically.
     * @param {Integer} horizontalAmount 
     * @param {Integer} verticalAmount 
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iscrollprovider-scroll
     */
    Scroll(horizontalAmount, verticalAmount) {
        result := ComCall(3, this, "int", horizontalAmount, "int", verticalAmount, "HRESULT")
        return result
    }

    /**
     * Sets the horizontal and vertical scroll position as a percentage of the total content area within the control.
     * @param {Float} horizontalPercent Type: <b>double</b>
     * 
     * The horizontal position as a percentage of the content area's total range, or <b>UIA_ScrollPatternNoScroll</b> if there is no horizontal scrolling.
     * @param {Float} verticalPercent Type: <b>double</b>
     * 
     * The vertical position as a percentage of the content area's total range, or <b>UIA_ScrollPatternNoScroll</b> if there is no vertical scrolling.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iscrollprovider-setscrollpercent
     */
    SetScrollPercent(horizontalPercent, verticalPercent) {
        result := ComCall(4, this, "double", horizontalPercent, "double", verticalPercent, "HRESULT")
        return result
    }

    /**
     * Specifies the horizontal scroll position.
     * @remarks
     * 
     * The horizontal scroll position can be reported as <b>UIA_ScrollPatternNoScroll</b> if no valid position is available; for example, if the window does not have a horizontal scroll bar.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iscrollprovider-get_horizontalscrollpercent
     */
    get_HorizontalScrollPercent() {
        result := ComCall(5, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the vertical scroll position.
     * @remarks
     * 
     * The vertical scroll position can be reported as <b>UIA_ScrollPatternNoScroll</b> if no valid position is available; for example, if the window does not have a vertical scroll bar.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iscrollprovider-get_verticalscrollpercent
     */
    get_VerticalScrollPercent() {
        result := ComCall(6, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the horizontal size of the viewable region.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iscrollprovider-get_horizontalviewsize
     */
    get_HorizontalViewSize() {
        result := ComCall(7, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the vertical size of the viewable region.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iscrollprovider-get_verticalviewsize
     */
    get_VerticalViewSize() {
        result := ComCall(8, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the control can scroll horizontally.
     * @remarks
     * 
     * This property can be dynamic. For example, the content area of the control 
     *         might not be larger than the current viewable area, meaning <b>IScrollProvider::HorizontallyScrollable</b> 
     *         is <b>FALSE</b>. However, either resizing the control or adding child items may increase the bounds of the 
     *         content area beyond the viewable area, meaning <b>IScrollProvider::HorizontallyScrollable</b> is <b>TRUE</b>.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iscrollprovider-get_horizontallyscrollable
     */
    get_HorizontallyScrollable() {
        result := ComCall(9, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the control can scroll vertically.
     * @remarks
     * 
     * This property can be dynamic. For example, the content area of the control 
     *         might not be larger than the viewable area, meaning <b>IScrollProvider::VerticallyScrollable</b> 
     *         is <b>FALSE</b>. However, resizing the control or adding child items may increase the bounds of the 
     *         content area beyond the viewable area, meaning that <b>IScrollProvider::VerticallyScrollable</b> is <b>TRUE</b>.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iscrollprovider-get_verticallyscrollable
     */
    get_VerticallyScrollable() {
        result := ComCall(10, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
