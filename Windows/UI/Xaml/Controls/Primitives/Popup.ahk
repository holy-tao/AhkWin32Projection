#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\FrameworkElement.ahk
#Include .\IPopup.ahk
#Include .\IPopup2.ahk
#Include .\IPopup3.ahk
#Include .\IPopup4.ahk
#Include .\IPopupStatics3.ahk
#Include .\IPopupStatics2.ahk
#Include .\IPopupStatics.ahk
#Include .\IPopupStatics4.ahk
#Include ..\..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Displays content on top of existing content.
 * @remarks
 * Do not use a Popup if a [Flyout](../windows.ui.xaml.controls/flyout.md), [MenuFlyout](../windows.ui.xaml.controls/menuflyout.md), [ToolTip](../windows.ui.xaml.controls/tooltip.md) or [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) ([MessageDialog](/uwp/api/windows.ui.popups.messagedialog) for a Windows 8 app) is more appropriate.
 * 
 * <!--For more info, see Displaying popups. (Add this when the topic is created.)-->
 * 
 * Popup is a general purpose container for hosting [UIElement](../windows.ui.xaml/uielement.md)s on top of existing content. You typically use a Popup to temporarily display content that accomplishes a particular task. The Popup does not have a default visual template. Instead, you must set the content yourself by specifying a single [Child](popup_child.md) element as content. You can define the Popup content inline, but it's common to define the content as a [UserControl](../windows.ui.xaml.controls/usercontrol.md), and then set the [UserControl](../windows.ui.xaml.controls/usercontrol.md) as the [Child](popup_child.md) of the Popup.
 * 
 * You position the Popup by setting the [HorizontalOffset](popup_horizontaloffset.md) and [VerticalOffset](popup_verticaloffset.md) properties. The Popup is offset relative to its immediate parent container. A Popup is not modal, so input to the screen behind it is not blocked. If the [ShouldConstrainToRootBounds](popup_shouldconstraintorootbounds.md) property is `false`, the Popup may be positioned such that it is not inside the bounds of the root of the content.
 * 
 * To show a Popup, set its [IsOpen](popup_isopen.md) property to **true**. To hide the Popup, set [IsOpen](popup_isopen.md) to **false**. You can set [IsLightDismissEnabled](popup_islightdismissenabled.md) to make the Popup hide automatically when a user taps anywhere away from it.
 * 
 * The Popup can host input controls. When hosting input controls like [TextBox](../windows.ui.xaml.controls/textbox.md), the touch keyboard might slide into view when the user touches the input control. If the Popup's parent container is already in the visual tree, the Popup automatically repositions itself when the touch keyboard is in view. Otherwise, the Popup is not repositioned and the touch keyboard can cover it. This can happen if you create the Popup in code and set [IsOpen](popup_isopen.md) to true without adding the Popup as a child of an element in the visual tree.
 * 
 * The Popup doesn't fire [RoutedEvents](../windows.ui.xaml/routedevent.md), for example KeyDown and PointerPressed. You can wire an event handler for these [RoutedEvents](../windows.ui.xaml/routedevent.md) on the child of the Popup.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class Popup extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPopup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPopup.IID

    /**
     * Identifies the [ShouldConstrainToRootBounds](popup_shouldconstraintorootbounds.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.shouldconstraintorootboundsproperty
     * @type {DependencyProperty} 
     */
    static ShouldConstrainToRootBoundsProperty {
        get => Popup.get_ShouldConstrainToRootBoundsProperty()
    }

    /**
     * Identifies the [LightDismissOverlayMode](popup_lightdismissoverlaymode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.lightdismissoverlaymodeproperty
     * @type {DependencyProperty} 
     */
    static LightDismissOverlayModeProperty {
        get => Popup.get_LightDismissOverlayModeProperty()
    }

    /**
     * Gets the identifier for the [Child](popup_child.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.childproperty
     * @type {DependencyProperty} 
     */
    static ChildProperty {
        get => Popup.get_ChildProperty()
    }

    /**
     * Gets the identifier for the [IsOpen](popup_isopen.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.isopenproperty
     * @type {DependencyProperty} 
     */
    static IsOpenProperty {
        get => Popup.get_IsOpenProperty()
    }

    /**
     * Gets the identifier for the [HorizontalOffset](popup_horizontaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.horizontaloffsetproperty
     * @type {DependencyProperty} 
     */
    static HorizontalOffsetProperty {
        get => Popup.get_HorizontalOffsetProperty()
    }

    /**
     * Gets the identifier for the [VerticalOffset](popup_verticaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.verticaloffsetproperty
     * @type {DependencyProperty} 
     */
    static VerticalOffsetProperty {
        get => Popup.get_VerticalOffsetProperty()
    }

    /**
     * Identifies the [ChildTransitions](popup_childtransitions.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.childtransitionsproperty
     * @type {DependencyProperty} 
     */
    static ChildTransitionsProperty {
        get => Popup.get_ChildTransitionsProperty()
    }

    /**
     * Identifies the [IsLightDismissEnabled](popup_islightdismissenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.islightdismissenabledproperty
     * @type {DependencyProperty} 
     */
    static IsLightDismissEnabledProperty {
        get => Popup.get_IsLightDismissEnabledProperty()
    }

    /**
     * Identifies the [PlacementTarget](popup_placementtarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.placementtargetproperty
     * @type {DependencyProperty} 
     */
    static PlacementTargetProperty {
        get => Popup.get_PlacementTargetProperty()
    }

    /**
     * Identifies the [DesiredPlacement](popup_desiredplacement.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.desiredplacementproperty
     * @type {DependencyProperty} 
     */
    static DesiredPlacementProperty {
        get => Popup.get_DesiredPlacementProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ShouldConstrainToRootBoundsProperty() {
        if (!Popup.HasProp("__IPopupStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Popup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopupStatics3.IID)
            Popup.__IPopupStatics3 := IPopupStatics3(factoryPtr)
        }

        return Popup.__IPopupStatics3.get_ShouldConstrainToRootBoundsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LightDismissOverlayModeProperty() {
        if (!Popup.HasProp("__IPopupStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Popup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopupStatics2.IID)
            Popup.__IPopupStatics2 := IPopupStatics2(factoryPtr)
        }

        return Popup.__IPopupStatics2.get_LightDismissOverlayModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ChildProperty() {
        if (!Popup.HasProp("__IPopupStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Popup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopupStatics.IID)
            Popup.__IPopupStatics := IPopupStatics(factoryPtr)
        }

        return Popup.__IPopupStatics.get_ChildProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsOpenProperty() {
        if (!Popup.HasProp("__IPopupStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Popup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopupStatics.IID)
            Popup.__IPopupStatics := IPopupStatics(factoryPtr)
        }

        return Popup.__IPopupStatics.get_IsOpenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalOffsetProperty() {
        if (!Popup.HasProp("__IPopupStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Popup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopupStatics.IID)
            Popup.__IPopupStatics := IPopupStatics(factoryPtr)
        }

        return Popup.__IPopupStatics.get_HorizontalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalOffsetProperty() {
        if (!Popup.HasProp("__IPopupStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Popup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopupStatics.IID)
            Popup.__IPopupStatics := IPopupStatics(factoryPtr)
        }

        return Popup.__IPopupStatics.get_VerticalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ChildTransitionsProperty() {
        if (!Popup.HasProp("__IPopupStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Popup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopupStatics.IID)
            Popup.__IPopupStatics := IPopupStatics(factoryPtr)
        }

        return Popup.__IPopupStatics.get_ChildTransitionsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsLightDismissEnabledProperty() {
        if (!Popup.HasProp("__IPopupStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Popup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopupStatics.IID)
            Popup.__IPopupStatics := IPopupStatics(factoryPtr)
        }

        return Popup.__IPopupStatics.get_IsLightDismissEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlacementTargetProperty() {
        if (!Popup.HasProp("__IPopupStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Popup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopupStatics4.IID)
            Popup.__IPopupStatics4 := IPopupStatics4(factoryPtr)
        }

        return Popup.__IPopupStatics4.get_PlacementTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DesiredPlacementProperty() {
        if (!Popup.HasProp("__IPopupStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Popup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopupStatics4.IID)
            Popup.__IPopupStatics4 := IPopupStatics4(factoryPtr)
        }

        return Popup.__IPopupStatics4.get_DesiredPlacementProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the content to be hosted in the popup.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.child
     * @type {UIElement} 
     */
    Child {
        get => this.get_Child()
        set => this.put_Child(value)
    }

    /**
     * Gets or sets whether the popup is currently displayed on the screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.isopen
     * @type {Boolean} 
     */
    IsOpen {
        get => this.get_IsOpen()
        set => this.put_IsOpen(value)
    }

    /**
     * Gets or sets the distance between the left side of the application window and the left side of the popup.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.horizontaloffset
     * @type {Float} 
     */
    HorizontalOffset {
        get => this.get_HorizontalOffset()
        set => this.put_HorizontalOffset(value)
    }

    /**
     * Gets or sets the distance between the top of the application window and the top of the popup.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.verticaloffset
     * @type {Float} 
     */
    VerticalOffset {
        get => this.get_VerticalOffset()
        set => this.put_VerticalOffset(value)
    }

    /**
     * Gets or sets the collection of [Transition](../windows.ui.xaml.media.animation/transition.md) style elements that apply to child content of a [Popup](popup.md).
     * @remarks
     * > [!NOTE]
     * > Prior to Windows 10, version 1809 (SDK 17763), the XAML syntax for properties that have a [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) value requires that you declare an explicit [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) object element as the value, and then provide object elements as child elements of [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) for each of the transition animations you want to use. In Windows 10, version 1809 (SDK 17763) or later, [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) supports the implicit collection usage, so you can omit the collection object element. For more info on implicit collections and XAML, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
     * 
     * Transition animations play a particular role in the UI design of your app. The basic idea is that when there is a change or transition, the animation draws the attention of the user to the change.
     * <!-- For more info, see  Transition animations and theme animations.-->
     * It's not common to set the value of the ChildTransitionsproperty directly on a [Popup](popup.md)that is a direct element of app UI. It's more common to have a transitions collection be a part of a visual state, template or style. In this case you use mechanisms such as [Setter](../windows.ui.xaml/setter.md)of a [Style](../windows.ui.xaml/style.md)to specify the ChildTransitionsproperty. Styles are typically stored as a XAML resource.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.childtransitions
     * @type {TransitionCollection} 
     */
    ChildTransitions {
        get => this.get_ChildTransitions()
        set => this.put_ChildTransitions(value)
    }

    /**
     * Gets or sets a value that determines how the [Popup](popup.md) can be dismissed.
     * @remarks
     * *Light dismiss* is when the user taps on any area other than the popup.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.islightdismissenabled
     * @type {Boolean} 
     */
    IsLightDismissEnabled {
        get => this.get_IsLightDismissEnabled()
        set => this.put_IsLightDismissEnabled(value)
    }

    /**
     * Gets or sets a value that specifies whether the area outside of a *light-dismiss* UI is darkened.
     * @remarks
     * Transient UI, such as a [Popup](popup.md), closes when you click or tap outside of it. This is called light-dismiss. "Overlay" refers to the area outside of a light-dismiss UI.
     * 
     * By default, the "overlay" is darkened on the Xbox, and not darkened on other devices families. You can set [LightDismissOverlayMode](flyoutbase_lightdismissoverlaymodeproperty.md) to **On** to make your app darken the "overlay" area on all device families, or set it to **Off** to not darken the "overlay" area on all device families.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.lightdismissoverlaymode
     * @type {Integer} 
     */
    LightDismissOverlayMode {
        get => this.get_LightDismissOverlayMode()
        set => this.put_LightDismissOverlayMode(value)
    }

    /**
     * Gets or sets a value that indicates whether the popup should be shown within the bounds of the XAML root.
     * @remarks
     * This property is applicable only to apps running on the desktop. To check if the popup is actually constrained to the root bounds, check the [IsConstrainedToRootBounds](popup_isconstrainedtorootbounds.md) property.
     * 
     * In an app running on the desktop, when this property is **true**, the popup is shown within the main XAML window handle (HWND). When this property is **false**, the popup is shown in its own top level HWND. In this case, the popup might be positioned to extend beyond the main app window.
     * 
     * When a popup with `ShouldConstrainToRootBounds = false` is first shown, it’s placed in its own window and shown in that context. After it has been shown, `ShouldConstrainToRootBounds` cannot be set back to **true**.
     * 
     * The _XAML root_ might be a [CoreWindow](../windows.ui.core/corewindow.md), a [XAML island](/windows/uwp/xaml-platform/xaml-host-controls), or an [AppWindow](../windows.ui.windowmanagement/appwindow.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.shouldconstraintorootbounds
     * @type {Boolean} 
     */
    ShouldConstrainToRootBounds {
        get => this.get_ShouldConstrainToRootBounds()
        set => this.put_ShouldConstrainToRootBounds(value)
    }

    /**
     * Gets a value that indicates whether the popup is shown within the bounds of the XAML root.
     * @remarks
     * For more info, see [ShouldConstrainToRootBounds](popup_shouldconstraintorootbounds.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.isconstrainedtorootbounds
     * @type {Boolean} 
     */
    IsConstrainedToRootBounds {
        get => this.get_IsConstrainedToRootBounds()
    }

    /**
     * Gets or sets the element to use as the popup's placement target.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.placementtarget
     * @type {FrameworkElement} 
     */
    PlacementTarget {
        get => this.get_PlacementTarget()
        set => this.put_PlacementTarget(value)
    }

    /**
     * Gets or sets the preferred placement to be used for the popup, in relation to its placement target.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.desiredplacement
     * @type {Integer} 
     */
    DesiredPlacement {
        get => this.get_DesiredPlacement()
        set => this.put_DesiredPlacement(value)
    }

    /**
     * Gets the actual placement of the popup, in relation to its placement target.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.popup.actualplacement
     * @type {Integer} 
     */
    ActualPlacement {
        get => this.get_ActualPlacement()
    }

    /**
     * Fires when the [IsOpen](popup_isopen.md) property is set to true.
     * @type {EventHandler<IInspectable>}
    */
    OnOpened {
        get {
            if(!this.HasProp("__OnOpened")){
                this.__OnOpened := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnOpenedToken := this.add_Opened(this.__OnOpened.iface)
            }
            return this.__OnOpened
        }
    }

    /**
     * Fires when the [IsOpen](popup_isopen.md) property is set to false.
     * @type {EventHandler<IInspectable>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

    /**
     * 
     * @type {EventHandler<IInspectable>}
    */
    OnActualPlacementChanged {
        get {
            if(!this.HasProp("__OnActualPlacementChanged")){
                this.__OnActualPlacementChanged := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnActualPlacementChangedToken := this.add_ActualPlacementChanged(this.__OnActualPlacementChanged.iface)
            }
            return this.__OnActualPlacementChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Popup](popup.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Popup")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnOpenedToken")) {
            this.remove_Opened(this.__OnOpenedToken)
            this.__OnOpened.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        if(this.HasProp("__OnActualPlacementChangedToken")) {
            this.remove_ActualPlacementChanged(this.__OnActualPlacementChangedToken)
            this.__OnActualPlacementChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Child() {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.get_Child()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Child(value) {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.put_Child(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOpen() {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.get_IsOpen()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOpen(value) {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.put_IsOpen(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalOffset() {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.get_HorizontalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalOffset(value) {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.put_HorizontalOffset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalOffset() {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.get_VerticalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_VerticalOffset(value) {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.put_VerticalOffset(value)
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_ChildTransitions() {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.get_ChildTransitions()
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_ChildTransitions(value) {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.put_ChildTransitions(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLightDismissEnabled() {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.get_IsLightDismissEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsLightDismissEnabled(value) {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.put_IsLightDismissEnabled(value)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opened(handler) {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.add_Opened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Opened(token) {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.remove_Opened(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IPopup")) {
            if ((queryResult := this.QueryInterface(IPopup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup := IPopup(outPtr)
        }

        return this.__IPopup.remove_Closed(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LightDismissOverlayMode() {
        if (!this.HasProp("__IPopup2")) {
            if ((queryResult := this.QueryInterface(IPopup2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup2 := IPopup2(outPtr)
        }

        return this.__IPopup2.get_LightDismissOverlayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LightDismissOverlayMode(value) {
        if (!this.HasProp("__IPopup2")) {
            if ((queryResult := this.QueryInterface(IPopup2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup2 := IPopup2(outPtr)
        }

        return this.__IPopup2.put_LightDismissOverlayMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldConstrainToRootBounds() {
        if (!this.HasProp("__IPopup3")) {
            if ((queryResult := this.QueryInterface(IPopup3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup3 := IPopup3(outPtr)
        }

        return this.__IPopup3.get_ShouldConstrainToRootBounds()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShouldConstrainToRootBounds(value) {
        if (!this.HasProp("__IPopup3")) {
            if ((queryResult := this.QueryInterface(IPopup3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup3 := IPopup3(outPtr)
        }

        return this.__IPopup3.put_ShouldConstrainToRootBounds(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConstrainedToRootBounds() {
        if (!this.HasProp("__IPopup3")) {
            if ((queryResult := this.QueryInterface(IPopup3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup3 := IPopup3(outPtr)
        }

        return this.__IPopup3.get_IsConstrainedToRootBounds()
    }

    /**
     * 
     * @returns {FrameworkElement} 
     */
    get_PlacementTarget() {
        if (!this.HasProp("__IPopup4")) {
            if ((queryResult := this.QueryInterface(IPopup4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup4 := IPopup4(outPtr)
        }

        return this.__IPopup4.get_PlacementTarget()
    }

    /**
     * 
     * @param {FrameworkElement} value 
     * @returns {HRESULT} 
     */
    put_PlacementTarget(value) {
        if (!this.HasProp("__IPopup4")) {
            if ((queryResult := this.QueryInterface(IPopup4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup4 := IPopup4(outPtr)
        }

        return this.__IPopup4.put_PlacementTarget(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredPlacement() {
        if (!this.HasProp("__IPopup4")) {
            if ((queryResult := this.QueryInterface(IPopup4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup4 := IPopup4(outPtr)
        }

        return this.__IPopup4.get_DesiredPlacement()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredPlacement(value) {
        if (!this.HasProp("__IPopup4")) {
            if ((queryResult := this.QueryInterface(IPopup4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup4 := IPopup4(outPtr)
        }

        return this.__IPopup4.put_DesiredPlacement(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActualPlacement() {
        if (!this.HasProp("__IPopup4")) {
            if ((queryResult := this.QueryInterface(IPopup4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup4 := IPopup4(outPtr)
        }

        return this.__IPopup4.get_ActualPlacement()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActualPlacementChanged(handler) {
        if (!this.HasProp("__IPopup4")) {
            if ((queryResult := this.QueryInterface(IPopup4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup4 := IPopup4(outPtr)
        }

        return this.__IPopup4.add_ActualPlacementChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ActualPlacementChanged(token) {
        if (!this.HasProp("__IPopup4")) {
            if ((queryResult := this.QueryInterface(IPopup4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopup4 := IPopup4(outPtr)
        }

        return this.__IPopup4.remove_ActualPlacementChanged(token)
    }

;@endregion Instance Methods
}
