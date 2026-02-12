#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IScrollViewerAutomationPeer.ahk
#Include ..\Provider\IScrollProvider.ahk
#Include .\IScrollViewerAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) class creates a new ScrollViewerAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) is sealed, so the normal scenario of deriving from the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) class and its existing peer isn't applicable to ScrollViewerAutomationPeer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.scrollviewerautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ScrollViewerAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScrollViewerAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScrollViewerAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ScrollViewer} owner 
     * @returns {ScrollViewerAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ScrollViewerAutomationPeer.HasProp("__IScrollViewerAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ScrollViewerAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerAutomationPeerFactory.IID)
            ScrollViewerAutomationPeer.__IScrollViewerAutomationPeerFactory := IScrollViewerAutomationPeerFactory(factoryPtr)
        }

        return ScrollViewerAutomationPeer.__IScrollViewerAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether the control can scroll horizontally.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.scrollviewerautomationpeer.horizontallyscrollable
     * @type {Boolean} 
     */
    HorizontallyScrollable {
        get => this.get_HorizontallyScrollable()
    }

    /**
     * Gets the current horizontal scroll position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.scrollviewerautomationpeer.horizontalscrollpercent
     * @type {Float} 
     */
    HorizontalScrollPercent {
        get => this.get_HorizontalScrollPercent()
    }

    /**
     * Gets the current horizontal view size.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.scrollviewerautomationpeer.horizontalviewsize
     * @type {Float} 
     */
    HorizontalViewSize {
        get => this.get_HorizontalViewSize()
    }

    /**
     * Gets a value that indicates whether the control can scroll vertically.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.scrollviewerautomationpeer.verticallyscrollable
     * @type {Boolean} 
     */
    VerticallyScrollable {
        get => this.get_VerticallyScrollable()
    }

    /**
     * Gets the current vertical scroll position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.scrollviewerautomationpeer.verticalscrollpercent
     * @type {Float} 
     */
    VerticalScrollPercent {
        get => this.get_VerticalScrollPercent()
    }

    /**
     * Gets the vertical view size.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.scrollviewerautomationpeer.verticalviewsize
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.scrollviewerautomationpeer.scroll
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.scrollviewerautomationpeer.setscrollpercent
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
