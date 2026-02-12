#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IFlyoutBase.ahk
#Include .\IFlyoutBase2.ahk
#Include .\IFlyoutBase3.ahk
#Include .\IFlyoutBase4.ahk
#Include .\IFlyoutBase5.ahk
#Include .\IFlyoutBase6.ahk
#Include .\IFlyoutBaseOverrides.ahk
#Include .\IFlyoutBaseOverrides4.ahk
#Include .\IFlyoutBaseStatics3.ahk
#Include .\IFlyoutBaseStatics2.ahk
#Include .\IFlyoutBaseStatics.ahk
#Include .\IFlyoutBaseStatics6.ahk
#Include .\IFlyoutBaseStatics5.ahk
#Include ..\..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\FlyoutBase.ahk
#Include .\FlyoutBaseClosingEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents the base class for flyout controls, such as [Flyout](../windows.ui.xaml.controls/flyout.md) and [MenuFlyout](../windows.ui.xaml.controls/menuflyout.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class FlyoutBase extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFlyoutBase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFlyoutBase.IID

    /**
     * Identifies the **OverlayInputPassThroughElement** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.overlayinputpassthroughelementproperty
     * @type {DependencyProperty} 
     */
    static OverlayInputPassThroughElementProperty {
        get => FlyoutBase.get_OverlayInputPassThroughElementProperty()
    }

    /**
     * Identifies the [AllowFocusOnInteraction](flyoutbase_allowfocusoninteraction.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.allowfocusoninteractionproperty
     * @type {DependencyProperty} 
     */
    static AllowFocusOnInteractionProperty {
        get => FlyoutBase.get_AllowFocusOnInteractionProperty()
    }

    /**
     * Identifies the [LightDismissOverlayMode](flyoutbase_lightdismissoverlaymode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.lightdismissoverlaymodeproperty
     * @type {DependencyProperty} 
     */
    static LightDismissOverlayModeProperty {
        get => FlyoutBase.get_LightDismissOverlayModeProperty()
    }

    /**
     * Identifies the [AllowFocusWhenDisabled](flyoutbase_allowfocuswhendisabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.allowfocuswhendisabledproperty
     * @type {DependencyProperty} 
     */
    static AllowFocusWhenDisabledProperty {
        get => FlyoutBase.get_AllowFocusWhenDisabledProperty()
    }

    /**
     * Identifies the [ElementSoundMode](flyoutbase_elementsoundmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.elementsoundmodeproperty
     * @type {DependencyProperty} 
     */
    static ElementSoundModeProperty {
        get => FlyoutBase.get_ElementSoundModeProperty()
    }

    /**
     * Identifies the [Placement](flyoutbase_placement.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.placementproperty
     * @type {DependencyProperty} 
     */
    static PlacementProperty {
        get => FlyoutBase.get_PlacementProperty()
    }

    /**
     * Identifies the [FlyoutBase.AttachedFlyout](flyoutbase_attachedflyout.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.attachedflyoutproperty
     * @type {DependencyProperty} 
     */
    static AttachedFlyoutProperty {
        get => FlyoutBase.get_AttachedFlyoutProperty()
    }

    /**
     * Identifies the [ShouldConstrainToRootBounds](flyoutbase_shouldconstraintorootbounds.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.shouldconstraintorootboundsproperty
     * @type {DependencyProperty} 
     */
    static ShouldConstrainToRootBoundsProperty {
        get => FlyoutBase.get_ShouldConstrainToRootBoundsProperty()
    }

    /**
     * Identifies the [Target](flyoutbase_target.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.targetproperty
     * @type {DependencyProperty} 
     */
    static TargetProperty {
        get => FlyoutBase.get_TargetProperty()
    }

    /**
     * Identifies the [ShowMode](flyoutbase_showmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.showmodeproperty
     * @type {DependencyProperty} 
     */
    static ShowModeProperty {
        get => FlyoutBase.get_ShowModeProperty()
    }

    /**
     * Identifies the [InputDevicePrefersPrimaryCommands](flyoutbase_inputdeviceprefersprimarycommands.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.inputdeviceprefersprimarycommandsproperty
     * @type {DependencyProperty} 
     */
    static InputDevicePrefersPrimaryCommandsProperty {
        get => FlyoutBase.get_InputDevicePrefersPrimaryCommandsProperty()
    }

    /**
     * Identifies the [AreOpenCloseAnimationsEnabled](flyoutbase_areopencloseanimationsenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.areopencloseanimationsenabledproperty
     * @type {DependencyProperty} 
     */
    static AreOpenCloseAnimationsEnabledProperty {
        get => FlyoutBase.get_AreOpenCloseAnimationsEnabledProperty()
    }

    /**
     * Identifies the [IsOpen](flyoutbase_isopen.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.isopenproperty
     * @type {DependencyProperty} 
     */
    static IsOpenProperty {
        get => FlyoutBase.get_IsOpenProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OverlayInputPassThroughElementProperty() {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics3.IID)
            FlyoutBase.__IFlyoutBaseStatics3 := IFlyoutBaseStatics3(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics3.get_OverlayInputPassThroughElementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AllowFocusOnInteractionProperty() {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics2.IID)
            FlyoutBase.__IFlyoutBaseStatics2 := IFlyoutBaseStatics2(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics2.get_AllowFocusOnInteractionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LightDismissOverlayModeProperty() {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics2.IID)
            FlyoutBase.__IFlyoutBaseStatics2 := IFlyoutBaseStatics2(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics2.get_LightDismissOverlayModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AllowFocusWhenDisabledProperty() {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics2.IID)
            FlyoutBase.__IFlyoutBaseStatics2 := IFlyoutBaseStatics2(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics2.get_AllowFocusWhenDisabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ElementSoundModeProperty() {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics2.IID)
            FlyoutBase.__IFlyoutBaseStatics2 := IFlyoutBaseStatics2(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics2.get_ElementSoundModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlacementProperty() {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics.IID)
            FlyoutBase.__IFlyoutBaseStatics := IFlyoutBaseStatics(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics.get_PlacementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AttachedFlyoutProperty() {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics.IID)
            FlyoutBase.__IFlyoutBaseStatics := IFlyoutBaseStatics(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics.get_AttachedFlyoutProperty()
    }

    /**
     * Gets the flyout associated with the specified element.
     * @param {FrameworkElement} element The element for which to get the associated flyout.
     * @returns {FlyoutBase} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.getattachedflyout
     */
    static GetAttachedFlyout(element) {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics.IID)
            FlyoutBase.__IFlyoutBaseStatics := IFlyoutBaseStatics(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics.GetAttachedFlyout(element)
    }

    /**
     * Associates the specified flyout with the specified [FrameworkElement](../windows.ui.xaml/frameworkelement.md).
     * @param {FrameworkElement} element The element to associate the flyout with.
     * @param {FlyoutBase} value The flyout to associate with the specified element.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.setattachedflyout
     */
    static SetAttachedFlyout(element, value) {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics.IID)
            FlyoutBase.__IFlyoutBaseStatics := IFlyoutBaseStatics(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics.SetAttachedFlyout(element, value)
    }

    /**
     * Shows the flyout associated with the specified element, if any.
     * @param {FrameworkElement} flyoutOwner The element for which to show the associated flyout.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.showattachedflyout
     */
    static ShowAttachedFlyout(flyoutOwner) {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics.IID)
            FlyoutBase.__IFlyoutBaseStatics := IFlyoutBaseStatics(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics.ShowAttachedFlyout(flyoutOwner)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ShouldConstrainToRootBoundsProperty() {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics6.IID)
            FlyoutBase.__IFlyoutBaseStatics6 := IFlyoutBaseStatics6(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics6.get_ShouldConstrainToRootBoundsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetProperty() {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics5.IID)
            FlyoutBase.__IFlyoutBaseStatics5 := IFlyoutBaseStatics5(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics5.get_TargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ShowModeProperty() {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics5.IID)
            FlyoutBase.__IFlyoutBaseStatics5 := IFlyoutBaseStatics5(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics5.get_ShowModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_InputDevicePrefersPrimaryCommandsProperty() {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics5.IID)
            FlyoutBase.__IFlyoutBaseStatics5 := IFlyoutBaseStatics5(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics5.get_InputDevicePrefersPrimaryCommandsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AreOpenCloseAnimationsEnabledProperty() {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics5.IID)
            FlyoutBase.__IFlyoutBaseStatics5 := IFlyoutBaseStatics5(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics5.get_AreOpenCloseAnimationsEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsOpenProperty() {
        if (!FlyoutBase.HasProp("__IFlyoutBaseStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutBaseStatics5.IID)
            FlyoutBase.__IFlyoutBaseStatics5 := IFlyoutBaseStatics5(factoryPtr)
        }

        return FlyoutBase.__IFlyoutBaseStatics5.get_IsOpenProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the default placement to be used for the flyout, in relation to its placement target.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.placement
     * @type {Integer} 
     */
    Placement {
        get => this.get_Placement()
        set => this.put_Placement(value)
    }

    /**
     * Gets the element to use as the flyout's placement target.
     * @remarks
     * Available starting in Windows 10, version 1607.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.target
     * @type {FrameworkElement} 
     */
    Target {
        get => this.get_Target()
    }

    /**
     * Gets or sets a value that indicates whether the element automatically gets focus when the user interacts with it.
     * @remarks
     * Available starting in Windows 10, version 1607.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.allowfocusoninteraction
     * @type {Boolean} 
     */
    AllowFocusOnInteraction {
        get => this.get_AllowFocusOnInteraction()
        set => this.put_AllowFocusOnInteraction(value)
    }

    /**
     * Gets or sets a value that specifies whether the area outside of a *light-dismiss* UI is darkened.
     * @remarks
     * Transient UI, such as a [Flyout](../windows.ui.xaml.controls/flyout.md) or [MenuFlyout](../windows.ui.xaml.controls/menuflyout.md), closes when you click or tap outside of it. This is called light-dismiss. "Overlay" refers to the area outside of a light-dismiss UI.
     * 
     * By default, the "overlay" is darkened on the Xbox, and not darkened on other devices families. You can set LightDismissOverlayMode to `On` to make your app darken the "overlay" area on all device families, or set it to `Off` to not darken the "overlay" area on all device families.
     * 
     * For more info, see [Light dismiss behavior](/windows/uwp/design/controls-and-patterns/dialogs-and-flyouts/flyouts#light-dismiss-behavior) in the Flyouts article.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.lightdismissoverlaymode
     * @type {Integer} 
     */
    LightDismissOverlayMode {
        get => this.get_LightDismissOverlayMode()
        set => this.put_LightDismissOverlayMode(value)
    }

    /**
     * Gets or sets a value that specifies whether the control can receive focus when it's disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.allowfocuswhendisabled
     * @type {Boolean} 
     */
    AllowFocusWhenDisabled {
        get => this.get_AllowFocusWhenDisabled()
        set => this.put_AllowFocusWhenDisabled(value)
    }

    /**
     * Gets or sets a value that specifies the control's preference for whether it plays sounds.
     * @remarks
     * For more info, see [Sound in UWP apps](/windows/uwp/style/sound).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.elementsoundmode
     * @type {Integer} 
     */
    ElementSoundMode {
        get => this.get_ElementSoundMode()
        set => this.put_ElementSoundMode(value)
    }

    /**
     * Gets or sets an element that should receive pointer input events even when underneath the flyout's overlay.
     * @remarks
     * For more info, see [Light dismiss behavior](/windows/uwp/design/controls-and-patterns/dialogs-and-flyouts/flyouts#light-dismiss-behavior) in the Flyouts article.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.overlayinputpassthroughelement
     * @type {DependencyObject} 
     */
    OverlayInputPassThroughElement {
        get => this.get_OverlayInputPassThroughElement()
        set => this.put_OverlayInputPassThroughElement(value)
    }

    /**
     * Gets or sets a value that indicates how a flyout behaves when shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.showmode
     * @type {Integer} 
     */
    ShowMode {
        get => this.get_ShowMode()
        set => this.put_ShowMode(value)
    }

    /**
     * Gets a value that indicates whether the input device used to open the flyout does not easily open the secondary commands.
     * @remarks
     * Some input devices, such as touch or gaze, do not easily open the secondary commands menu, which requires a click in the open flyout. In these cases, you can move commands from the secondary command menu to the primary command bar to provide easier access using these inputs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.inputdeviceprefersprimarycommands
     * @type {Boolean} 
     */
    InputDevicePrefersPrimaryCommands {
        get => this.get_InputDevicePrefersPrimaryCommands()
    }

    /**
     * Gets or sets a value that indicates whether animations are played when the flyout is opened or closed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.areopencloseanimationsenabled
     * @type {Boolean} 
     */
    AreOpenCloseAnimationsEnabled {
        get => this.get_AreOpenCloseAnimationsEnabled()
        set => this.put_AreOpenCloseAnimationsEnabled(value)
    }

    /**
     * Gets a value that indicates whether the flyout is open.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.isopen
     * @type {Boolean} 
     */
    IsOpen {
        get => this.get_IsOpen()
    }

    /**
     * Gets or sets a value that indicates whether the flyout should be shown within the bounds of the XAML root.
     * @remarks
     * The default value depends on the derived type. For [Flyout](../windows.ui.xaml.controls/flyout.md), the default is `true`. For [MenuFlyout](../windows.ui.xaml.controls/menuflyout.md) and [CommandBarFlyout](../windows.ui.xaml.controls/commandbarflyout.md), the default is `false`.
     * 
     * This property is applicable only to apps running on the desktop. To check if the flyout is actually constrained to the root bounds, check the [IsConstrainedToRootBounds](flyoutbase_isconstrainedtorootbounds.md) property.
     * 
     * In an app running on the desktop, when this property is **true**, the flyout is shown within the main XAML window handle (HWND). When this property is **false**, the flyout is shown in its own top level HWND. In this case, the flyout might be positioned to extend beyond the main app window.
     * 
     * When a flyout with `ShouldConstrainToRootBounds = false` is first shown, it's placed in its own window and shown in that context. After it has been shown, `ShouldConstrainToRootBounds` cannot be set back to **true**.
     * 
     * The _XAML root_ might be a [CoreWindow](../windows.ui.core/corewindow.md), a [XAML island](/windows/uwp/xaml-platform/xaml-host-controls), or an [AppWindow](../windows.ui.windowmanagement/appwindow.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.shouldconstraintorootbounds
     * @type {Boolean} 
     */
    ShouldConstrainToRootBounds {
        get => this.get_ShouldConstrainToRootBounds()
        set => this.put_ShouldConstrainToRootBounds(value)
    }

    /**
     * Gets a value that indicates whether the flyout is shown within the bounds of the XAML root.
     * @remarks
     * For more info, see [ShouldConstrainToRootBounds](flyoutbase_shouldconstraintorootbounds.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.isconstrainedtorootbounds
     * @type {Boolean} 
     */
    IsConstrainedToRootBounds {
        get => this.get_IsConstrainedToRootBounds()
    }

    /**
     * Gets or sets the XamlRoot in which this flyout is being viewed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.xamlroot
     * @type {XamlRoot} 
     */
    XamlRoot {
        get => this.get_XamlRoot()
        set => this.put_XamlRoot(value)
    }

    /**
     * Occurs when the flyout is shown.
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
     * Occurs when the flyout is hidden.
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
     * Occurs before the flyout is shown.
     * @type {EventHandler<IInspectable>}
    */
    OnOpening {
        get {
            if(!this.HasProp("__OnOpening")){
                this.__OnOpening := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnOpeningToken := this.add_Opening(this.__OnOpening.iface)
            }
            return this.__OnOpening
        }
    }

    /**
     * Occurs when the flyout starts to be hidden.
     * @remarks
     * Available starting in Windows 10, version 1607.
     * @type {TypedEventHandler<FlyoutBase, FlyoutBaseClosingEventArgs>}
    */
    OnClosing {
        get {
            if(!this.HasProp("__OnClosing")){
                this.__OnClosing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{96e17fbc-78c7-5560-ac3a-587f46db70d6}"),
                    FlyoutBase,
                    FlyoutBaseClosingEventArgs
                )
                this.__OnClosingToken := this.add_Closing(this.__OnClosing.iface)
            }
            return this.__OnClosing
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
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

        if(this.HasProp("__OnOpeningToken")) {
            this.remove_Opening(this.__OnOpeningToken)
            this.__OnOpening.iface.Dispose()
        }

        if(this.HasProp("__OnClosingToken")) {
            this.remove_Closing(this.__OnClosingToken)
            this.__OnClosing.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Placement() {
        if (!this.HasProp("__IFlyoutBase")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase := IFlyoutBase(outPtr)
        }

        return this.__IFlyoutBase.get_Placement()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Placement(value) {
        if (!this.HasProp("__IFlyoutBase")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase := IFlyoutBase(outPtr)
        }

        return this.__IFlyoutBase.put_Placement(value)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opened(handler) {
        if (!this.HasProp("__IFlyoutBase")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase := IFlyoutBase(outPtr)
        }

        return this.__IFlyoutBase.add_Opened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Opened(token) {
        if (!this.HasProp("__IFlyoutBase")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase := IFlyoutBase(outPtr)
        }

        return this.__IFlyoutBase.remove_Opened(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IFlyoutBase")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase := IFlyoutBase(outPtr)
        }

        return this.__IFlyoutBase.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IFlyoutBase")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase := IFlyoutBase(outPtr)
        }

        return this.__IFlyoutBase.remove_Closed(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opening(handler) {
        if (!this.HasProp("__IFlyoutBase")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase := IFlyoutBase(outPtr)
        }

        return this.__IFlyoutBase.add_Opening(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Opening(token) {
        if (!this.HasProp("__IFlyoutBase")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase := IFlyoutBase(outPtr)
        }

        return this.__IFlyoutBase.remove_Opening(token)
    }

    /**
     * Shows the flyout placed in relation to the specified element.
     * @param {FrameworkElement} placementTarget The element to use as the flyout's placement target.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.showat
     */
    ShowAt(placementTarget) {
        if (!this.HasProp("__IFlyoutBase")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase := IFlyoutBase(outPtr)
        }

        return this.__IFlyoutBase.ShowAt(placementTarget)
    }

    /**
     * Closes the flyout.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.hide
     */
    Hide() {
        if (!this.HasProp("__IFlyoutBase")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase := IFlyoutBase(outPtr)
        }

        return this.__IFlyoutBase.Hide()
    }

    /**
     * 
     * @returns {FrameworkElement} 
     */
    get_Target() {
        if (!this.HasProp("__IFlyoutBase2")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase2 := IFlyoutBase2(outPtr)
        }

        return this.__IFlyoutBase2.get_Target()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowFocusOnInteraction() {
        if (!this.HasProp("__IFlyoutBase2")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase2 := IFlyoutBase2(outPtr)
        }

        return this.__IFlyoutBase2.get_AllowFocusOnInteraction()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowFocusOnInteraction(value) {
        if (!this.HasProp("__IFlyoutBase2")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase2 := IFlyoutBase2(outPtr)
        }

        return this.__IFlyoutBase2.put_AllowFocusOnInteraction(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LightDismissOverlayMode() {
        if (!this.HasProp("__IFlyoutBase2")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase2 := IFlyoutBase2(outPtr)
        }

        return this.__IFlyoutBase2.get_LightDismissOverlayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LightDismissOverlayMode(value) {
        if (!this.HasProp("__IFlyoutBase2")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase2 := IFlyoutBase2(outPtr)
        }

        return this.__IFlyoutBase2.put_LightDismissOverlayMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowFocusWhenDisabled() {
        if (!this.HasProp("__IFlyoutBase2")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase2 := IFlyoutBase2(outPtr)
        }

        return this.__IFlyoutBase2.get_AllowFocusWhenDisabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowFocusWhenDisabled(value) {
        if (!this.HasProp("__IFlyoutBase2")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase2 := IFlyoutBase2(outPtr)
        }

        return this.__IFlyoutBase2.put_AllowFocusWhenDisabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ElementSoundMode() {
        if (!this.HasProp("__IFlyoutBase2")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase2 := IFlyoutBase2(outPtr)
        }

        return this.__IFlyoutBase2.get_ElementSoundMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ElementSoundMode(value) {
        if (!this.HasProp("__IFlyoutBase2")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase2 := IFlyoutBase2(outPtr)
        }

        return this.__IFlyoutBase2.put_ElementSoundMode(value)
    }

    /**
     * 
     * @param {TypedEventHandler<FlyoutBase, FlyoutBaseClosingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closing(handler) {
        if (!this.HasProp("__IFlyoutBase2")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase2 := IFlyoutBase2(outPtr)
        }

        return this.__IFlyoutBase2.add_Closing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closing(token) {
        if (!this.HasProp("__IFlyoutBase2")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase2 := IFlyoutBase2(outPtr)
        }

        return this.__IFlyoutBase2.remove_Closing(token)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_OverlayInputPassThroughElement() {
        if (!this.HasProp("__IFlyoutBase3")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase3 := IFlyoutBase3(outPtr)
        }

        return this.__IFlyoutBase3.get_OverlayInputPassThroughElement()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_OverlayInputPassThroughElement(value) {
        if (!this.HasProp("__IFlyoutBase3")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase3 := IFlyoutBase3(outPtr)
        }

        return this.__IFlyoutBase3.put_OverlayInputPassThroughElement(value)
    }

    /**
     * Attempts to invoke a keyboard shortcut (accelerator).
     * @remarks
     * Call this method in the [OnProcessKeyboardAccelerators](flyoutbase_onprocesskeyboardaccelerators_1771064317.md) override when an accelerator is invoked and you want to influence the default accelerator handling.
     * @param {ProcessKeyboardAcceleratorEventArgs} args The [ProcessKeyboardAcceleratorEventArgs](../windows.ui.xaml.input/processkeyboardacceleratoreventargs.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.tryinvokekeyboardaccelerator
     */
    TryInvokeKeyboardAccelerator(args) {
        if (!this.HasProp("__IFlyoutBase4")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase4 := IFlyoutBase4(outPtr)
        }

        return this.__IFlyoutBase4.TryInvokeKeyboardAccelerator(args)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ShowMode() {
        if (!this.HasProp("__IFlyoutBase5")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase5 := IFlyoutBase5(outPtr)
        }

        return this.__IFlyoutBase5.get_ShowMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ShowMode(value) {
        if (!this.HasProp("__IFlyoutBase5")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase5 := IFlyoutBase5(outPtr)
        }

        return this.__IFlyoutBase5.put_ShowMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InputDevicePrefersPrimaryCommands() {
        if (!this.HasProp("__IFlyoutBase5")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase5 := IFlyoutBase5(outPtr)
        }

        return this.__IFlyoutBase5.get_InputDevicePrefersPrimaryCommands()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreOpenCloseAnimationsEnabled() {
        if (!this.HasProp("__IFlyoutBase5")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase5 := IFlyoutBase5(outPtr)
        }

        return this.__IFlyoutBase5.get_AreOpenCloseAnimationsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AreOpenCloseAnimationsEnabled(value) {
        if (!this.HasProp("__IFlyoutBase5")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase5 := IFlyoutBase5(outPtr)
        }

        return this.__IFlyoutBase5.put_AreOpenCloseAnimationsEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOpen() {
        if (!this.HasProp("__IFlyoutBase5")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase5 := IFlyoutBase5(outPtr)
        }

        return this.__IFlyoutBase5.get_IsOpen()
    }

    /**
     * Shows the flyout placed in relation to the specified element using the specified options.
     * @param {DependencyObject} placementTarget The element to use as the flyout's placement target.
     * @param {FlyoutShowOptions} showOptions The options to use when showing the flyout.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.showat
     */
    ShowAt1(placementTarget, showOptions) {
        if (!this.HasProp("__IFlyoutBase5")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase5 := IFlyoutBase5(outPtr)
        }

        return this.__IFlyoutBase5.ShowAt(placementTarget, showOptions)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldConstrainToRootBounds() {
        if (!this.HasProp("__IFlyoutBase6")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase6 := IFlyoutBase6(outPtr)
        }

        return this.__IFlyoutBase6.get_ShouldConstrainToRootBounds()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShouldConstrainToRootBounds(value) {
        if (!this.HasProp("__IFlyoutBase6")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase6 := IFlyoutBase6(outPtr)
        }

        return this.__IFlyoutBase6.put_ShouldConstrainToRootBounds(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConstrainedToRootBounds() {
        if (!this.HasProp("__IFlyoutBase6")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase6 := IFlyoutBase6(outPtr)
        }

        return this.__IFlyoutBase6.get_IsConstrainedToRootBounds()
    }

    /**
     * 
     * @returns {XamlRoot} 
     */
    get_XamlRoot() {
        if (!this.HasProp("__IFlyoutBase6")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase6 := IFlyoutBase6(outPtr)
        }

        return this.__IFlyoutBase6.get_XamlRoot()
    }

    /**
     * 
     * @param {XamlRoot} value 
     * @returns {HRESULT} 
     */
    put_XamlRoot(value) {
        if (!this.HasProp("__IFlyoutBase6")) {
            if ((queryResult := this.QueryInterface(IFlyoutBase6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBase6 := IFlyoutBase6(outPtr)
        }

        return this.__IFlyoutBase6.put_XamlRoot(value)
    }

    /**
     * When overridden in a derived class, initializes a control to show the flyout content as appropriate for the derived control. Note: This method has no base class implementation and must be overridden in a derived class.
     * @remarks
     * This method has no base class implementation and must be overridden in a derived class.
     * @returns {Control} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.createpresenter
     */
    CreatePresenter() {
        if (!this.HasProp("__IFlyoutBaseOverrides")) {
            if ((queryResult := this.QueryInterface(IFlyoutBaseOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBaseOverrides := IFlyoutBaseOverrides(outPtr)
        }

        return this.__IFlyoutBaseOverrides.CreatePresenter()
    }

    /**
     * Called just before a keyboard shortcut (accelerator) is processed in your app. Invoked whenever application code or internal processes call [ProcessKeyboardAccelerators](../windows.ui.xaml/uielement_processkeyboardaccelerators.md). Override this method to influence the default accelerator handling.
     * @param {ProcessKeyboardAcceleratorEventArgs} args The [ProcessKeyboardAcceleratorEventArgs](../windows.ui.xaml.input/processkeyboardacceleratoreventargs.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.onprocesskeyboardaccelerators
     */
    OnProcessKeyboardAccelerators(args) {
        if (!this.HasProp("__IFlyoutBaseOverrides4")) {
            if ((queryResult := this.QueryInterface(IFlyoutBaseOverrides4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBaseOverrides4 := IFlyoutBaseOverrides4(outPtr)
        }

        return this.__IFlyoutBaseOverrides4.OnProcessKeyboardAccelerators(args)
    }

;@endregion Instance Methods
}
