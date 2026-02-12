#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support access by a Microsoft UI Automation client to a control that acts as a scrollable container for a collection of child objects. The children of this element must implement [IScrollItemProvider](iscrollitemprovider.md). Implement IScrollProvider in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.Scroll](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * This pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [Scroll Control Pattern](/windows/desktop/WinAuto/uiauto-implementingscroll).
 * 
 * IScrollProvider is implemented by the existing Windows Runtime class [ScrollViewerAutomationPeer](../windows.ui.xaml.automation.peers/scrollviewerautomationpeer.md), which is the peer for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) component part used in many other list controls.
 * 
 * Also, IScrollProvider is reported as a supported pattern by [ItemsControlAutomationPeer](../windows.ui.xaml.automation.peers/itemscontrolautomationpeer.md), but only if a [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) exists in the owner's template and is active. The [ScrollViewerAutomationPeer](../windows.ui.xaml.automation.peers/scrollviewerautomationpeer.md) for this [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) provides the pattern implementation, [ItemsControlAutomationPeer](../windows.ui.xaml.automation.peers/itemscontrolautomationpeer.md) is only forwarding it.
 * 
 * Use [ScrollPatternIdentifiers](../windows.ui.xaml.automation/scrollpatternidentifiers.md) if you want to reference the IScrollProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iscrollprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IScrollProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollProvider
     * @type {Guid}
     */
    static IID => Guid("{374bf581-7716-4bbc-82eb-d997006ea999}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HorizontallyScrollable", "get_HorizontalScrollPercent", "get_HorizontalViewSize", "get_VerticallyScrollable", "get_VerticalScrollPercent", "get_VerticalViewSize", "Scroll", "SetScrollPercent"]

    /**
     * Gets a value that indicates whether the control can scroll horizontally.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iscrollprovider.horizontallyscrollable
     * @type {Boolean} 
     */
    HorizontallyScrollable {
        get => this.get_HorizontallyScrollable()
    }

    /**
     * Gets the current horizontal scroll position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iscrollprovider.horizontalscrollpercent
     * @type {Float} 
     */
    HorizontalScrollPercent {
        get => this.get_HorizontalScrollPercent()
    }

    /**
     * Gets the current horizontal view size.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iscrollprovider.horizontalviewsize
     * @type {Float} 
     */
    HorizontalViewSize {
        get => this.get_HorizontalViewSize()
    }

    /**
     * Gets a value that indicates whether the control can scroll vertically.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iscrollprovider.verticallyscrollable
     * @type {Boolean} 
     */
    VerticallyScrollable {
        get => this.get_VerticallyScrollable()
    }

    /**
     * Gets the current vertical scroll position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iscrollprovider.verticalscrollpercent
     * @type {Float} 
     */
    VerticalScrollPercent {
        get => this.get_VerticalScrollPercent()
    }

    /**
     * Gets the vertical view size.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iscrollprovider.verticalviewsize
     * @type {Float} 
     */
    VerticalViewSize {
        get => this.get_VerticalViewSize()
    }

    /**
     * Indicates whether the control can scroll horizontally.
     * @remarks
     * This property can be dynamic. For example, the content area of the control 
     *         might not be larger than the current viewable area, meaning <b>IScrollProvider::HorizontallyScrollable</b> 
     *         is <b>FALSE</b>. However, either resizing the control or adding child items may increase the bounds of the 
     *         content area beyond the viewable area, meaning <b>IScrollProvider::HorizontallyScrollable</b> is <b>TRUE</b>.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_horizontallyscrollable
     */
    get_HorizontallyScrollable() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the horizontal scroll position.
     * @remarks
     * The horizontal scroll position can be reported as <b>UIA_ScrollPatternNoScroll</b> if no valid position is available; for example, if the window does not have a horizontal scroll bar.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_horizontalscrollpercent
     */
    get_HorizontalScrollPercent() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the horizontal size of the viewable region.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_horizontalviewsize
     */
    get_HorizontalViewSize() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Indicates whether the control can scroll vertically.
     * @remarks
     * This property can be dynamic. For example, the content area of the control 
     *         might not be larger than the viewable area, meaning <b>IScrollProvider::VerticallyScrollable</b> 
     *         is <b>FALSE</b>. However, resizing the control or adding child items may increase the bounds of the 
     *         content area beyond the viewable area, meaning that <b>IScrollProvider::VerticallyScrollable</b> is <b>TRUE</b>.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_verticallyscrollable
     */
    get_VerticallyScrollable() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the vertical scroll position.
     * @remarks
     * The vertical scroll position can be reported as <b>UIA_ScrollPatternNoScroll</b> if no valid position is available; for example, if the window does not have a vertical scroll bar.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_verticalscrollpercent
     */
    get_VerticalScrollPercent() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the vertical size of the viewable region.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iscrollprovider-get_verticalviewsize
     */
    get_VerticalViewSize() {
        result := ComCall(11, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Scrolls the visible region of the content area horizontally, vertically, or both.
     * @param {Integer} horizontalAmount The horizontal increment that is specific to the control. Pass [NoScroll](../windows.ui.xaml.automation/scrollpatternidentifiers_noscroll.md) if the control cannot be scrolled in this direction.
     * @param {Integer} verticalAmount The vertical increment that is specific to the control. Pass [NoScroll](../windows.ui.xaml.automation/scrollpatternidentifiers_noscroll.md) if the control cannot be scrolled in this direction.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iscrollprovider.scroll
     */
    Scroll(horizontalAmount, verticalAmount) {
        result := ComCall(12, this, "int", horizontalAmount, "int", verticalAmount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the horizontal and vertical scroll position as a percentage of the total content area within the control.
     * @param {Float} horizontalPercent The horizontal position as a percentage of the content area's total range. Pass [NoScroll](../windows.ui.xaml.automation/scrollpatternidentifiers_noscroll.md) if the control cannot be scrolled in this direction.
     * @param {Float} verticalPercent The vertical position as a percentage of the content area's total range. Pass [NoScroll](../windows.ui.xaml.automation/scrollpatternidentifiers_noscroll.md) if the control cannot be scrolled in this direction.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iscrollprovider.setscrollpercent
     */
    SetScrollPercent(horizontalPercent, verticalPercent) {
        result := ComCall(13, this, "double", horizontalPercent, "double", verticalPercent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
