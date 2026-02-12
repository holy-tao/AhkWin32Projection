#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\ILoopingSelectorAutomationPeer.ahk
#Include ..\Provider\ISelectionProvider.ahk
#Include ..\Provider\IItemContainerProvider.ahk
#Include ..\Provider\IExpandCollapseProvider.ahk
#Include ..\Provider\IScrollProvider.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [LoopingSelector](../windows.ui.xaml.controls.primitives/loopingselector.md) types to Microsoft UI Automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class LoopingSelectorAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILoopingSelectorAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILoopingSelectorAutomationPeer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the control allows more than one child element to be selected concurrently.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.canselectmultiple
     * @type {Boolean} 
     */
    CanSelectMultiple {
        get => this.get_CanSelectMultiple()
    }

    /**
     * Gets a value that indicates whether the control requires at least one child element to be selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.isselectionrequired
     * @type {Boolean} 
     */
    IsSelectionRequired {
        get => this.get_IsSelectionRequired()
    }

    /**
     * Gets the state, expanded or collapsed, of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.expandcollapsestate
     * @type {Integer} 
     */
    ExpandCollapseState {
        get => this.get_ExpandCollapseState()
    }

    /**
     * Gets a value that indicates whether the control can scroll horizontally.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.horizontallyscrollable
     * @type {Boolean} 
     */
    HorizontallyScrollable {
        get => this.get_HorizontallyScrollable()
    }

    /**
     * Gets the current horizontal scroll position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.horizontalscrollpercent
     * @type {Float} 
     */
    HorizontalScrollPercent {
        get => this.get_HorizontalScrollPercent()
    }

    /**
     * Gets the current horizontal view size.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.horizontalviewsize
     * @type {Float} 
     */
    HorizontalViewSize {
        get => this.get_HorizontalViewSize()
    }

    /**
     * Gets a value that indicates whether the control can scroll vertically.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.verticallyscrollable
     * @type {Boolean} 
     */
    VerticallyScrollable {
        get => this.get_VerticallyScrollable()
    }

    /**
     * Gets the current vertical scroll position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.verticalscrollpercent
     * @type {Float} 
     */
    VerticalScrollPercent {
        get => this.get_VerticalScrollPercent()
    }

    /**
     * Gets the current vertical view size.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.verticalviewsize
     * @type {Float} 
     */
    VerticalViewSize {
        get => this.get_VerticalViewSize()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSelectMultiple() {
        if (!this.HasProp("__ISelectionProvider")) {
            if ((queryResult := this.QueryInterface(ISelectionProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectionProvider := ISelectionProvider(outPtr)
        }

        return this.__ISelectionProvider.get_CanSelectMultiple()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelectionRequired() {
        if (!this.HasProp("__ISelectionProvider")) {
            if ((queryResult := this.QueryInterface(ISelectionProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectionProvider := ISelectionProvider(outPtr)
        }

        return this.__ISelectionProvider.get_IsSelectionRequired()
    }

    /**
     * Retrieves a Microsoft UI Automation provider for each child element that is selected.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} A generic list of Microsoft UI Automation providers.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.getselection
     */
    GetSelection(result_) {
        if (!this.HasProp("__ISelectionProvider")) {
            if ((queryResult := this.QueryInterface(ISelectionProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectionProvider := ISelectionProvider(outPtr)
        }

        return this.__ISelectionProvider.GetSelection(result_)
    }

    /**
     * Retrieves an element by the specified property value.
     * @param {IRawElementProviderSimple} startAfter The item in the container after which to begin the search.
     * @param {AutomationProperty} automationProperty_ The property that contains the value to retrieve.
     * @param {IInspectable} value The value to retrieve.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.finditembyproperty
     */
    FindItemByProperty(startAfter, automationProperty_, value) {
        if (!this.HasProp("__IItemContainerProvider")) {
            if ((queryResult := this.QueryInterface(IItemContainerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerProvider := IItemContainerProvider(outPtr)
        }

        return this.__IItemContainerProvider.FindItemByProperty(startAfter, automationProperty_, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExpandCollapseState() {
        if (!this.HasProp("__IExpandCollapseProvider")) {
            if ((queryResult := this.QueryInterface(IExpandCollapseProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExpandCollapseProvider := IExpandCollapseProvider(outPtr)
        }

        return this.__IExpandCollapseProvider.get_ExpandCollapseState()
    }

    /**
     * Hides all nodes, controls, or content that are descendants of the control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.collapse
     */
    Collapse() {
        if (!this.HasProp("__IExpandCollapseProvider")) {
            if ((queryResult := this.QueryInterface(IExpandCollapseProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExpandCollapseProvider := IExpandCollapseProvider(outPtr)
        }

        return this.__IExpandCollapseProvider.Collapse()
    }

    /**
     * Displays all child nodes, controls, or content of the control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.expand
     */
    Expand() {
        if (!this.HasProp("__IExpandCollapseProvider")) {
            if ((queryResult := this.QueryInterface(IExpandCollapseProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExpandCollapseProvider := IExpandCollapseProvider(outPtr)
        }

        return this.__IExpandCollapseProvider.Expand()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HorizontallyScrollable() {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.get_HorizontallyScrollable()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalScrollPercent() {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.get_HorizontalScrollPercent()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalViewSize() {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.get_HorizontalViewSize()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_VerticallyScrollable() {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.get_VerticallyScrollable()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalScrollPercent() {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.get_VerticalScrollPercent()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalViewSize() {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.get_VerticalViewSize()
    }

    /**
     * Scrolls the visible region of the content area horizontally, vertically, or both.
     * @param {Integer} horizontalAmount The horizontal increment that is specific to the control. Pass [NoScroll](../windows.ui.xaml.automation/scrollpatternidentifiers_noscroll.md) if the control cannot be scrolled in this direction.
     * @param {Integer} verticalAmount The vertical increment that is specific to the control. Pass [NoScroll](../windows.ui.xaml.automation/scrollpatternidentifiers_noscroll.md) if the control cannot be scrolled in this direction.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.scroll
     */
    Scroll(horizontalAmount, verticalAmount) {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.Scroll(horizontalAmount, verticalAmount)
    }

    /**
     * Sets the horizontal and vertical scroll position as a percentage of the total content area within the control.
     * @param {Float} horizontalPercent The horizontal position as a percentage of the content area's total range. Pass [NoScroll](../windows.ui.xaml.automation/scrollpatternidentifiers_noscroll.md) if the control cannot be scrolled in this direction.
     * @param {Float} verticalPercent The vertical position as a percentage of the content area's total range. Pass [NoScroll](../windows.ui.xaml.automation/scrollpatternidentifiers_noscroll.md) if the control cannot be scrolled in this direction.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectorautomationpeer.setscrollpercent
     */
    SetScrollPercent(horizontalPercent, verticalPercent) {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.SetScrollPercent(horizontalPercent, verticalPercent)
    }

;@endregion Instance Methods
}
