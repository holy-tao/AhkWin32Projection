#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\VirtualizingPanel.ahk
#Include .\IOrientedVirtualizingPanel.ahk
#Include .\IScrollSnapPointsInfo.ahk
#Include ..\IInsertionPanel.ahk
#Include .\IOrientedVirtualizingPanelFactory.ahk
#Include ..\..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Adds infrastructure (provides base class) for virtualizing layout containers that support spatial cues, such as [VirtualizingStackPanel](../windows.ui.xaml.controls/virtualizingstackpanel.md) and [WrapGrid](../windows.ui.xaml.controls/wrapgrid.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class OrientedVirtualizingPanel extends VirtualizingPanel {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOrientedVirtualizingPanel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOrientedVirtualizingPanel.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that determines how the [OrientedVirtualizingPanel](orientedvirtualizingpanel.md) measures space for child elements for possible scrolling in the vertical dimension.
     * @remarks
     * > [!NOTE]
     * > This property is not intended to be set inXAML. You can set the panel's **Orientation** property in XAML and optionally change the [ScrollViewer.HorizontalScrollBarVisibility](../windows.ui.xaml.controls/scrollviewer_horizontalscrollbarvisibility.md) or [ScrollViewer.VerticalScrollBarVisibility](../windows.ui.xaml.controls/scrollviewer_verticalscrollbarvisibility.md) to change how scrolling works. This property can be changed in code. In some cases you will need to use [VisualTreeHelper](../windows.ui.xaml.media/visualtreehelper.md) to access the panel.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.canverticallyscroll
     * @type {Boolean} 
     */
    CanVerticallyScroll {
        get => this.get_CanVerticallyScroll()
        set => this.put_CanVerticallyScroll(value)
    }

    /**
     * Gets or sets a value that determines how the [OrientedVirtualizingPanel](orientedvirtualizingpanel.md) measures space for child elements for possible scrolling in the horizontal dimension.
     * @remarks
     * > [!NOTE]
     * > This property is not intended to be set in XAML. You can set the panel's **Orientation** property in XAML and optionally change the [ScrollViewer.HorizontalScrollBarVisibility](../windows.ui.xaml.controls/scrollviewer_horizontalscrollbarvisibility.md) or [ScrollViewer.VerticalScrollBarVisibility](../windows.ui.xaml.controls/scrollviewer_verticalscrollbarvisibility.md) to change how scrolling works. This property can be changed in code. In some cases you will need to use [VisualTreeHelper](../windows.ui.xaml.media/visualtreehelper.md) to access the panel.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.canhorizontallyscroll
     * @type {Boolean} 
     */
    CanHorizontallyScroll {
        get => this.get_CanHorizontallyScroll()
        set => this.put_CanHorizontallyScroll(value)
    }

    /**
     * Gets the horizontal size of the panel extent.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.extentwidth
     * @type {Float} 
     */
    ExtentWidth {
        get => this.get_ExtentWidth()
    }

    /**
     * Gets the vertical size of the panel extent.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.extentheight
     * @type {Float} 
     */
    ExtentHeight {
        get => this.get_ExtentHeight()
    }

    /**
     * Gets the horizontal size of the viewport or content area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.viewportwidth
     * @type {Float} 
     */
    ViewportWidth {
        get => this.get_ViewportWidth()
    }

    /**
     * Gets the vertical size of the viewport or content area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.viewportheight
     * @type {Float} 
     */
    ViewportHeight {
        get => this.get_ViewportHeight()
    }

    /**
     * Gets the horizontal offset of the scrolled content.
     * @remarks
     * To change the horizontal offset, call [SetHorizontalOffset](orientedvirtualizingpanel_sethorizontaloffset_1971679761.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.horizontaloffset
     * @type {Float} 
     */
    HorizontalOffset {
        get => this.get_HorizontalOffset()
    }

    /**
     * Gets the vertical offset of the scrolled content.
     * @remarks
     * To change the vertical offset, call [SetVerticalOffset](orientedvirtualizingpanel_setverticaloffset_1333703417.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.verticaloffset
     * @type {Float} 
     */
    VerticalOffset {
        get => this.get_VerticalOffset()
    }

    /**
     * Gets or sets a reference to a [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) that is the scroll host or scroll owner for scrolling behavior of the [OrientedVirtualizingPanel](orientedvirtualizingpanel.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.scrollowner
     * @type {IInspectable} 
     */
    ScrollOwner {
        get => this.get_ScrollOwner()
        set => this.put_ScrollOwner(value)
    }

    /**
     * Gets a value that indicates whether the horizontal snap points for the [OrientedVirtualizingPanel](orientedvirtualizingpanel.md) are equidistant from each other.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.arehorizontalsnappointsregular
     * @type {Boolean} 
     */
    AreHorizontalSnapPointsRegular {
        get => this.get_AreHorizontalSnapPointsRegular()
    }

    /**
     * Gets a value that indicates whether the vertical snap points for the [OrientedVirtualizingPanel](orientedvirtualizingpanel.md) are equidistant from each other.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.areverticalsnappointsregular
     * @type {Boolean} 
     */
    AreVerticalSnapPointsRegular {
        get => this.get_AreVerticalSnapPointsRegular()
    }

    /**
     * Fires when the measurements for horizontal snap points change.
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
     * Fires when the measurements for vertical snap points change.
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
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.get_CanVerticallyScroll()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanVerticallyScroll(value) {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.put_CanVerticallyScroll(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanHorizontallyScroll() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.get_CanHorizontallyScroll()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanHorizontallyScroll(value) {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.put_CanHorizontallyScroll(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExtentWidth() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.get_ExtentWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExtentHeight() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.get_ExtentHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ViewportWidth() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.get_ViewportWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ViewportHeight() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.get_ViewportHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalOffset() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.get_HorizontalOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalOffset() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.get_VerticalOffset()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ScrollOwner() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.get_ScrollOwner()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_ScrollOwner(value) {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.put_ScrollOwner(value)
    }

    /**
     * Scrolls content by one line toward the top.
     * @remarks
     * This implementation calls [SetVerticalOffset](orientedvirtualizingpanel_setverticaloffset_1333703417.md) using a value for "line" of 16 pixels, which comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md). 
     * <!--Override the method and call <xref targtype="method_winrt" rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel_setverticaloffset"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">SetVerticalOffset</xref> using a different measurement to change the interpretation of "line" for a derivation of 
     *       <xref rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel" targtype="class_winrt">OrientedVirtualizingPanel</xref>.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.lineup
     */
    LineUp() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.LineUp()
    }

    /**
     * Scrolls content by one line toward the bottom.
     * @remarks
     * This implementation calls [SetVerticalOffset](orientedvirtualizingpanel_setverticaloffset_1333703417.md) using a value for "line" of 16 pixels, which comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md). 
     * <!--Override the method and call <xref targtype="method_winrt" rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel_setverticaloffset"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">SetVerticalOffset</xref> using a different measurement to change the interpretation of "line" for a derivation of 
     *       <xref rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel" targtype="class_winrt">OrientedVirtualizingPanel</xref>.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.linedown
     */
    LineDown() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.LineDown()
    }

    /**
     * Scrolls content by one line toward the left.
     * @remarks
     * This implementation calls [SetHorizontalOffset](orientedvirtualizingpanel_sethorizontaloffset_1971679761.md) using a value for "line" of 16 pixels, which comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md).
     * <!-- Override the method and call <xref targtype="method_winrt" rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel_sethorizontaloffset"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">SetHorizontalOffset</xref> using a different measurement to change the interpretation of "line" for a derivation of 
     *       <xref rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel" targtype="class_winrt">OrientedVirtualizingPanel</xref>.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.lineleft
     */
    LineLeft() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.LineLeft()
    }

    /**
     * Scrolls content by one line toward the right.
     * @remarks
     * This implementation calls [SetHorizontalOffset](orientedvirtualizingpanel_sethorizontaloffset_1971679761.md) using a value for "line" of 16 pixels, which comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md).
     * <!-- Override the method and call <xref targtype="method_winrt" rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel_sethorizontaloffset"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">SetHorizontalOffset</xref> using a different measurement to change the interpretation of "line" for a derivation of 
     *       <xref rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel" targtype="class_winrt">OrientedVirtualizingPanel</xref>.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.lineright
     */
    LineRight() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.LineRight()
    }

    /**
     * Scrolls content by one page toward the top.
     * @remarks
     * This implementation calls [SetVerticalOffset](orientedvirtualizingpanel_setverticaloffset_1333703417.md) using a value for "page" that is same as the [ViewportHeight](orientedvirtualizingpanel_viewportheight.md). 
     * <!--Override the method and call <xref targtype="method_winrt" rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel_setverticaloffset"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">SetVerticalOffset</xref> using a different measurement to change the interpretation of "page" for a derivation of 
     *       <xref rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel" targtype="class_winrt">OrientedVirtualizingPanel</xref>.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.pageup
     */
    PageUp() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.PageUp()
    }

    /**
     * Scrolls content by one page toward the bottom.
     * @remarks
     * This implementation calls [SetVerticalOffset](orientedvirtualizingpanel_setverticaloffset_1333703417.md) using a value for "page" that is same as the [ViewportHeight](orientedvirtualizingpanel_viewportheight.md). 
     * <!--Override the method and call <xref targtype="method_winrt" rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel_setverticaloffset"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">SetVerticalOffset</xref> using a different measurement to change the interpretation of "page" for a derivation of 
     *       <xref rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel" targtype="class_winrt">OrientedVirtualizingPanel</xref>.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.pagedown
     */
    PageDown() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.PageDown()
    }

    /**
     * Scrolls content by one page toward the left.
     * @remarks
     * This implementation calls [SetHorizontalOffset](orientedvirtualizingpanel_sethorizontaloffset_1971679761.md) using a value for "page" that is same as the [ViewportWidth](orientedvirtualizingpanel_viewportwidth.md). 
     * <!--Override the method and call <xref targtype="method_winrt" rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel_sethorizontaloffset"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">SetHorizontalOffset</xref> using a different measurement to change the interpretation of "page" for a derivation of 
     *       <xref rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel" targtype="class_winrt">OrientedVirtualizingPanel</xref>.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.pageleft
     */
    PageLeft() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.PageLeft()
    }

    /**
     * Scrolls content by one page toward the right.
     * @remarks
     * This implementation calls [SetHorizontalOffset](orientedvirtualizingpanel_sethorizontaloffset_1971679761.md) using a value for "page" that is same as the [ViewportWidth](orientedvirtualizingpanel_viewportwidth.md). 
     * <!--Override the method and call <xref targtype="method_winrt" rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel_sethorizontaloffset"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">SetHorizontalOffset</xref> using a different measurement to change the interpretation of "page" for a derivation of 
     *       <xref rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel" targtype="class_winrt">OrientedVirtualizingPanel</xref>.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.pageright
     */
    PageRight() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.PageRight()
    }

    /**
     * Scrolls content by one mouse-wheel click toward the top.
     * @remarks
     * This implementation calls [SetVerticalOffset](orientedvirtualizingpanel_setverticaloffset_1333703417.md) using a default value for "mouse-wheel click" of 48 pixels (3 lines), which comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md). 
     * <!--Override the method and call <xref targtype="method_winrt" rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel_setverticaloffset"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">SetVerticalOffset</xref> using a different measurement to change the interpretation of "mousewheel click" for a derivation of 
     *       <xref rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel" targtype="class_winrt">OrientedVirtualizingPanel</xref>.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.mousewheelup
     */
    MouseWheelUp() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.MouseWheelUp()
    }

    /**
     * Scrolls content by one mouse-wheel click toward the bottom.
     * @remarks
     * This implementation calls [SetVerticalOffset](orientedvirtualizingpanel_setverticaloffset_1333703417.md) using a default value for "mouse-wheel click" of 48 pixels (3 lines), which comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md). 
     * <!--Override the method and call <xref targtype="method_winrt" rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel_setverticaloffset"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">SetVerticalOffset</xref> using a different measurement to change the interpretation of "mousewheel click" for a derivation of 
     *       <xref rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel" targtype="class_winrt">OrientedVirtualizingPanel</xref>.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.mousewheeldown
     */
    MouseWheelDown() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.MouseWheelDown()
    }

    /**
     * Scrolls content by one mouse-wheel click toward the left.
     * @remarks
     * This calls [SetHorizontalOffset](orientedvirtualizingpanel_sethorizontaloffset_1971679761.md) using a default value for "mouse-wheel click" of 48 pixels (3 lines), which comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md). 
     * <!--Override the method and call <xref targtype="method_winrt" rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel_sethorizontaloffset"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">SetHorizontalOffset</xref> using a different measurement to change the interpretation of "mousewheel click" for a derivation of 
     *       <xref rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel" targtype="class_winrt">OrientedVirtualizingPanel</xref>.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.mousewheelleft
     */
    MouseWheelLeft() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.MouseWheelLeft()
    }

    /**
     * Scrolls content by one mouse-wheel click toward the right.
     * @remarks
     * This implementation calls [SetHorizontalOffset](orientedvirtualizingpanel_sethorizontaloffset_1971679761.md) using a default value for "mouse-wheel click" of 48 pixels (3 lines), which comes from a default [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md). 
     * <!--Override the method and call <xref targtype="method_winrt" rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel_sethorizontaloffset"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">SetHorizontalOffset</xref> using a different measurement to change the interpretation of "mousewheel click" for a derivation of 
     *       <xref rid="w_ui_xaml_ctrl_prim.orientedvirtualizingpanel" targtype="class_winrt">OrientedVirtualizingPanel</xref>.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.mousewheelright
     */
    MouseWheelRight() {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.MouseWheelRight()
    }

    /**
     * Changes the horizontal offset of content within the [OrientedVirtualizingPanel](orientedvirtualizingpanel.md) viewport.
     * @param {Float} offset The horizontal offset to set, in pixels.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.sethorizontaloffset
     */
    SetHorizontalOffset(offset) {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.SetHorizontalOffset(offset)
    }

    /**
     * Changes the vertical offset of content within the [OrientedVirtualizingPanel](orientedvirtualizingpanel.md) viewport.
     * @param {Float} offset The offset to set, in pixels.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.setverticaloffset
     */
    SetVerticalOffset(offset) {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.SetVerticalOffset(offset)
    }

    /**
     * Changes existing offsets in order to make the provided element visible in the viewport, and returns a [Rect](../windows.foundation/rect.md) measurement of the area.
     * @param {UIElement} visual_ The element to make visible.
     * @param {RECT} rectangle_ A rectangle representing the element's coordinate space.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.makevisible
     */
    MakeVisible(visual_, rectangle_) {
        if (!this.HasProp("__IOrientedVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IOrientedVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientedVirtualizingPanel := IOrientedVirtualizingPanel(outPtr)
        }

        return this.__IOrientedVirtualizingPanel.MakeVisible(visual_, rectangle_)
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
     * @param {Integer} orientation_ The orientation for the desired snap point set.
     * @param {Integer} alignment The alignment to use when applying the snap points.
     * @returns {IVectorView<Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.getirregularsnappoints
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
     * @param {Integer} orientation_ The orientation for the desired snap point set.
     * @param {Integer} alignment The alignment to use when applying the snap points.
     * @param {Pointer<Single>} offset Out parameter. The offset of the first snap point.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.getregularsnappoints
     */
    GetRegularSnapPoints(orientation_, alignment, offset) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.GetRegularSnapPoints(orientation_, alignment, offset)
    }

    /**
     * Returns the index values of the items that the specified point is between.
     * @remarks
     * Available starting in Windows 10, version 1607.
     * 
     * Call this method when handling a [DragOver](../windows.ui.xaml/uielement_dragover.md) event to return the indices of the two items between which the [DragOver](../windows.ui.xaml/uielement_dragover.md) is happening and where a potential drop and insertion would happen.
     * @param {POINT} position The point for which to get insertion indexes.
     * @param {Pointer<Int32>} first The index of the item before the specified point.
     * @param {Pointer<Int32>} second The index of the item after the specified point.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.orientedvirtualizingpanel.getinsertionindexes
     */
    GetInsertionIndexes(position, first, second) {
        if (!this.HasProp("__IInsertionPanel")) {
            if ((queryResult := this.QueryInterface(IInsertionPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInsertionPanel := IInsertionPanel(outPtr)
        }

        return this.__IInsertionPanel.GetInsertionIndexes(position, first, second)
    }

;@endregion Instance Methods
}
