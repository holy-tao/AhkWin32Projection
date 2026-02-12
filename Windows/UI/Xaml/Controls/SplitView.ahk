#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\ISplitView.ahk
#Include .\ISplitView2.ahk
#Include .\ISplitView3.ahk
#Include .\ISplitViewFactory.ahk
#Include .\ISplitViewStatics2.ahk
#Include .\ISplitViewStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\SplitView.ahk
#Include .\SplitViewPaneClosingEventArgs.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a container with two views; one view for the main content and another view that is typically used for navigation commands.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Split view](/windows/uwp/design/controls-and-patterns/split-view).
 * 
 * The SplitView control presents two areas of content: a [Pane](splitview_pane.md) and the main [Content](splitview_content.md). You typically use a SplitView to create a top-level navigation experience that adapts to different screen widths following the [nav pane pattern](/windows/uwp/controls-and-patterns/nav-pane) or the [master/details pattern](/windows/uwp/design/controls-and-patterns/master-details), but it's not strictly limited to use for navigation.
 * 
 * The XAML for this SplitView is shown in the Examples section.
 * 
 * <img alt="Split view control" src="images/controls/SplitViewBasic.png" />
 * 
 * The [Content](splitview_content.md) area is always present and can contain a single child element, which is typically a [Panel](panel.md) derived container that contains additional child elements. Although the [Content](splitview_content.md) is always present, it can be completely covered by the [Pane](splitview_pane.md).
 * 
 * There are several properties you can set to control the appearance and behavior of the [Pane](splitview_pane.md). Set the [IsPaneOpen](splitview_ispaneopen.md) property to open or close the [Pane](splitview_pane.md). The SplitView does not include a built-in affordance for users to toggle the state of the [Pane](splitview_pane.md), like a menu (or “hamburger”) button. You must provide this affordance and the code to toggle the [IsPaneOpen](splitview_ispaneopen.md) property.
 * 
 * To specify the length of the open pane, set the [OpenPaneLength](splitview_openpanelength.md) property. You can set the [PanePlacement](splitview_paneplacement.md) property to have the [Pane](splitview_pane.md) appear on either the left or right side of the [Content](splitview_content.md).
 * 
 * Although the appearance of the control is largely based on the elements assigned to the [Pane](splitview_pane.md) and [Content](splitview_content.md), you can change the default background color of the [Pane](splitview_pane.md) by setting the [PaneBackground](splitview_panebackground.md).
 * 
 * Set the [DisplayMode](splitview_displaymode.md) property to configure the interaction of the [Pane](splitview_pane.md) with the [Content](splitview_content.md). By default, the [Pane](splitview_pane.md) overlays the [Content](splitview_content.md) and disappears completely when closed. You can use one of the "inline" modes to show the [Pane](splitview_pane.md) side-by-side with the [Content](splitview_content.md). You can use the "compact" modes to make a narrow section of the [Pane](splitview_pane.md) remain visible even when the [Pane](splitview_pane.md) is closed. See the [SplitViewDisplayMode](splitviewdisplaymode.md) enumeration for more info about the supported modes.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SplitView extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISplitView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISplitView.IID

    /**
     * Identifies the [LightDismissOverlayMode](splitview_lightdismissoverlaymode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.lightdismissoverlaymodeproperty
     * @type {DependencyProperty} 
     */
    static LightDismissOverlayModeProperty {
        get => SplitView.get_LightDismissOverlayModeProperty()
    }

    /**
     * Identifies the [Content](splitview_content.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.contentproperty
     * @type {DependencyProperty} 
     */
    static ContentProperty {
        get => SplitView.get_ContentProperty()
    }

    /**
     * Identifies the [Pane](splitview_pane.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.paneproperty
     * @type {DependencyProperty} 
     */
    static PaneProperty {
        get => SplitView.get_PaneProperty()
    }

    /**
     * Identifies the [IsPaneOpen](splitview_ispaneopen.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.ispaneopenproperty
     * @type {DependencyProperty} 
     */
    static IsPaneOpenProperty {
        get => SplitView.get_IsPaneOpenProperty()
    }

    /**
     * Identifies the  [OpenPaneLength](splitview_openpanelength.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.openpanelengthproperty
     * @type {DependencyProperty} 
     */
    static OpenPaneLengthProperty {
        get => SplitView.get_OpenPaneLengthProperty()
    }

    /**
     * Identifies the [CompactPaneLength](splitview_compactpanelength.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.compactpanelengthproperty
     * @type {DependencyProperty} 
     */
    static CompactPaneLengthProperty {
        get => SplitView.get_CompactPaneLengthProperty()
    }

    /**
     * Identifies the [PanePlacement](splitview_paneplacement.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.paneplacementproperty
     * @type {DependencyProperty} 
     */
    static PanePlacementProperty {
        get => SplitView.get_PanePlacementProperty()
    }

    /**
     * Identifies the [DisplayMode](splitview_displaymode.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.displaymodeproperty
     * @type {DependencyProperty} 
     */
    static DisplayModeProperty {
        get => SplitView.get_DisplayModeProperty()
    }

    /**
     * Identifies the [TemplateSettings](splitview_templatesettings.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.templatesettingsproperty
     * @type {DependencyProperty} 
     */
    static TemplateSettingsProperty {
        get => SplitView.get_TemplateSettingsProperty()
    }

    /**
     * Identifies the [PaneBackground](splitview_panebackground.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.panebackgroundproperty
     * @type {DependencyProperty} 
     */
    static PaneBackgroundProperty {
        get => SplitView.get_PaneBackgroundProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {SplitView} 
     */
    static CreateInstance() {
        if (!SplitView.HasProp("__ISplitViewFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitViewFactory.IID)
            SplitView.__ISplitViewFactory := ISplitViewFactory(factoryPtr)
        }

        return SplitView.__ISplitViewFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LightDismissOverlayModeProperty() {
        if (!SplitView.HasProp("__ISplitViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitViewStatics2.IID)
            SplitView.__ISplitViewStatics2 := ISplitViewStatics2(factoryPtr)
        }

        return SplitView.__ISplitViewStatics2.get_LightDismissOverlayModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentProperty() {
        if (!SplitView.HasProp("__ISplitViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitViewStatics.IID)
            SplitView.__ISplitViewStatics := ISplitViewStatics(factoryPtr)
        }

        return SplitView.__ISplitViewStatics.get_ContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaneProperty() {
        if (!SplitView.HasProp("__ISplitViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitViewStatics.IID)
            SplitView.__ISplitViewStatics := ISplitViewStatics(factoryPtr)
        }

        return SplitView.__ISplitViewStatics.get_PaneProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsPaneOpenProperty() {
        if (!SplitView.HasProp("__ISplitViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitViewStatics.IID)
            SplitView.__ISplitViewStatics := ISplitViewStatics(factoryPtr)
        }

        return SplitView.__ISplitViewStatics.get_IsPaneOpenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OpenPaneLengthProperty() {
        if (!SplitView.HasProp("__ISplitViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitViewStatics.IID)
            SplitView.__ISplitViewStatics := ISplitViewStatics(factoryPtr)
        }

        return SplitView.__ISplitViewStatics.get_OpenPaneLengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CompactPaneLengthProperty() {
        if (!SplitView.HasProp("__ISplitViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitViewStatics.IID)
            SplitView.__ISplitViewStatics := ISplitViewStatics(factoryPtr)
        }

        return SplitView.__ISplitViewStatics.get_CompactPaneLengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PanePlacementProperty() {
        if (!SplitView.HasProp("__ISplitViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitViewStatics.IID)
            SplitView.__ISplitViewStatics := ISplitViewStatics(factoryPtr)
        }

        return SplitView.__ISplitViewStatics.get_PanePlacementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DisplayModeProperty() {
        if (!SplitView.HasProp("__ISplitViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitViewStatics.IID)
            SplitView.__ISplitViewStatics := ISplitViewStatics(factoryPtr)
        }

        return SplitView.__ISplitViewStatics.get_DisplayModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TemplateSettingsProperty() {
        if (!SplitView.HasProp("__ISplitViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitViewStatics.IID)
            SplitView.__ISplitViewStatics := ISplitViewStatics(factoryPtr)
        }

        return SplitView.__ISplitViewStatics.get_TemplateSettingsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaneBackgroundProperty() {
        if (!SplitView.HasProp("__ISplitViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitViewStatics.IID)
            SplitView.__ISplitViewStatics := ISplitViewStatics(factoryPtr)
        }

        return SplitView.__ISplitViewStatics.get_PaneBackgroundProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the contents of the main panel of a [SplitView](splitview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.content
     * @type {UIElement} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Gets or sets the contents of the pane of a [SplitView](splitview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.pane
     * @type {UIElement} 
     */
    Pane {
        get => this.get_Pane()
        set => this.put_Pane(value)
    }

    /**
     * Gets or sets a value that specifies whether the [SplitView](splitview.md) pane is expanded to its full width.
     * @remarks
     * The effects of this property are influenced by the value of the [DisplayMode](splitview_displaymode.md) property. 
     * 
     * | DisplayMode | Effect |
     * |---|---|
     * | **Inline** | IsPaneOpen is **true**. |
     * | **Overlay** | When IsPaneOpen is **false**, the pane is hidden. |
     * | **Compact** | When IsPaneOpen is **false**, the pane is shown in its compact size (see [CompactPaneLength](splitview_compactpanelength.md)). |
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.ispaneopen
     * @type {Boolean} 
     */
    IsPaneOpen {
        get => this.get_IsPaneOpen()
        set => this.put_IsPaneOpen(value)
    }

    /**
     * Gets or sets the width of the [SplitView](splitview.md) pane when it's fully expanded.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.openpanelength
     * @type {Float} 
     */
    OpenPaneLength {
        get => this.get_OpenPaneLength()
        set => this.put_OpenPaneLength(value)
    }

    /**
     * Gets or sets the width of the [SplitView](splitview.md) pane in its compact display mode.
     * @remarks
     * This property specifies the width of the pane when [DisplayMode](splitview_displaymode.md) is [Compact](splitviewdisplaymode.md) and [IsPaneOpen](splitview_ispaneopen.md) is **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.compactpanelength
     * @type {Float} 
     */
    CompactPaneLength {
        get => this.get_CompactPaneLength()
        set => this.put_CompactPaneLength(value)
    }

    /**
     * Gets or sets a value that specifies whether the pane is shown on the right or left side of the [SplitView](splitview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.paneplacement
     * @type {Integer} 
     */
    PanePlacement {
        get => this.get_PanePlacement()
        set => this.put_PanePlacement(value)
    }

    /**
     * Gets of sets a value that specifies how the pane and content areas of a [SplitView](splitview.md) are shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.displaymode
     * @type {Integer} 
     */
    DisplayMode {
        get => this.get_DisplayMode()
        set => this.put_DisplayMode(value)
    }

    /**
     * Gets an object that provides calculated values that can be referenced as **TemplateBinding** sources when defining templates for a [SplitView](splitview.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.templatesettings
     * @type {SplitViewTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * Gets or sets the [Brush](../windows.ui.xaml.media/brush.md) to apply to the background of the [Pane](splitview_pane.md) area of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.panebackground
     * @type {Brush} 
     */
    PaneBackground {
        get => this.get_PaneBackground()
        set => this.put_PaneBackground(value)
    }

    /**
     * Gets or sets a value that specifies whether the area outside of a *light-dismiss* UI is darkened.
     * @remarks
     * Transient UI, such as open pane of a [SplitView](splitview.md), closes when you click or tap outside of it. This is called light-dismiss. "Overlay" refers to the area outside of a light-dismiss UI.
     * 
     * By default, the "overlay" is darkened on the Xbox, and not darkened on other devices families. You can set LightDismissOverlayMode to **On** to make your app darken the "overlay" area on all device families, or set it to **Off** to not darken the "overlay" area on all device families.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitview.lightdismissoverlaymode
     * @type {Integer} 
     */
    LightDismissOverlayMode {
        get => this.get_LightDismissOverlayMode()
        set => this.put_LightDismissOverlayMode(value)
    }

    /**
     * Occurs when the [SplitView](splitview.md) pane is closing.
     * @remarks
     * Set the [SplitViewPaneClosingEventArgs.Cancel](splitviewpaneclosingeventargs_cancel.md) property to **true** in a handler for this event in order to cancel a [SplitView](splitview.md) pane closing action.
     * @type {TypedEventHandler<SplitView, SplitViewPaneClosingEventArgs>}
    */
    OnPaneClosing {
        get {
            if(!this.HasProp("__OnPaneClosing")){
                this.__OnPaneClosing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c674a1de-c3d9-5e39-bc39-121fc3cc7d41}"),
                    SplitView,
                    SplitViewPaneClosingEventArgs
                )
                this.__OnPaneClosingToken := this.add_PaneClosing(this.__OnPaneClosing.iface)
            }
            return this.__OnPaneClosing
        }
    }

    /**
     * Occurs when the [SplitView](splitview.md) pane is closed.
     * @type {TypedEventHandler<SplitView, IInspectable>}
    */
    OnPaneClosed {
        get {
            if(!this.HasProp("__OnPaneClosed")){
                this.__OnPaneClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e277bfe5-10c1-5472-9bc6-1ae39aebfc86}"),
                    SplitView,
                    IInspectable
                )
                this.__OnPaneClosedToken := this.add_PaneClosed(this.__OnPaneClosed.iface)
            }
            return this.__OnPaneClosed
        }
    }

    /**
     * Occurs when the [SplitView](splitview.md) pane is opening.
     * @type {TypedEventHandler<SplitView, IInspectable>}
    */
    OnPaneOpening {
        get {
            if(!this.HasProp("__OnPaneOpening")){
                this.__OnPaneOpening := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e277bfe5-10c1-5472-9bc6-1ae39aebfc86}"),
                    SplitView,
                    IInspectable
                )
                this.__OnPaneOpeningToken := this.add_PaneOpening(this.__OnPaneOpening.iface)
            }
            return this.__OnPaneOpening
        }
    }

    /**
     * Occurs when the [SplitView](splitview.md) pane is opened.
     * @type {TypedEventHandler<SplitView, IInspectable>}
    */
    OnPaneOpened {
        get {
            if(!this.HasProp("__OnPaneOpened")){
                this.__OnPaneOpened := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e277bfe5-10c1-5472-9bc6-1ae39aebfc86}"),
                    SplitView,
                    IInspectable
                )
                this.__OnPaneOpenedToken := this.add_PaneOpened(this.__OnPaneOpened.iface)
            }
            return this.__OnPaneOpened
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPaneClosingToken")) {
            this.remove_PaneClosing(this.__OnPaneClosingToken)
            this.__OnPaneClosing.iface.Dispose()
        }

        if(this.HasProp("__OnPaneClosedToken")) {
            this.remove_PaneClosed(this.__OnPaneClosedToken)
            this.__OnPaneClosed.iface.Dispose()
        }

        if(this.HasProp("__OnPaneOpeningToken")) {
            this.remove_PaneOpening(this.__OnPaneOpeningToken)
            this.__OnPaneOpening.iface.Dispose()
        }

        if(this.HasProp("__OnPaneOpenedToken")) {
            this.remove_PaneOpened(this.__OnPaneOpenedToken)
            this.__OnPaneOpened.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Content() {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.get_Content()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.put_Content(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Pane() {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.get_Pane()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Pane(value) {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.put_Pane(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaneOpen() {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.get_IsPaneOpen()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPaneOpen(value) {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.put_IsPaneOpen(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OpenPaneLength() {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.get_OpenPaneLength()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OpenPaneLength(value) {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.put_OpenPaneLength(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CompactPaneLength() {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.get_CompactPaneLength()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CompactPaneLength(value) {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.put_CompactPaneLength(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PanePlacement() {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.get_PanePlacement()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PanePlacement(value) {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.put_PanePlacement(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayMode() {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.get_DisplayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DisplayMode(value) {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.put_DisplayMode(value)
    }

    /**
     * 
     * @returns {SplitViewTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.get_TemplateSettings()
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PaneBackground() {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.get_PaneBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PaneBackground(value) {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.put_PaneBackground(value)
    }

    /**
     * 
     * @param {TypedEventHandler<SplitView, SplitViewPaneClosingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PaneClosing(handler) {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.add_PaneClosing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PaneClosing(token) {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.remove_PaneClosing(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SplitView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PaneClosed(handler) {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.add_PaneClosed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PaneClosed(token) {
        if (!this.HasProp("__ISplitView")) {
            if ((queryResult := this.QueryInterface(ISplitView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView := ISplitView(outPtr)
        }

        return this.__ISplitView.remove_PaneClosed(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LightDismissOverlayMode() {
        if (!this.HasProp("__ISplitView2")) {
            if ((queryResult := this.QueryInterface(ISplitView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView2 := ISplitView2(outPtr)
        }

        return this.__ISplitView2.get_LightDismissOverlayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LightDismissOverlayMode(value) {
        if (!this.HasProp("__ISplitView2")) {
            if ((queryResult := this.QueryInterface(ISplitView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView2 := ISplitView2(outPtr)
        }

        return this.__ISplitView2.put_LightDismissOverlayMode(value)
    }

    /**
     * 
     * @param {TypedEventHandler<SplitView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PaneOpening(handler) {
        if (!this.HasProp("__ISplitView3")) {
            if ((queryResult := this.QueryInterface(ISplitView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView3 := ISplitView3(outPtr)
        }

        return this.__ISplitView3.add_PaneOpening(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PaneOpening(token) {
        if (!this.HasProp("__ISplitView3")) {
            if ((queryResult := this.QueryInterface(ISplitView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView3 := ISplitView3(outPtr)
        }

        return this.__ISplitView3.remove_PaneOpening(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SplitView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PaneOpened(handler) {
        if (!this.HasProp("__ISplitView3")) {
            if ((queryResult := this.QueryInterface(ISplitView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView3 := ISplitView3(outPtr)
        }

        return this.__ISplitView3.add_PaneOpened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PaneOpened(token) {
        if (!this.HasProp("__ISplitView3")) {
            if ((queryResult := this.QueryInterface(ISplitView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitView3 := ISplitView3(outPtr)
        }

        return this.__ISplitView3.remove_PaneOpened(token)
    }

;@endregion Instance Methods
}
