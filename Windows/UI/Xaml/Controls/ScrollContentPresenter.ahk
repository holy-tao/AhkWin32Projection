#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentPresenter.ahk
#Include .\IScrollContentPresenter.ahk
#Include .\IScrollContentPresenter2.ahk
#Include .\IScrollContentPresenterStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Displays the content of a [ScrollViewer](scrollviewer.md) control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ScrollContentPresenter extends ContentPresenter {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScrollContentPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScrollContentPresenter.IID

    /**
     * Identifies the [CanContentRenderOutsideBounds](scrollcontentpresenter_cancontentrenderoutsidebounds.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.cancontentrenderoutsideboundsproperty
     * @type {DependencyProperty} 
     */
    static CanContentRenderOutsideBoundsProperty {
        get => ScrollContentPresenter.get_CanContentRenderOutsideBoundsProperty()
    }

    /**
     * Identifies the [SizesContentToTemplatedParent](scrollcontentpresenter_sizescontenttotemplatedparent.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.sizescontenttotemplatedparentproperty
     * @type {DependencyProperty} 
     */
    static SizesContentToTemplatedParentProperty {
        get => ScrollContentPresenter.get_SizesContentToTemplatedParentProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanContentRenderOutsideBoundsProperty() {
        if (!ScrollContentPresenter.HasProp("__IScrollContentPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollContentPresenterStatics2.IID)
            ScrollContentPresenter.__IScrollContentPresenterStatics2 := IScrollContentPresenterStatics2(factoryPtr)
        }

        return ScrollContentPresenter.__IScrollContentPresenterStatics2.get_CanContentRenderOutsideBoundsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SizesContentToTemplatedParentProperty() {
        if (!ScrollContentPresenter.HasProp("__IScrollContentPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollContentPresenterStatics2.IID)
            ScrollContentPresenter.__IScrollContentPresenterStatics2 := IScrollContentPresenterStatics2(factoryPtr)
        }

        return ScrollContentPresenter.__IScrollContentPresenterStatics2.get_SizesContentToTemplatedParentProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether scrolling on the vertical axis is possible.
     * @remarks
     * > [!NOTE]
     * > This property is not intended to be set in XAML. You can set the panel's **Orientation** property in XAML and optionally change the [ScrollViewer.HorizontalScrollBarVisibility](scrollviewer_horizontalscrollbarvisibility.md) or [ScrollViewer.VerticalScrollBarVisibility](scrollviewer_verticalscrollbarvisibility.md) to change how scrolling works. This property can be changed in code. In some cases you will need to use [VisualTreeHelper](../windows.ui.xaml.media/visualtreehelper.md) to access the panel. For example, when used in an [ItemsPanel](itemscontrol_itemspanel.md), there's no property that provides access to a [ScrollContentPresenter](scrollcontentpresenter.md) within the panel.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.canverticallyscroll
     * @type {Boolean} 
     */
    CanVerticallyScroll {
        get => this.get_CanVerticallyScroll()
        set => this.put_CanVerticallyScroll(value)
    }

    /**
     * Gets or sets a value that indicates whether scrolling on the horizontal axis is possible.
     * @remarks
     * > [!NOTE]
     * > This property is not intended to be set in XAML. You can set the panel's **Orientation** property in XAML and optionally change the [ScrollViewer.HorizontalScrollBarVisibility](scrollviewer_horizontalscrollbarvisibility.md) or [ScrollViewer.VerticalScrollBarVisibility](scrollviewer_verticalscrollbarvisibility.md) to change how scrolling works. This property can be changed in code. In some cases you will need to use [VisualTreeHelper](../windows.ui.xaml.media/visualtreehelper.md) to access the panel. For example, when used in an [ItemsPanel](itemscontrol_itemspanel.md), there's no property that provides access to a [ScrollContentPresenter](scrollcontentpresenter.md) within the panel.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.canhorizontallyscroll
     * @type {Boolean} 
     */
    CanHorizontallyScroll {
        get => this.get_CanHorizontallyScroll()
        set => this.put_CanHorizontallyScroll(value)
    }

    /**
     * Gets the horizontal size of all the scrollable content.
     * @remarks
     * The extent includes all the content in the [ScrollViewer](scrollviewer.md), whether visible or not. The viewport is the visible area of the content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.extentwidth
     * @type {Float} 
     */
    ExtentWidth {
        get => this.get_ExtentWidth()
    }

    /**
     * Gets the vertical size of all the scrollable content.
     * @remarks
     * The extent includes all the content in the [ScrollViewer](scrollviewer.md), whether visible or not. The viewport is the visible area of the content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.extentheight
     * @type {Float} 
     */
    ExtentHeight {
        get => this.get_ExtentHeight()
    }

    /**
     * Gets the horizontal size of the viewable content.
     * @remarks
     * The viewport includes all the visible content in the [ScrollViewer](scrollviewer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.viewportwidth
     * @type {Float} 
     */
    ViewportWidth {
        get => this.get_ViewportWidth()
    }

    /**
     * Gets the vertical size of the viewable content.
     * @remarks
     * The viewport includes all the visible content in the [ScrollViewer](scrollviewer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.viewportheight
     * @type {Float} 
     */
    ViewportHeight {
        get => this.get_ViewportHeight()
    }

    /**
     * Gets the distance the content has been scrolled horizontally.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.horizontaloffset
     * @type {Float} 
     */
    HorizontalOffset {
        get => this.get_HorizontalOffset()
    }

    /**
     * Gets the distance the content has been scrolled vertically.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.verticaloffset
     * @type {Float} 
     */
    VerticalOffset {
        get => this.get_VerticalOffset()
    }

    /**
     * Gets or sets the [ScrollViewer](scrollviewer.md) element that controls scrolling behavior.
     * @remarks
     * This property is not intended to be set in XAML.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.scrollowner
     * @type {IInspectable} 
     */
    ScrollOwner {
        get => this.get_ScrollOwner()
        set => this.put_ScrollOwner(value)
    }

    /**
     * Gets or sets a value that indicates whether scrolled content can render outside the bounds of the ScrollViewer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.cancontentrenderoutsidebounds
     * @type {Boolean} 
     */
    CanContentRenderOutsideBounds {
        get => this.get_CanContentRenderOutsideBounds()
        set => this.put_CanContentRenderOutsideBounds(value)
    }

    /**
     * Gets or sets a value that indicates whether, when used in the ControlTemplate for a ScrollViewer, the presenter restricts the size of its [Content](contentpresenter_content.md) to the owning ScrollViewer size.
     * @remarks
     * By default, when a ScrollContentPresenter is sizing its [Content](contentpresenter_content.md) during layout, it allows the content to be as wide as the content desires if [CanHorizontallyScroll](scrollcontentpresenter_canhorizontallyscroll.md) is **true**, and allows the content to be as high as the content desires if [CanVerticallyScroll](scrollcontentpresenter_canverticallyscroll.md) is **true**.
     * 
     * When the ScrollContentPresenter is used in the [ControlTemplate](controltemplate.md) for a [ScrollViewer](scrollviewer.md), setting the SizesContentToTemplatedParent property to **true** causes it to restrict the size of its Content to the owning ScrollViewer size.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.sizescontenttotemplatedparent
     * @type {Boolean} 
     */
    SizesContentToTemplatedParent {
        get => this.get_SizesContentToTemplatedParent()
        set => this.put_SizesContentToTemplatedParent(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ScrollContentPresenter](scrollcontentpresenter.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollContentPresenter")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanVerticallyScroll() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.get_CanVerticallyScroll()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanVerticallyScroll(value) {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.put_CanVerticallyScroll(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanHorizontallyScroll() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.get_CanHorizontallyScroll()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanHorizontallyScroll(value) {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.put_CanHorizontallyScroll(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExtentWidth() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.get_ExtentWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExtentHeight() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.get_ExtentHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ViewportWidth() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.get_ViewportWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ViewportHeight() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.get_ViewportHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalOffset() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.get_HorizontalOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalOffset() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.get_VerticalOffset()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ScrollOwner() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.get_ScrollOwner()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_ScrollOwner(value) {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.put_ScrollOwner(value)
    }

    /**
     * Scrolls the [ScrollContentPresenter](scrollcontentpresenter.md) content upward by one line.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.lineup
     */
    LineUp() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.LineUp()
    }

    /**
     * Scrolls the [ScrollContentPresenter](scrollcontentpresenter.md) content downward by one line.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.linedown
     */
    LineDown() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.LineDown()
    }

    /**
     * Scrolls the [ScrollContentPresenter](scrollcontentpresenter.md) content to the left by a predetermined amount.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.lineleft
     */
    LineLeft() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.LineLeft()
    }

    /**
     * Scrolls the [ScrollContentPresenter](scrollcontentpresenter.md) content to the right by a predetermined amount.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.lineright
     */
    LineRight() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.LineRight()
    }

    /**
     * Scrolls up within the content by one page.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.pageup
     */
    PageUp() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.PageUp()
    }

    /**
     * Scrolls down within the content by one page.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.pagedown
     */
    PageDown() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.PageDown()
    }

    /**
     * Scrolls left within the content by one page.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.pageleft
     */
    PageLeft() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.PageLeft()
    }

    /**
     * Scrolls right within the content by one page.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.pageright
     */
    PageRight() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.PageRight()
    }

    /**
     * Scrolls up within content after a user clicks the wheel button on a mouse.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.mousewheelup
     */
    MouseWheelUp() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.MouseWheelUp()
    }

    /**
     * Scrolls down within content after a user clicks the wheel button on a mouse.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.mousewheeldown
     */
    MouseWheelDown() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.MouseWheelDown()
    }

    /**
     * Scrolls left within content after a user clicks the wheel button on a mouse.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.mousewheelleft
     */
    MouseWheelLeft() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.MouseWheelLeft()
    }

    /**
     * Scrolls right within content after a user clicks the wheel button on a mouse.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.mousewheelright
     */
    MouseWheelRight() {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.MouseWheelRight()
    }

    /**
     * Sets the distance the content has been scrolled horizontally.
     * @param {Float} offset The distance the content has been scrolled horizontally.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.sethorizontaloffset
     */
    SetHorizontalOffset(offset) {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.SetHorizontalOffset(offset)
    }

    /**
     * Sets the distance the content has been scrolled vertically.
     * @param {Float} offset The distance the content has been scrolled vertically.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.setverticaloffset
     */
    SetVerticalOffset(offset) {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.SetVerticalOffset(offset)
    }

    /**
     * Forces content to scroll until the coordinate space of a visual object is visible.
     * @param {UIElement} visual_ A [UIElement](../windows.ui.xaml/uielement.md) that becomes visible.
     * @param {RECT} rectangle_ The bounding rectangle that identifies the coordinate space to make visible.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollcontentpresenter.makevisible
     */
    MakeVisible(visual_, rectangle_) {
        if (!this.HasProp("__IScrollContentPresenter")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter := IScrollContentPresenter(outPtr)
        }

        return this.__IScrollContentPresenter.MakeVisible(visual_, rectangle_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanContentRenderOutsideBounds() {
        if (!this.HasProp("__IScrollContentPresenter2")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter2 := IScrollContentPresenter2(outPtr)
        }

        return this.__IScrollContentPresenter2.get_CanContentRenderOutsideBounds()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanContentRenderOutsideBounds(value) {
        if (!this.HasProp("__IScrollContentPresenter2")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter2 := IScrollContentPresenter2(outPtr)
        }

        return this.__IScrollContentPresenter2.put_CanContentRenderOutsideBounds(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SizesContentToTemplatedParent() {
        if (!this.HasProp("__IScrollContentPresenter2")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter2 := IScrollContentPresenter2(outPtr)
        }

        return this.__IScrollContentPresenter2.get_SizesContentToTemplatedParent()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SizesContentToTemplatedParent(value) {
        if (!this.HasProp("__IScrollContentPresenter2")) {
            if ((queryResult := this.QueryInterface(IScrollContentPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollContentPresenter2 := IScrollContentPresenter2(outPtr)
        }

        return this.__IScrollContentPresenter2.put_SizesContentToTemplatedParent(value)
    }

;@endregion Instance Methods
}
