#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\VirtualizingPanel.ahk
#Include .\ICarouselPanel.ahk
#Include .\IScrollSnapPointsInfo.ahk
#Include .\ICarouselPanelFactory.ahk
#Include ..\..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a panel that arranges its items in a line and circles around to the first item when the last item is reached.
 * @remarks
 * > [!NOTE]
 * > CarouselPanel can't be used as a stand-alone control, it can only be used as the [ItemsPanel](../windows.ui.xaml.controls/itemscontrol_itemspanel.md) of an [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md). It's the default [ItemsPanel](../windows.ui.xaml.controls/itemscontrol_itemspanel.md) for the [ComboBox](../windows.ui.xaml.controls/combobox.md) control, and is not supported for use with any other [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class CarouselPanel extends VirtualizingPanel {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICarouselPanel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICarouselPanel.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {CarouselPanel} 
     */
    static CreateInstance() {
        if (!CarouselPanel.HasProp("__ICarouselPanelFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.CarouselPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICarouselPanelFactory.IID)
            CarouselPanel.__ICarouselPanelFactory := ICarouselPanelFactory(factoryPtr)
        }

        return CarouselPanel.__ICarouselPanelFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Not intended for general use. Gets or sets a value that indicates whether scrolling on the vertical axis is possible.
     * @remarks
     * > [!NOTE]
     * > This property is not intended for use in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.canverticallyscroll
     * @type {Boolean} 
     */
    CanVerticallyScroll {
        get => this.get_CanVerticallyScroll()
        set => this.put_CanVerticallyScroll(value)
    }

    /**
     * Not intended for general use. Gets or sets a value that indicates whether scrolling on the horizontal axis is possible.
     * @remarks
     * > [!NOTE]
     * > This property is not intended for use in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.canhorizontallyscroll
     * @type {Boolean} 
     */
    CanHorizontallyScroll {
        get => this.get_CanHorizontallyScroll()
        set => this.put_CanHorizontallyScroll(value)
    }

    /**
     * Gets the horizontal size of the panel extent.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.extentwidth
     * @type {Float} 
     */
    ExtentWidth {
        get => this.get_ExtentWidth()
    }

    /**
     * Gets the vertical size of the panel extent.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.extentheight
     * @type {Float} 
     */
    ExtentHeight {
        get => this.get_ExtentHeight()
    }

    /**
     * Gets the horizontal size of the viewport/content area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.viewportwidth
     * @type {Float} 
     */
    ViewportWidth {
        get => this.get_ViewportWidth()
    }

    /**
     * Gets the vertical size of the viewport/content area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.viewportheight
     * @type {Float} 
     */
    ViewportHeight {
        get => this.get_ViewportHeight()
    }

    /**
     * Gets the horizontal offset of the scrolled content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.horizontaloffset
     * @type {Float} 
     */
    HorizontalOffset {
        get => this.get_HorizontalOffset()
    }

    /**
     * Gets the vertical offset of the scrolled content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.verticaloffset
     * @type {Float} 
     */
    VerticalOffset {
        get => this.get_VerticalOffset()
    }

    /**
     * Gets or sets a reference to a [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) that is the scroll host or scroll owner for scrolling behavior of the [CarouselPanel](carouselpanel.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.scrollowner
     * @type {IInspectable} 
     */
    ScrollOwner {
        get => this.get_ScrollOwner()
        set => this.put_ScrollOwner(value)
    }

    /**
     * Gets a value that indicates whether the horizontal snap points for the [CarouselPanel](carouselpanel.md) are equidistant from each other.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.arehorizontalsnappointsregular
     * @type {Boolean} 
     */
    AreHorizontalSnapPointsRegular {
        get => this.get_AreHorizontalSnapPointsRegular()
    }

    /**
     * Gets a value that indicates whether the vertical snap points for the [CarouselPanel](carouselpanel.md) are equidistant from each other.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.areverticalsnappointsregular
     * @type {Boolean} 
     */
    AreVerticalSnapPointsRegular {
        get => this.get_AreVerticalSnapPointsRegular()
    }

    /**
     * Occurs when the measurements for horizontal snap points change.
     * @type {EventHandler<IInspectable>}
    */
    OnHorizontalSnapPointsChanged {
        get {
            if(!this.HasProp("__OnHorizontalSnapPointsChanged")){
                this.__OnHorizontalSnapPointsChanged := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnHorizontalSnapPointsChangedToken := this.add_HorizontalSnapPointsChanged(this.__OnHorizontalSnapPointsChanged.iface)
            }
            return this.__OnHorizontalSnapPointsChanged
        }
    }

    /**
     * Occurs when the measurements for vertical snap points change.
     * @type {EventHandler<IInspectable>}
    */
    OnVerticalSnapPointsChanged {
        get {
            if(!this.HasProp("__OnVerticalSnapPointsChanged")){
                this.__OnVerticalSnapPointsChanged := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnVerticalSnapPointsChangedToken := this.add_VerticalSnapPointsChanged(this.__OnVerticalSnapPointsChanged.iface)
            }
            return this.__OnVerticalSnapPointsChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnHorizontalSnapPointsChangedToken")) {
            this.remove_HorizontalSnapPointsChanged(this.__OnHorizontalSnapPointsChangedToken)
            this.__OnHorizontalSnapPointsChanged.iface.Dispose()
        }

        if(this.HasProp("__OnVerticalSnapPointsChangedToken")) {
            this.remove_VerticalSnapPointsChanged(this.__OnVerticalSnapPointsChangedToken)
            this.__OnVerticalSnapPointsChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanVerticallyScroll() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.get_CanVerticallyScroll()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanVerticallyScroll(value) {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.put_CanVerticallyScroll(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanHorizontallyScroll() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.get_CanHorizontallyScroll()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanHorizontallyScroll(value) {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.put_CanHorizontallyScroll(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExtentWidth() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.get_ExtentWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExtentHeight() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.get_ExtentHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ViewportWidth() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.get_ViewportWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ViewportHeight() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.get_ViewportHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalOffset() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.get_HorizontalOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalOffset() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.get_VerticalOffset()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ScrollOwner() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.get_ScrollOwner()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_ScrollOwner(value) {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.put_ScrollOwner(value)
    }

    /**
     * Scrolls content by one line towards the top.
     * @remarks
     * This implementation calls [SetVerticalOffset](carouselpanel_setverticaloffset_1333703417.md) using a value for "line" of 16 pixels that comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.lineup
     */
    LineUp() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.LineUp()
    }

    /**
     * Scrolls content by one line towards the bottom.
     * @remarks
     * This implementation calls [SetVerticalOffset](carouselpanel_setverticaloffset_1333703417.md) using a value for "line" of 16 pixels that comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.linedown
     */
    LineDown() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.LineDown()
    }

    /**
     * Scrolls content by one line towards the left.
     * @remarks
     * This implementation calls [SetHorizontalOffset](carouselpanel_sethorizontaloffset_1971679761.md) using a value for "line" of 16 pixels that comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.lineleft
     */
    LineLeft() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.LineLeft()
    }

    /**
     * Scrolls content by one line towards the right.
     * @remarks
     * This implementation calls [SetHorizontalOffset](carouselpanel_sethorizontaloffset_1971679761.md) using a value for "line" of 16 pixels that comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.lineright
     */
    LineRight() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.LineRight()
    }

    /**
     * Scrolls content by one page towards the top.
     * @remarks
     * This implementation calls [SetVerticalOffset](carouselpanel_setverticaloffset_1333703417.md) using a value for "page" that is same as the [ViewportHeight](carouselpanel_viewportheight.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.pageup
     */
    PageUp() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.PageUp()
    }

    /**
     * Scrolls content by one page towards the bottom.
     * @remarks
     * This implementation calls [SetVerticalOffset](carouselpanel_setverticaloffset_1333703417.md) using a value for "page" that is same as the [ViewportHeight](carouselpanel_viewportheight.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.pagedown
     */
    PageDown() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.PageDown()
    }

    /**
     * Scrolls content by one page towards the left.
     * @remarks
     * This implementation calls [SetHorizontalOffset](carouselpanel_sethorizontaloffset_1971679761.md) using a value for "page" that is same as the [ViewportWidth](carouselpanel_viewportwidth.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.pageleft
     */
    PageLeft() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.PageLeft()
    }

    /**
     * Scrolls content by one page towards the left.
     * @remarks
     * This implementation calls [SetHorizontalOffset](carouselpanel_sethorizontaloffset_1971679761.md) using a value for "page" that is same as the [ViewportWidth](carouselpanel_viewportwidth.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.pageright
     */
    PageRight() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.PageRight()
    }

    /**
     * Scrolls content by one mousewheel click towards the top.
     * @remarks
     * This implementation calls [SetVerticalOffset](carouselpanel_setverticaloffset_1333703417.md) using a default value for "mousewheel click" of 48 pixels (3 lines) that comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.mousewheelup
     */
    MouseWheelUp() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.MouseWheelUp()
    }

    /**
     * Scrolls content by one mousewheel click towards the bottom.
     * @remarks
     * This implementation calls [SetVerticalOffset](carouselpanel_setverticaloffset_1333703417.md) using a default value for "mousewheel click" of 48 pixels (3 lines) that comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.mousewheeldown
     */
    MouseWheelDown() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.MouseWheelDown()
    }

    /**
     * Scrolls content by one mousewheel click towards the left.
     * @remarks
     * This implementation calls [SetHorizontalOffset](carouselpanel_sethorizontaloffset_1971679761.md) using a default value for "mousewheel click" of 48 pixels (3 lines) that comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.mousewheelleft
     */
    MouseWheelLeft() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.MouseWheelLeft()
    }

    /**
     * Scrolls content by one mousewheel click towards the right.
     * @remarks
     * This implementation calls [SetHorizontalOffset](carouselpanel_sethorizontaloffset_1971679761.md) using a default value for "mousewheel click" of 48 pixels (3 lines) that comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.mousewheelright
     */
    MouseWheelRight() {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.MouseWheelRight()
    }

    /**
     * Changes the horizontal offset of content within the [CarouselPanel](carouselpanel.md) viewport.
     * @param {Float} offset The horizontal offset to set, in pixels.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.sethorizontaloffset
     */
    SetHorizontalOffset(offset) {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.SetHorizontalOffset(offset)
    }

    /**
     * Changes the vertical offset of content within the [CarouselPanel](carouselpanel.md) viewport.
     * @param {Float} offset The vertical offset to set, in pixels.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.setverticaloffset
     */
    SetVerticalOffset(offset) {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.SetVerticalOffset(offset)
    }

    /**
     * Changes existing offsets in order to make the provided element visible in the viewport, and returns a [Rect](../windows.foundation/rect.md) measurement and position of the area.
     * @param {UIElement} visual_ The element to make visible.
     * @param {RECT} rectangle_ A rectangle representing the element's coordinate space.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.makevisible
     */
    MakeVisible(visual_, rectangle_) {
        if (!this.HasProp("__ICarouselPanel")) {
            if ((queryResult := this.QueryInterface(ICarouselPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICarouselPanel := ICarouselPanel(outPtr)
        }

        return this.__ICarouselPanel.MakeVisible(visual_, rectangle_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreHorizontalSnapPointsRegular() {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.get_AreHorizontalSnapPointsRegular()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreVerticalSnapPointsRegular() {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.get_AreVerticalSnapPointsRegular()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HorizontalSnapPointsChanged(handler) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.add_HorizontalSnapPointsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HorizontalSnapPointsChanged(token) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.remove_HorizontalSnapPointsChanged(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VerticalSnapPointsChanged(handler) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.add_VerticalSnapPointsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VerticalSnapPointsChanged(token) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.remove_VerticalSnapPointsChanged(token)
    }

    /**
     * Returns the set of distances between irregular snap points for a specified orientation and alignment.
     * @param {Integer} orientation_ The orientation/dimension for the desired snap point set.
     * @param {Integer} alignment The alignment to use when applying the snap points.
     * @returns {IVectorView<Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.getirregularsnappoints
     */
    GetIrregularSnapPoints(orientation_, alignment) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.GetIrregularSnapPoints(orientation_, alignment)
    }

    /**
     * Gets the distance between regular snap points for a specified orientation and alignment.
     * @param {Integer} orientation_ The orientation/dimension for the desired snap point set.
     * @param {Integer} alignment The alignment to use when applying the snap points.
     * @param {Pointer<Single>} offset Out parameter. The offset of the first snap point.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.carouselpanel.getregularsnappoints
     */
    GetRegularSnapPoints(orientation_, alignment, offset) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.GetRegularSnapPoints(orientation_, alignment, offset)
    }

;@endregion Instance Methods
}
