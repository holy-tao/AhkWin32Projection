#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IControl.ahk
#Include .\IControl2.ahk
#Include .\IControl3.ahk
#Include .\IControl4.ahk
#Include .\IControl5.ahk
#Include .\IControl7.ahk
#Include .\IControlProtected.ahk
#Include .\IControlOverrides.ahk
#Include .\IControlOverrides6.ahk
#Include .\IControlStatics2.ahk
#Include .\IControlStatics4.ahk
#Include .\IControlStatics5.ahk
#Include .\IControlStatics3.ahk
#Include .\IControlStatics7.ahk
#Include .\IControlStatics.ahk
#Include ..\DependencyPropertyChangedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\DependencyPropertyChangedEventArgs.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\Control.ahk
#Include .\FocusEngagedEventArgs.ahk
#Include .\FocusDisengagedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents the base class for UI elements that use a [ControlTemplate](controltemplate.md) to define their appearance. Parent class for [ContentControl](contentcontrol.md), [UserControl](usercontrol.md), [ItemsControl](itemscontrol.md) and several practical controls.
 * @remarks
 * The Control class is the base class for many of the controls you add to an app and its UI. The Control class defines very little behavior; you can add an actual Control element to XAML for UI but you typically add something that inherits from Control directly or indirectly, such as a [Button](button.md) or [ListBox](listbox.md). For a list of controls you can use, see [Controls by function](/windows/uwp/controls-and-patterns/controls-by-function).
 * 
 * The [Template](control_template.md) property, which uses the type [ControlTemplate](controltemplate.md), specifies the visual appearance of a control. If you want to change the appearance of a control but retain its functionality, you should consider creating a new [ControlTemplate](controltemplate.md) instead of defining a new Control-based class. For more info, see [Control templates](/windows/uwp/design/controls-and-patterns/control-templates).
 * 
 * Control is the parent of [UserControl](usercontrol.md). [UserControl](usercontrol.md) is the intended base class for lightweight controls that don't need visual states. Although the [UserControl](usercontrol.md) technically inherits the [Template](control_template.md) property, you cannot apply a template to a [UserControl](usercontrol.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Control extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IControl.IID

    /**
     * Identifies the [IsTextScaleFactorEnabled](control_istextscalefactorenabled.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.istextscalefactorenabledproperty
     * @type {DependencyProperty} 
     */
    static IsTextScaleFactorEnabledProperty {
        get => Control.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * Identifies the [IsFocusEngagementEnabled](control_isfocusengagementenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.isfocusengagementenabledproperty
     * @type {DependencyProperty} 
     */
    static IsFocusEngagementEnabledProperty {
        get => Control.get_IsFocusEngagementEnabledProperty()
    }

    /**
     * Identifies the [IsFocusEngaged](control_isfocusengaged.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.isfocusengagedproperty
     * @type {DependencyProperty} 
     */
    static IsFocusEngagedProperty {
        get => Control.get_IsFocusEngagedProperty()
    }

    /**
     * Identifies the [RequiresPointer](control_requirespointer.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.requirespointerproperty
     * @type {DependencyProperty} 
     */
    static RequiresPointerProperty {
        get => Control.get_RequiresPointerProperty()
    }

    /**
     * Identifies the [XYFocusLeft](control_xyfocusleft.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.xyfocusleftproperty
     * @type {DependencyProperty} 
     */
    static XYFocusLeftProperty {
        get => Control.get_XYFocusLeftProperty()
    }

    /**
     * Identifies the [XYFocusRight](control_xyfocusright.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.xyfocusrightproperty
     * @type {DependencyProperty} 
     */
    static XYFocusRightProperty {
        get => Control.get_XYFocusRightProperty()
    }

    /**
     * Identifies the [XYFocusUp](control_xyfocusup.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.xyfocusupproperty
     * @type {DependencyProperty} 
     */
    static XYFocusUpProperty {
        get => Control.get_XYFocusUpProperty()
    }

    /**
     * Identifies the [XYFocusDown](control_xyfocusdown.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.xyfocusdownproperty
     * @type {DependencyProperty} 
     */
    static XYFocusDownProperty {
        get => Control.get_XYFocusDownProperty()
    }

    /**
     * Identifies the [ElementSoundMode](control_elementsoundmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.elementsoundmodeproperty
     * @type {DependencyProperty} 
     */
    static ElementSoundModeProperty {
        get => Control.get_ElementSoundModeProperty()
    }

    /**
     * Identifies the **DefaultStyleResourceUri** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.defaultstyleresourceuriproperty
     * @type {DependencyProperty} 
     */
    static DefaultStyleResourceUriProperty {
        get => Control.get_DefaultStyleResourceUriProperty()
    }

    /**
     * Identifies the [Control.IsTemplateKeyTipTarget](control_istemplatekeytiptarget.md) XAML attached property.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.istemplatekeytiptargetproperty
     * @type {DependencyProperty} 
     */
    static IsTemplateKeyTipTargetProperty {
        get => Control.get_IsTemplateKeyTipTargetProperty()
    }

    /**
     * Identifies the [UseSystemFocusVisuals](control_usesystemfocusvisuals.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.usesystemfocusvisualsproperty
     * @type {DependencyProperty} 
     */
    static UseSystemFocusVisualsProperty {
        get => Control.get_UseSystemFocusVisualsProperty()
    }

    /**
     * Identifies the [Control.IsTemplateFocusTarget](control_istemplatefocustarget.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.istemplatefocustargetproperty
     * @type {DependencyProperty} 
     */
    static IsTemplateFocusTargetProperty {
        get => Control.get_IsTemplateFocusTargetProperty()
    }

    /**
     * Identifies the [BackgroundSizing](control_backgroundsizing.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.backgroundsizingproperty
     * @type {DependencyProperty} 
     */
    static BackgroundSizingProperty {
        get => Control.get_BackgroundSizingProperty()
    }

    /**
     * Identifies the [CornerRadius](control_cornerradius.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.cornerradiusproperty
     * @type {DependencyProperty} 
     */
    static CornerRadiusProperty {
        get => Control.get_CornerRadiusProperty()
    }

    /**
     * Identifies the [FontSize](control_fontsize.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.fontsizeproperty
     * @type {DependencyProperty} 
     */
    static FontSizeProperty {
        get => Control.get_FontSizeProperty()
    }

    /**
     * Identifies the [FontFamily](control_fontfamily.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.fontfamilyproperty
     * @type {DependencyProperty} 
     */
    static FontFamilyProperty {
        get => Control.get_FontFamilyProperty()
    }

    /**
     * Identifies the [FontWeight](control_fontweight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.fontweightproperty
     * @type {DependencyProperty} 
     */
    static FontWeightProperty {
        get => Control.get_FontWeightProperty()
    }

    /**
     * Identifies the [FontStyle](control_fontstyle.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.fontstyleproperty
     * @type {DependencyProperty} 
     */
    static FontStyleProperty {
        get => Control.get_FontStyleProperty()
    }

    /**
     * Identifies the [FontStretch](control_fontstretch.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.fontstretchproperty
     * @type {DependencyProperty} 
     */
    static FontStretchProperty {
        get => Control.get_FontStretchProperty()
    }

    /**
     * Identifies the [CharacterSpacing](control_characterspacing.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.characterspacingproperty
     * @type {DependencyProperty} 
     */
    static CharacterSpacingProperty {
        get => Control.get_CharacterSpacingProperty()
    }

    /**
     * Identifies the [Foreground](control_foreground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.foregroundproperty
     * @type {DependencyProperty} 
     */
    static ForegroundProperty {
        get => Control.get_ForegroundProperty()
    }

    /**
     * Identifies the [IsTabStop](control_istabstop.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.istabstopproperty
     * @type {DependencyProperty} 
     */
    static IsTabStopProperty {
        get => Control.get_IsTabStopProperty()
    }

    /**
     * Identifies the [IsEnabled](control_isenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.isenabledproperty
     * @type {DependencyProperty} 
     */
    static IsEnabledProperty {
        get => Control.get_IsEnabledProperty()
    }

    /**
     * Identifies the [TabIndex](control_tabindex.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.tabindexproperty
     * @type {DependencyProperty} 
     */
    static TabIndexProperty {
        get => Control.get_TabIndexProperty()
    }

    /**
     * Identifies the [TabNavigation](control_tabnavigation.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.tabnavigationproperty
     * @type {DependencyProperty} 
     */
    static TabNavigationProperty {
        get => Control.get_TabNavigationProperty()
    }

    /**
     * Identifies the [Template](control_template.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.templateproperty
     * @type {DependencyProperty} 
     */
    static TemplateProperty {
        get => Control.get_TemplateProperty()
    }

    /**
     * Identifies the [Padding](control_padding.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.paddingproperty
     * @type {DependencyProperty} 
     */
    static PaddingProperty {
        get => Control.get_PaddingProperty()
    }

    /**
     * Identifies the [HorizontalContentAlignment](control_horizontalcontentalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.horizontalcontentalignmentproperty
     * @type {DependencyProperty} 
     */
    static HorizontalContentAlignmentProperty {
        get => Control.get_HorizontalContentAlignmentProperty()
    }

    /**
     * Identifies the [VerticalContentAlignment](control_verticalcontentalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.verticalcontentalignmentproperty
     * @type {DependencyProperty} 
     */
    static VerticalContentAlignmentProperty {
        get => Control.get_VerticalContentAlignmentProperty()
    }

    /**
     * Identifies the [Background](control_background.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.backgroundproperty
     * @type {DependencyProperty} 
     */
    static BackgroundProperty {
        get => Control.get_BackgroundProperty()
    }

    /**
     * Identifies the [BorderThickness](control_borderthickness.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.borderthicknessproperty
     * @type {DependencyProperty} 
     */
    static BorderThicknessProperty {
        get => Control.get_BorderThicknessProperty()
    }

    /**
     * Identifies the [BorderBrush](control_borderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.borderbrushproperty
     * @type {DependencyProperty} 
     */
    static BorderBrushProperty {
        get => Control.get_BorderBrushProperty()
    }

    /**
     * Identifies the [DefaultStyleKey](control_defaultstylekey.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.defaultstylekeyproperty
     * @type {DependencyProperty} 
     */
    static DefaultStyleKeyProperty {
        get => Control.get_DefaultStyleKeyProperty()
    }

    /**
     * Identifies the [FocusState](control_focusstate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.focusstateproperty
     * @type {DependencyProperty} 
     */
    static FocusStateProperty {
        get => Control.get_FocusStateProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextScaleFactorEnabledProperty() {
        if (!Control.HasProp("__IControlStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics2.IID)
            Control.__IControlStatics2 := IControlStatics2(factoryPtr)
        }

        return Control.__IControlStatics2.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsFocusEngagementEnabledProperty() {
        if (!Control.HasProp("__IControlStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics4.IID)
            Control.__IControlStatics4 := IControlStatics4(factoryPtr)
        }

        return Control.__IControlStatics4.get_IsFocusEngagementEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsFocusEngagedProperty() {
        if (!Control.HasProp("__IControlStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics4.IID)
            Control.__IControlStatics4 := IControlStatics4(factoryPtr)
        }

        return Control.__IControlStatics4.get_IsFocusEngagedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RequiresPointerProperty() {
        if (!Control.HasProp("__IControlStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics4.IID)
            Control.__IControlStatics4 := IControlStatics4(factoryPtr)
        }

        return Control.__IControlStatics4.get_RequiresPointerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusLeftProperty() {
        if (!Control.HasProp("__IControlStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics4.IID)
            Control.__IControlStatics4 := IControlStatics4(factoryPtr)
        }

        return Control.__IControlStatics4.get_XYFocusLeftProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusRightProperty() {
        if (!Control.HasProp("__IControlStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics4.IID)
            Control.__IControlStatics4 := IControlStatics4(factoryPtr)
        }

        return Control.__IControlStatics4.get_XYFocusRightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusUpProperty() {
        if (!Control.HasProp("__IControlStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics4.IID)
            Control.__IControlStatics4 := IControlStatics4(factoryPtr)
        }

        return Control.__IControlStatics4.get_XYFocusUpProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusDownProperty() {
        if (!Control.HasProp("__IControlStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics4.IID)
            Control.__IControlStatics4 := IControlStatics4(factoryPtr)
        }

        return Control.__IControlStatics4.get_XYFocusDownProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ElementSoundModeProperty() {
        if (!Control.HasProp("__IControlStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics4.IID)
            Control.__IControlStatics4 := IControlStatics4(factoryPtr)
        }

        return Control.__IControlStatics4.get_ElementSoundModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DefaultStyleResourceUriProperty() {
        if (!Control.HasProp("__IControlStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics5.IID)
            Control.__IControlStatics5 := IControlStatics5(factoryPtr)
        }

        return Control.__IControlStatics5.get_DefaultStyleResourceUriProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTemplateKeyTipTargetProperty() {
        if (!Control.HasProp("__IControlStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics5.IID)
            Control.__IControlStatics5 := IControlStatics5(factoryPtr)
        }

        return Control.__IControlStatics5.get_IsTemplateKeyTipTargetProperty()
    }

    /**
     * Gets the value of the [Control.IsTemplateKeyTipTarget](control_istemplatekeytiptarget.md) XAML attached property for the target element.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * 
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the **Control.IsTemplateKeytipTarget** XAML attached property in XAML and won't need this method. For more info, see the [Control.IsTemplateKeyTipTarget](control_istemplatekeytiptarget.md) attached property.
     * @param {DependencyObject} element The object from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.getistemplatekeytiptarget
     */
    static GetIsTemplateKeyTipTarget(element) {
        if (!Control.HasProp("__IControlStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics5.IID)
            Control.__IControlStatics5 := IControlStatics5(factoryPtr)
        }

        return Control.__IControlStatics5.GetIsTemplateKeyTipTarget(element)
    }

    /**
     * Sets the value of the [Control.IsTemplateKeyTipTarget](control_istemplatekeytiptarget.md) XAML attached property for a target element.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * 
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the **Control.IsTemplateFocusTarget** XAML attached property in XAML and won't need this method. For more info, see the [Control.IsTemplateKeyTipTarget](control_istemplatekeytiptarget.md) attached property.
     * @param {DependencyObject} element The object to which the property value is written.
     * @param {Boolean} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.setistemplatekeytiptarget
     */
    static SetIsTemplateKeyTipTarget(element, value) {
        if (!Control.HasProp("__IControlStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics5.IID)
            Control.__IControlStatics5 := IControlStatics5(factoryPtr)
        }

        return Control.__IControlStatics5.SetIsTemplateKeyTipTarget(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_UseSystemFocusVisualsProperty() {
        if (!Control.HasProp("__IControlStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics3.IID)
            Control.__IControlStatics3 := IControlStatics3(factoryPtr)
        }

        return Control.__IControlStatics3.get_UseSystemFocusVisualsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTemplateFocusTargetProperty() {
        if (!Control.HasProp("__IControlStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics3.IID)
            Control.__IControlStatics3 := IControlStatics3(factoryPtr)
        }

        return Control.__IControlStatics3.get_IsTemplateFocusTargetProperty()
    }

    /**
     * Gets the value of the [Control.IsTemplateFocusTarget](control_istemplatefocustarget.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Control.IsTemplateFocusTarget](control_istemplatefocustarget.md) XAML attached property in XAML and won't need this method. For more info, see the [Control.IsTemplateFocusTarget](control_istemplatefocustarget.md) attached property.
     * @param {FrameworkElement} element The object from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.getistemplatefocustarget
     */
    static GetIsTemplateFocusTarget(element) {
        if (!Control.HasProp("__IControlStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics3.IID)
            Control.__IControlStatics3 := IControlStatics3(factoryPtr)
        }

        return Control.__IControlStatics3.GetIsTemplateFocusTarget(element)
    }

    /**
     * Sets the value of the [Control.IsTemplateFocusTarget](control_istemplatefocustarget.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Control.IsTemplateFocusTarget](control_istemplatefocustarget.md) XAML attached property in XAML and won't need this method. For more info, see the [Control.IsTemplateFocusTarget](control_istemplatefocustarget.md) attached property.
     * @param {FrameworkElement} element The object to which the property value is written.
     * @param {Boolean} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.setistemplatefocustarget
     */
    static SetIsTemplateFocusTarget(element, value) {
        if (!Control.HasProp("__IControlStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics3.IID)
            Control.__IControlStatics3 := IControlStatics3(factoryPtr)
        }

        return Control.__IControlStatics3.SetIsTemplateFocusTarget(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackgroundSizingProperty() {
        if (!Control.HasProp("__IControlStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics7.IID)
            Control.__IControlStatics7 := IControlStatics7(factoryPtr)
        }

        return Control.__IControlStatics7.get_BackgroundSizingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CornerRadiusProperty() {
        if (!Control.HasProp("__IControlStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics7.IID)
            Control.__IControlStatics7 := IControlStatics7(factoryPtr)
        }

        return Control.__IControlStatics7.get_CornerRadiusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontSizeProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_FontSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontFamilyProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_FontFamilyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontWeightProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_FontWeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontStyleProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_FontStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontStretchProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_FontStretchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CharacterSpacingProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_CharacterSpacingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ForegroundProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_ForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTabStopProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_IsTabStopProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsEnabledProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_IsEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TabIndexProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_TabIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TabNavigationProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_TabNavigationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TemplateProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_TemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaddingProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_PaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalContentAlignmentProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_HorizontalContentAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalContentAlignmentProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_VerticalContentAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackgroundProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_BackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BorderThicknessProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_BorderThicknessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BorderBrushProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_BorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DefaultStyleKeyProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_DefaultStyleKeyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FocusStateProperty() {
        if (!Control.HasProp("__IControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Control")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlStatics.IID)
            Control.__IControlStatics := IControlStatics(factoryPtr)
        }

        return Control.__IControlStatics.get_FocusStateProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the size of the text in this control.
     * @remarks
     * The unit measure for FontSize is pixels, measuring the line height of the characters in the font. The apparent size of text in the UI can vary based on the current scaling. If you want to use different FontSize values for different scalings, you can do this using the [Resource Management System](/windows/uwp/app-resources/).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.fontsize
     * @type {Float} 
     */
    FontSize {
        get => this.get_FontSize()
        set => this.put_FontSize(value)
    }

    /**
     * Gets or sets the font used to display text in the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.fontfamily
     * @type {FontFamily} 
     */
    FontFamily {
        get => this.get_FontFamily()
        set => this.put_FontFamily(value)
    }

    /**
     * Gets or sets the thickness of the specified font.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.fontweight
     * @type {FontWeight} 
     */
    FontWeight {
        get => this.get_FontWeight()
        set => this.put_FontWeight(value)
    }

    /**
     * Gets or sets the style in which the text is rendered.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.fontstyle
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
        set => this.put_FontStyle(value)
    }

    /**
     * Gets or sets the degree to which a font is condensed or expanded on the screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.fontstretch
     * @type {Integer} 
     */
    FontStretch {
        get => this.get_FontStretch()
        set => this.put_FontStretch(value)
    }

    /**
     * Gets or sets the uniform spacing between characters, in units of 1/1000 of an em.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.characterspacing
     * @type {Integer} 
     */
    CharacterSpacing {
        get => this.get_CharacterSpacing()
        set => this.put_CharacterSpacing(value)
    }

    /**
     * Gets or sets a brush that describes the foreground color.
     * @remarks
     * Each control might apply this property differently based on its visual template. This property only affects a control whose template uses the Foreground property as a parameter. On other controls, this property has no effect. Typically, a [ContentControl](contentcontrol.md) derived control uses a [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) to bind its Foreground value to the [Foreground](contentpresenter_foreground.md) of a [ContentPresenter](contentpresenter.md) within the control template. The same color/brush might also be used for values of other decorative elements in the template (glyphs, icons, control surfaces) or to composite part properties such as the individual [ComboBox](combobox.md) elements of the [TimePicker](timepicker.md) control. For more info about visual templates and control templating, see [Styling controls](/windows/uwp/controls-and-patterns/styling-controls) or the reference page for the [Template](control_template.md) property.
     * 
     * Starting in Windows 10, version 1607 (Windows Software Development Kit (SDK) version 10.0.14393.0), generic.xaml includes resources that you can use to modify the colors of a control in different visual states without modifying the control template. In apps that target this software development kit (SDK) or later, modifying these resources is preferred to setting properties such as [Background](control_background.md), Foreground, and [BorderBrush](control_borderbrush.md). For more info, see the [Light-weight styling](/windows/apps/design/style/xaml-styles#lightweight-styling) section of the [XAML styles](/windows/apps/design/style/xaml-styles) article.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.foreground
     * @type {Brush} 
     */
    Foreground {
        get => this.get_Foreground()
        set => this.put_Foreground(value)
    }

    /**
     * Gets or sets a value that indicates whether a control is included in tab navigation.
     * @remarks
     * Controlling the tab sequence with a combination of IsTabStop and [TabIndex](control_tabindex.md) rather than using the default tab sequence is sometimes necessary in order to tune the keyboard accessibility of your UI. For more info, see [Keyboard accessibility](/windows/uwp/accessibility/keyboard-accessibility).
     * 
     * If IsTabStop is **false**, the control is excluded from tab navigation. In addition, if IsTabStop is **false**, the control cannot receive input focus. (If you try to set focus programmatically, by calling the [Focus](control_focus_195503898.md) method, [Focus](control_focus_195503898.md) returns **false**).
     * 
     * If the reason you don't want the control to be a tab stop is because it's not interactive in your UI, you might want to set [IsEnabled](control_isenabled.md) to **false** to make the lack of interaction more obvious. Many controls have predefined visual states that are invoked for [IsEnabled](control_isenabled.md) =**false**, such as "graying out" text in labels.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.istabstop
     * @type {Boolean} 
     */
    IsTabStop {
        get => this.get_IsTabStop()
        set => this.put_IsTabStop(value)
    }

    /**
     * Gets or sets a value indicating whether the user can interact with the control.
     * @remarks
     * Many controls have predefined visual states that are invoked for IsEnabled =**false**, such as "graying out" text in labels.
     * 
     * Whenever IsEnabled changes, that fires the [IsEnabledChanged](control_isenabledchanged.md) event. Controls might handle this event in order to change the visual states. The event has [DependencyPropertyChangedEventArgs](../windows.ui.xaml/dependencypropertychangedeventargs.md) data, so you can determine the old and new values without having to use your own flags.
     * 
     * A control inherits the IsEnabled property from its parent control. For example, if a control that contains a button has IsEnabled set to **false**, the button's IsEnabled property is also **false**. When the parent's property changes, that fires [IsEnabledChanged](control_isenabledchanged.md) for each control where the value changes because of the value inheriting.
     * 
     * How the control logic behaves when disabled is potentially different for each control. However, these behaviors will result in all controls when IsEnabled =**false**:
     * + The control can't receive keyboard focus or be focused programmatically.
     * + The control does not appear in a tab sequence (any value for [TabIndex](control_tabindex.md) is ignored).
     * + A disabled control is still visible to hit testing. It can't handle any input events on itself. However, a disabled control can still source the input events, and input routed events can bubble to a parent where they can be handled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets a value that indicates the order in which elements receive focus when the user navigates through the app UI using the Tab key.
     * @remarks
     * Initial focus is set to the element with the lowest TabIndex that can receive focus. In a tie, the first element in the visual tree receives focus. Child elements of container controls are ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.tabindex
     * @type {Integer} 
     */
    TabIndex {
        get => this.get_TabIndex()
        set => this.put_TabIndex(value)
    }

    /**
     * Gets or sets a value that modifies how tabbing and [TabIndex](control_tabindex.md) work for this control.
     * 
     * > [!NOTE]
     * > For Windows 10 Creators Update (build 10.0.15063) and newer, the [TabFocusNavigation](../windows.ui.xaml/uielement_tabfocusnavigation.md) property is available on the [UIElement]() base class to include objects in the tab sequence that do not use a [ControlTemplate](../windows.ui.xaml.controls/controltemplate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.tabnavigation
     * @type {Integer} 
     */
    TabNavigation {
        get => this.get_TabNavigation()
        set => this.put_TabNavigation(value)
    }

    /**
     * Gets or sets a control template. The control template defines the visual appearance of a control in UI, and is defined in XAML markup.
     * @remarks
     * The second XAML syntax shown above is a [Setter](../windows.ui.xaml/setter.md) syntax as part of a [Style](../windows.ui.xaml/style.md). This is how a Template value for a [Control](control.md) is defined in almost all cases.
     * 
     * [TargetType](controltemplate_targettype.md) is a required attribute on all [ControlTemplate](controltemplate.md) elements used as a Template value. The value should match the [TargetType](../windows.ui.xaml/style_targettype.md) property for the [Style](../windows.ui.xaml/style.md) that contains the [Setter](../windows.ui.xaml/setter.md) for Template, if you are using a style-setter syntax.
     * 
     * The [ControlTemplate](controltemplate.md) specifies the appearance of a [Control](control.md); if a [Control](control.md) does not have a [ControlTemplate](controltemplate.md), the [Control](control.md) will have no visible presence in your app. The control author defines the default control template, and the app author can re-template the [ControlTemplate](controltemplate.md) XAML to redefine the visual tree of the control.
     * 
     * [Control](control.md) templates are typically set in Extensible Application Markup Language (XAML) as part of a control-specific implicit style. In this case, a [Property](../windows.ui.xaml/setter_property.md) value in the [Setter](../windows.ui.xaml/setter.md) is set as the string "Template", and the [Setter.Value](../windows.ui.xaml/setter_value.md) value is set as a property element, which contains a [ControlTemplate](controltemplate.md) object element. For example, this is the [Style](../windows.ui.xaml/style.md) that defines a Template value for a [ScrollViewer](scrollviewer.md). This is an example of an implicit style, where the [Style](../windows.ui.xaml/style.md) can be in a [ResourceDictionary](../windows.ui.xaml/resourcedictionary.md) but doesn't need an [x:Key attribute](/windows/uwp/xaml-platform/x-key-attribute).
     * 
     * 
     * 
     * ```xaml
     * 
     * <ResourceDictionary>
     *   <Style TargetType="ScrollViewer">
     *   ...
     *     <Setter Property="Template">
     *       <Setter.Value>
     *         <ControlTemplate TargetType="ScrollViewer">
     *           <!--visual root of template for a ScrollViewer-->
     *         </ControlTemplate>
     *       </Setter.Value>
     *     </Setter>
     *   </Style>
     *   ...
     * </ResourceDictionary>
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.template
     * @type {ControlTemplate} 
     */
    Template {
        get => this.get_Template()
        set => this.put_Template(value)
    }

    /**
     * Gets or sets the padding inside a control.
     * @remarks
     * Each control might apply this property differently based on its visual template. This property only affects a control whose template uses the Padding property as a parameter. On other controls, this property has no effect. For more info about control templates, see the [Template](control_template.md) property.
     * 
     * A related property is [Margin](../windows.ui.xaml/frameworkelement_margin.md) (a property of [FrameworkElement](../windows.ui.xaml/frameworkelement.md)). For many controls, margin and padding would typically blend together with the division between them not being apparent in the rendering. For such controls it's typical to specify a [Margin](../windows.ui.xaml/frameworkelement_margin.md) or a [Padding](itemspresenter_padding.md), but not both. For more info about the relationship between margin and padding, see [Alignment, margin, and padding](/windows/uwp/layout/alignment-margin-padding) or [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.padding
     * @type {Thickness} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * Gets or sets the horizontal alignment of the control's content.
     * @remarks
     * Each control might apply this property differently based on the [Style](../windows.ui.xaml/style.md) setters for the control's implicit style, and its visual template. Also, the apparent "default value" of each individual control used in UI can be different.
     * 
     * A value for the HorizontalContentAlignment property only affects layout behavior for a control when its template uses the HorizontalContentAlignment property as the source of a [HorizontalAlignment](../windows.ui.xaml/frameworkelement_horizontalalignment.md) value for presenters or content areas within. On other controls, setting HorizontalContentAlignment has no effect. For more info about visual templates for controls, see the reference for [Control.Template](control_template.md) and [Control templates](/windows/apps/design/style/xaml-control-templates)
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.horizontalcontentalignment
     * @type {Integer} 
     */
    HorizontalContentAlignment {
        get => this.get_HorizontalContentAlignment()
        set => this.put_HorizontalContentAlignment(value)
    }

    /**
     * Gets or sets the vertical alignment of the control's content.
     * @remarks
     * Each control might apply this property differently based on the [Style](../windows.ui.xaml/style.md) setters for the control's implicit style, and its visual template. Also, the apparent "default value" of each individual control used in UI can be different.
     * 
     * A value for the VerticalContentAlignment property only affects layout behavior for a control when its template uses the VerticalContentAlignment property as the source of a [VerticalAlignment](../windows.ui.xaml/frameworkelement_verticalalignment.md) value for presenters or content areas within. On other controls, setting VerticalContentAlignment has no effect. For more info about visual templates for controls, see the reference for [Control.Template](control_template.md) and [Control templates](/windows/apps/design/style/xaml-control-templates).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.verticalcontentalignment
     * @type {Integer} 
     */
    VerticalContentAlignment {
        get => this.get_VerticalContentAlignment()
        set => this.put_VerticalContentAlignment(value)
    }

    /**
     * Gets or sets a brush that provides the background of the control.
     * @remarks
     * Each control might apply this property differently based on its visual template. This property only affects a control whose template uses the Background property as an input for the template's UI properties. On other controls, this property has no effect. Typically, a control uses a [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) to bind its Background value to the [Background](panel_background.md) of a [Panel](panel.md) that is the root element of the control template; for example, to `Grid.Background`. For more info about visual templates and control templating, see [Styling controls](/windows/uwp/controls-and-patterns/styling-controls) or the reference page for the [Template](control_template.md) property.
     * 
     * Starting in Windows 10, version 1607 (Windows Software Development Kit (SDK) version 10.0.14393.0), generic.xaml includes resources that you can use to modify the colors of a control in different visual states without modifying the control template. In apps that target this software development kit (SDK) or later, modifying these resources is preferred to setting properties such as Background, [Foreground](control_foreground.md), and [BorderBrush](control_borderbrush.md). For more info, see the [Light-weight styling](/windows/apps/design/style/xaml-styles#lightweight-styling) section of the [XAML styles](/windows/apps/design/style/xaml-styles) article.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.background
     * @type {Brush} 
     */
    Background {
        get => this.get_Background()
        set => this.put_Background(value)
    }

    /**
     * Gets or sets the border thickness of a control.
     * @remarks
     * Each control might apply this property differently based on its visual template. This property only affects a control whose template uses the BorderThickness property as a parameter. On other controls, this property has no effect. For more info about visual templates, see the [Template](control_template.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.borderthickness
     * @type {Thickness} 
     */
    BorderThickness {
        get => this.get_BorderThickness()
        set => this.put_BorderThickness(value)
    }

    /**
     * Gets or sets a brush that describes the border fill of a control.
     * @remarks
     * Each control might apply this property differently based on its visual template. This property only affects a control whose template uses the BorderBrush property as an input for the template's UI properties. On other controls, this property has no effect. Typically, if it wants to display a border, a control uses a [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) to bind its BorderBrush value to the [BorderBrush](border_borderbrush.md) of a [Border](border.md) that is the root element of the control template. For more info about visual templates and control templating, see [Styling controls](/windows/uwp/controls-and-patterns/styling-controls) or the reference page for the [Template](control_template.md) property.
     * 
     * Starting in Windows 10, version 1607 (Windows Software Development Kit (SDK) version 10.0.14393.0), generic.xaml includes resources that you can use to modify the colors of a control in different visual states without modifying the control template. In apps that target this software development kit (SDK) or later, modifying these resources is preferred to setting properties such as [Background](control_background.md), [Foreground](control_foreground.md), and BorderBrush. For more info, see the [Light-weight styling](/windows/apps/design/style/xaml-styles#lightweight-styling) section of the [XAML styles](/windows/apps/design/style/xaml-styles) article.
     * 
     * The [BorderThickness](control_borderthickness.md) value must be greater than 0 in order to see the BorderBrush value take effect.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.borderbrush
     * @type {Brush} 
     */
    BorderBrush {
        get => this.get_BorderBrush()
        set => this.put_BorderBrush(value)
    }

    /**
     * Gets a value that specifies whether this control has focus, and the mode by which focus was obtained.
     * @remarks
     * This property supports controls that use different visual styles depending on whether the control was focused by the keyboard or by other means. Some controls use visual states that show a visible focus indicator if the control was focused by a keyboard action, but do not show the indicator if the control was focused by a pointer action. The internal logic of such a control implements [OnGotFocus](control_ongotfocus_1398920478.md) and then gets the value of FocusState from the sender. If FocusState is [Keyboard](../windows.ui.xaml/focusstate.md), then a different named visual state that includes a focus rectangle is loaded, by calling [GoToState](../windows.ui.xaml/visualstatemanager_gotostate_443481648.md). Typically, focus-related visual states are grouped together in the default control template XAML. Custom controls that want to use different focus visuals depending on the means of focus can implement this same logic themselves. See [OnGotFocus](control_ongotfocus_1398920478.md).
     * 
     * Another way to use this property is to use [FocusManager](../windows.ui.xaml.input/focusmanager.md) to determine which element in the overall UI has focus, and then call FocusState on that element to get information on how that control received focus.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.focusstate
     * @type {Integer} 
     */
    FocusState {
        get => this.get_FocusState()
    }

    /**
     * Gets or sets whether automatic text enlargement, to reflect the system text size setting, is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.istextscalefactorenabled
     * @type {Boolean} 
     */
    IsTextScaleFactorEnabled {
        get => this.get_IsTextScaleFactorEnabled()
        set => this.put_IsTextScaleFactorEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the control uses focus visuals that are drawn by the system or those defined in the control template.
     * @remarks
     * This property is **false** by default so that a custom [ControlTemplate](controltemplate.md) that defines its own focus visuals works as expected. However, all XAML framework controls set this property to **true** in their [ControlTemplate](controltemplate.md) and use system drawn focus visuals.
     * 
     * To define custom focus visuals for a control, you need to provide a custom [ControlTemplate](controltemplate.md). 
     * In the [ControlTemplate](controltemplate.md), do the following:
     * 
     * + If you're modifying a default [ControlTemplate](controltemplate.md), be sure to set the UseSystemFocusVisuals property to **false** to turn off the system focus visuals. When set to **false**, the focus states in the [VisualStateManager](../windows.ui.xaml/visualstatemanager.md) are called.
     * + Define a [VisualStateGroup](../windows.ui.xaml/visualstategroup.md) for `FocusStates`.
     * + In the `FocusStates` group, define [VisualState](../windows.ui.xaml/visualstate.md)s for `Focused`, `Unfocused`, and `PointerFocused`.
     * + Define the focus visuals.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.usesystemfocusvisuals
     * @type {Boolean} 
     */
    UseSystemFocusVisuals {
        get => this.get_UseSystemFocusVisuals()
        set => this.put_UseSystemFocusVisuals(value)
    }

    /**
     * Get or sets a value that indicates whether focus can be constrained within the control boundaries (for game pad/remote interaction).
     * @remarks
     * Focus engagement makes it easier to use a game pad or remote control to interact with an app. Setting focus engagement does not affect keyboard or other input devices.
     * 
     * When the IsFocusEngagementEnabled property is set to **true**, it marks the control as requiring focus engagement. This means that the user must press the A/Select button to "engage" the control and interact with it. When they are finished, they can press the B/Back button to disengage the control and navigate away from it.
     * 
     * For more info about this property, see the [Focus engagement](/windows/uwp/input-and-devices/designing-for-tv) section of the [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv) article.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.isfocusengagementenabled
     * @type {Boolean} 
     */
    IsFocusEngagementEnabled {
        get => this.get_IsFocusEngagementEnabled()
        set => this.put_IsFocusEngagementEnabled(value)
    }

    /**
     * Get or sets a value that indicates whether focus is constrained within the control boundaries (for game pad/remote interaction).
     * @remarks
     * [IsFocusEngagementEnabled](control_isfocusengagementenabled.md) must be **true** and the control must have focus before you set the IsFocusEngaged property to **true**. Otherwise, a runtime exception will occur.
     * 
     * Focus engagement makes it easier to use a game pad or remote control to interact with an app. Setting focus engagement does not affect keyboard or other input devices.
     * 
     * When the [IsFocusEngagementEnabled](control_isfocusengagementenabled.md) property is set to **true**, it marks the control as requiring focus engagement. This means that the user must press the A/Select button to "engage" the control and interact with it. When they are finished, they can press the B/Back button to disengage the control and navigate away from it.
     * 
     * For more info about this property, see the [Focus engagement](/windows/uwp/input-and-devices/designing-for-tv) section of the [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv) article.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.isfocusengaged
     * @type {Boolean} 
     */
    IsFocusEngaged {
        get => this.get_IsFocusEngaged()
        set => this.put_IsFocusEngaged(value)
    }

    /**
     * Gets or sets whether a UI element supports mouse mode, which emulates pointer interaction experiences with non-pointer input devices such as an game pad or remote control.
     * @remarks
     * For non-pointer input devices, focus is moved between controls through a variety of methods, such as the Tab and arrow keys on a keyboard, the directional pad (D-pad) on a remote, or thumb sticks on a game controller. For some user experiences, such as maps and drawing surfaces, it is not possible or practical to use XY focus navigation. RequiresPointer enables an app to provide a more pointer-like interaction experience through a cursor that can be moved freely using game input devices.
     * 
     * RequiresPointer is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
     * 
     * [RequiresPointerMode](../windows.ui.xaml/application_requirespointermode.md) sets mouse mode at the application level.
     * 
     * For more info, see the [Mouse mode](/windows/uwp/input-and-devices/designing-for-tv) section of [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.requirespointer
     * @type {Integer} 
     */
    RequiresPointer {
        get => this.get_RequiresPointer()
        set => this.put_RequiresPointer(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (D-pad) left.
     * @remarks
     * XYFocusLeft is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
     * 
     * For more info about this property, see the [XY focus navigation and interaction](/windows/uwp/input-and-devices/designing-for-tv) section of the [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv) article.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.xyfocusleft
     * @type {DependencyObject} 
     */
    XYFocusLeft {
        get => this.get_XYFocusLeft()
        set => this.put_XYFocusLeft(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (D-pad) right.
     * @remarks
     * XYFocusRight is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
     * 
     * For more info about this property, see the [XY focus navigation and interaction](/windows/uwp/input-and-devices/designing-for-tv) section of the [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv) article.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.xyfocusright
     * @type {DependencyObject} 
     */
    XYFocusRight {
        get => this.get_XYFocusRight()
        set => this.put_XYFocusRight(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (D-pad) up.
     * @remarks
     * XYFocusUp is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
     * 
     * For more info about this property, see the [XY focus navigation and interaction](/windows/uwp/input-and-devices/designing-for-tv) section of the [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv) article.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.xyfocusup
     * @type {DependencyObject} 
     */
    XYFocusUp {
        get => this.get_XYFocusUp()
        set => this.put_XYFocusUp(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (D-pad) down.
     * @remarks
     * XYFocusDown is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
     * 
     * For more info about this property, see the [XY focus navigation and interaction](/windows/uwp/input-and-devices/designing-for-tv) section of the [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv) article.
     * 
     *  XYFocusDown="{x:Bind commandBar2}"
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.xyfocusdown
     * @type {DependencyObject} 
     */
    XYFocusDown {
        get => this.get_XYFocusDown()
        set => this.put_XYFocusDown(value)
    }

    /**
     * Get or sets a value that specifies a control's preference for whether sounds are played.
     * @remarks
     * Set the ElementSoundMode property to override the global [ElementSoundPlayer](../windows.ui.xaml/elementsoundplayer.md) setting for a specific control.
     * 
     * For more info about using this property, see [Sound in UWP apps](/windows/uwp/style/sound).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.elementsoundmode
     * @type {Integer} 
     */
    ElementSoundMode {
        get => this.get_ElementSoundMode()
        set => this.put_ElementSoundMode(value)
    }

    /**
     * Gets or sets the path to the resource file that contains the default style for the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.defaultstyleresourceuri
     * @type {Uri} 
     */
    DefaultStyleResourceUri {
        get => this.get_DefaultStyleResourceUri()
        set => this.put_DefaultStyleResourceUri(value)
    }

    /**
     * Gets or sets a value that indicates how far the background extends in relation to this element's border.
     * @remarks
     * You can set this property to **OuterBorderEdge** to make the element's background extend under the border. If the border is transparent, the background will show through it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.backgroundsizing
     * @type {Integer} 
     */
    BackgroundSizing {
        get => this.get_BackgroundSizing()
        set => this.put_BackgroundSizing(value)
    }

    /**
     * Gets or sets the radius for the corners of the control's border.
     * @remarks
     * Member components of a [CornerRadius](../windows.ui.xaml/cornerradius.md) value cannot be negative.
     * 
     * CornerRadius property on Control behaves the same way [Border.CornerRadius](border_cornerradius.md) does. CornerRadius is a rendering artifact and does not impact layout of the contents (clipping may occur).
     * 
     * The default CornerRadius value in all control templates is 0. Setting the CornerRadius property impacts those controls that have a Border in their ControlTemplate (Example: Button, ComboBox).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.cornerradius
     * @type {CornerRadius} 
     */
    CornerRadius {
        get => this.get_CornerRadius()
        set => this.put_CornerRadius(value)
    }

    /**
     * Gets or sets the key that references the default style for the control. Authors of custom controls use this property to change the default for the style that their control uses.
     * @remarks
     * DefaultStyleKey is one of the very few protected properties in the Windows Runtime  API. It's intended only for use by control authors, who will be subclassing some existing control class and therefore have the necessary access to set this property. For many custom control scenarios where you'll be setting DefaultStyleKey, you'll also be overriding [OnApplyTemplate](../windows.ui.xaml/frameworkelement_onapplytemplate_1955470198.md).
     * 
     * The return type of DefaultStyleKey is loosely typed as **Object** in the syntax, but the XAML style system will expect the value to provide a type reference:
     * 
     * + For a control that has its logic written in C#, the value of DefaultStyleKey should be an instance of [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). Typically you set this value in the default constructor:
     * 
     * ```csharp
     * public CustomControl1()
     * {
     *     this.DefaultStyleKey = typeof(CustomControl1);
     * }
     * ```
     * 
     * + For a control that has its logic written in Microsoft Visual Basic, the value of DefaultStyleKey should be an instance of [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). Typically you set this value in the default constructor:
     * 
     * ```vb
     * Public Sub New()
     *     Me.DefaultStyleKey = GetType(CustomControl1)
     * End Sub
     * ```
     * 
     * ```cppwinrt
     * CustomControl1::CustomControl1() // public: in the header.
     * {
     * 	DefaultStyleKey(winrt::box_value(L"App1.CustomControl1"));
     * }
     * ```
     * 
     * + For a control that has its logic written in Visual C++ component extensions (C++/CX), the value of DefaultStyleKey should be a namespace-qualified string that is the name of the custom control class. Typically you set this value in the default constructor:
     * 
     * ```cppcx
     * CustomControl1::CustomControl1() //public: in the header
     * {
     *     DefaultStyleKey = "App1.CustomControl1";
     * }
     * ```
     * 
     * > [!NOTE]
     * > Ultimately the string alone isn't enough to support a Visual C++ component extensions (C++/CX) type reference. If you use the **Add / New Item / Templated Control** options in Solution Explorer, the templates and support for Visual C++ component extensions (C++/CX) and XAML generates classes that give [IXamlMetadataProvider](../windows.ui.xaml.markup/ixamlmetadataprovider.md) info. The XAML compiler can access this code when the XAML is loaded, and uses it to validate and create types and members and join the partial classes. As far as what you define in your own app code, the string is all you need. But if you're curious you can have a look at the XamlTypeInfo.g.h and XamlTypeInfo.g.cpp files that are generated.
     * 
     * Control authors could choose to not provide a value for DefaultStyleKey, but that's uncommon. The result would be that the default style is the one as defined by the base class. In some cases (like for [ContentControl](contentcontrol.md)) the value is **null**. Even if you choose to not redefine the value, make sure that the original default style is useful for rendering your control.
     * 
     * When a XAML control is loaded, the rendering process starts, and the system is looking for the correct template to apply, what's being loaded is the XAML default style for the control, including its template. Included in the Windows Runtime is an internal copy of all the default styles for all the XAML controls that the Windows Runtime defines. The type reference in DefaultStyleKey tells the system which named XAML resource to load as this style. In XAML form, the styles really are keyed by type even though there's no mechanism in Windows Runtime XAML that defines a type reference explicitly. But for any [TargetType](../windows.ui.xaml/style_targettype.md) value, which is the attribute that holds the key for lookup, it's implicitly assumed to represent a type reference in the form of a string. For example, DefaultStyleKey from a [Button](button.md) is a [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) instance where the **Name** is "Button", **FullName** is "Windows.UI.Xaml.Controls.Button". The system uses this info to know to load the [Style](../windows.ui.xaml/style.md) from the internal resources that has `TargetType="Button"`.
     * 
     * Custom controls usually aren't in the default XAML namespace. Instead, they're in a XAML namespace that has a **using:** statement to reference the app's code namespace. By default, projects create a prefix "local:" that maps this namespace for you. You could also map other XAML namespaces to refer to additional code namespaces for controls or other code that your app defines.
     * 
     * The "local:" prefix (or some other namespace that maps to your app's code and namespaces) should precede the name of your custom control, when it's in XAML as the [TargetType](../windows.ui.xaml/style_targettype.md) value. This is also already done for you by the starting templates; when you add a new control, you'll see a generic.xaml file that contains just one style. That style will have [TargetType](../windows.ui.xaml/style_targettype.md) value that is a string starting with "local:" and completed by the name you chose for your custom control class. To match previous examples that set DefaultStyleKey in a `CustomControl1` definition, you'd see an element for `<Style TargetType="local:CustomControl1">` defined in the starting generic.xaml, and that style defines the control template as well as setting other properties.
     * 
     * > [!NOTE]
     * > The "local:" prefix is isolated to the XAML where it's defined and used. XAML namespaces and the prefixes only have meaning within XAML and are self-contained to each XAML file. DefaultStyleKey values in code don't include the prefixes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.defaultstylekey
     * @type {IInspectable} 
     */
    DefaultStyleKey {
        get => this.get_DefaultStyleKey()
        set => this.put_DefaultStyleKey(value)
    }

    /**
     * Occurs when the [IsEnabled](control_isenabled.md) property changes.
     * @remarks
     * Whenever [IsEnabled](control_isenabled.md) changes, that fires the IsEnabledChanged event. Controls might handle this event in order to change the visual states. The event has [DependencyPropertyChangedEventArgs](../windows.ui.xaml/dependencypropertychangedeventargs.md) data, so you can determine the old and new values without having to use your own flags.
     * 
     * A control inherits the [IsEnabled](control_isenabled.md) property from its parent control. For example, if a control that contains a button has [IsEnabled](control_isenabled.md) set to **false**, the button's [IsEnabled](control_isenabled.md) property is also **false**. When the parent's property changes, that fires IsEnabledChanged for each control where the value changes because of the value inheriting.
     * @type {DependencyPropertyChangedEventHandler}
    */
    OnIsEnabledChanged {
        get {
            if(!this.HasProp("__OnIsEnabledChanged")){
                this.__OnIsEnabledChanged := WinRTEventHandler(
                    DependencyPropertyChangedEventHandler,
                    DependencyPropertyChangedEventHandler.IID,
                    IInspectable,
                    DependencyPropertyChangedEventArgs
                )
                this.__OnIsEnabledChangedToken := this.add_IsEnabledChanged(this.__OnIsEnabledChanged.iface)
            }
            return this.__OnIsEnabledChanged
        }
    }

    /**
     * Occurs when focus is constrained within the control boundaries (for game pad/remote interaction).
     * @remarks
     * For event data, see [FocusEngagedEventArgs](focusengagedeventargs.md).
     * 
     * Focus engagement makes it easier to use a game pad or remote control to interact with an app. Setting focus engagement does not affect keyboard or other input devices.
     * 
     * When the [IsFocusEngagementEnabled](control_isfocusengagementenabled.md) property is set to **true**, it marks the control as requiring focus engagement. This means that the user must press the A/Select button to "engage" the control and interact with it. When they are finished, they can press the B/Back button to disengage the control and navigate away from it.
     * 
     * For more info about this property, see the [Focus engagement](/windows/uwp/input-and-devices/designing-for-tv) section of the [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv) article.
     * @type {TypedEventHandler<Control, FocusEngagedEventArgs>}
    */
    OnFocusEngaged {
        get {
            if(!this.HasProp("__OnFocusEngaged")){
                this.__OnFocusEngaged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0c3f6433-66b6-5544-8b9b-8904f4055e92}"),
                    Control,
                    FocusEngagedEventArgs
                )
                this.__OnFocusEngagedToken := this.add_FocusEngaged(this.__OnFocusEngaged.iface)
            }
            return this.__OnFocusEngaged
        }
    }

    /**
     * Occurs when focus is released from the control boundaries (for game pad/remote interaction).
     * @remarks
     * For event data, see [FocusDisengagedEventArgs](focusdisengagedeventargs.md).
     * 
     * Focus engagement makes it easier to use a game pad or remote control to interact with an app. Setting focus engagement does not affect keyboard or other input devices.
     * 
     * When the [IsFocusEngagementEnabled](control_isfocusengagementenabled.md) property is set to **true**, it marks the control as requiring focus engagement. This means that the user must press the A/Select button to "engage" the control and interact with it. When they are finished, they can press the B/Back button to disengage the control and navigate away from it.
     * 
     * For more info, see the [Focus engagement](/windows/uwp/input-and-devices/designing-for-tv) section of the [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv) article.
     * @type {TypedEventHandler<Control, FocusDisengagedEventArgs>}
    */
    OnFocusDisengaged {
        get {
            if(!this.HasProp("__OnFocusDisengaged")){
                this.__OnFocusDisengaged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{38b4535c-2785-5122-96fe-d44f795b9cb2}"),
                    Control,
                    FocusDisengagedEventArgs
                )
                this.__OnFocusDisengagedToken := this.add_FocusDisengaged(this.__OnFocusDisengaged.iface)
            }
            return this.__OnFocusDisengaged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnIsEnabledChangedToken")) {
            this.remove_IsEnabledChanged(this.__OnIsEnabledChangedToken)
            this.__OnIsEnabledChanged.iface.Dispose()
        }

        if(this.HasProp("__OnFocusEngagedToken")) {
            this.remove_FocusEngaged(this.__OnFocusEngagedToken)
            this.__OnFocusEngaged.iface.Dispose()
        }

        if(this.HasProp("__OnFocusDisengagedToken")) {
            this.remove_FocusDisengaged(this.__OnFocusDisengagedToken)
            this.__OnFocusDisengaged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FontSize() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_FontSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FontSize(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_FontSize(value)
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_FontFamily() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_FontFamily()
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_FontFamily(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_FontFamily(value)
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FontWeight() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_FontWeight()
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_FontWeight(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_FontWeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStyle() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_FontStyle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStyle(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_FontStyle(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStretch() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_FontStretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStretch(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_FontStretch(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterSpacing() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_CharacterSpacing()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacterSpacing(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_CharacterSpacing(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Foreground() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_Foreground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Foreground(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_Foreground(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTabStop() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_IsTabStop()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTabStop(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_IsTabStop(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TabIndex() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_TabIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TabIndex(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_TabIndex(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TabNavigation() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_TabNavigation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TabNavigation(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_TabNavigation(value)
    }

    /**
     * 
     * @returns {ControlTemplate} 
     */
    get_Template() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_Template()
    }

    /**
     * 
     * @param {ControlTemplate} value 
     * @returns {HRESULT} 
     */
    put_Template(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_Template(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Padding() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_Padding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Padding(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_Padding(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalContentAlignment() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_HorizontalContentAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalContentAlignment(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_HorizontalContentAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalContentAlignment() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_VerticalContentAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalContentAlignment(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_VerticalContentAlignment(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Background() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_Background()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Background(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_Background(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_BorderThickness() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_BorderThickness()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_BorderThickness(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_BorderThickness(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BorderBrush() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_BorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_BorderBrush(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.put_BorderBrush(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FocusState() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.get_FocusState()
    }

    /**
     * 
     * @param {DependencyPropertyChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsEnabledChanged(handler) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.add_IsEnabledChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsEnabledChanged(token) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.remove_IsEnabledChanged(token)
    }

    /**
     * Loads the relevant control template so that its parts can be referenced.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.applytemplate
     */
    ApplyTemplate() {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.ApplyTemplate()
    }

    /**
     * Attempts to set the focus on the control.
     * @remarks
     * If you call this method on a `Control` with an [IsTabStop](control_istabstop.md) set to `false`, the call will be ignored and focus will not move, and the call will return `false`.
     * 
     * You can't remove focus from a control by calling this method with @Windows.UI.Xaml.FocusState.Unfocused as the parameter. This value is not allowed and causes an exception. To remove focus from a control, set focus to a different control.
     * 
     * You typically pass [FocusState.Programmatic](../windows.ui.xaml/focusstate.md) as the parameter to indicate the control obtained focus through a deliberate call to the Focus method. For example, if clicking an "Edit" button causes focus to be set on a [TextBox](textbox.md), use the [Programmatic](../windows.ui.xaml/focusstate.md) focus state.
     * 
     * Pass [FocusState.Pointer](../windows.ui.xaml/focusstate.md) if you’re setting focus as the direct result of a pointer interaction. Pass [FocusState.Keyboard](../windows.ui.xaml/focusstate.md) as the parameter if you’re setting focus as a result of a keyboard interaction, like a tab sequence or key press. For example, if you’re implementing an [ItemsControl](itemscontrol.md) and handle key presses to let the user move focus between items in the control, use the [Keyboard](../windows.ui.xaml/focusstate.md) focus state when you call Focus in your key press handler.
     * @param {Integer} value Specifies how focus was set, as a value of the enumeration.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.focus
     */
    Focus(value) {
        if (!this.HasProp("__IControl")) {
            if ((queryResult := this.QueryInterface(IControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl := IControl(outPtr)
        }

        return this.__IControl.Focus(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextScaleFactorEnabled() {
        if (!this.HasProp("__IControl2")) {
            if ((queryResult := this.QueryInterface(IControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl2 := IControl2(outPtr)
        }

        return this.__IControl2.get_IsTextScaleFactorEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextScaleFactorEnabled(value) {
        if (!this.HasProp("__IControl2")) {
            if ((queryResult := this.QueryInterface(IControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl2 := IControl2(outPtr)
        }

        return this.__IControl2.put_IsTextScaleFactorEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseSystemFocusVisuals() {
        if (!this.HasProp("__IControl3")) {
            if ((queryResult := this.QueryInterface(IControl3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl3 := IControl3(outPtr)
        }

        return this.__IControl3.get_UseSystemFocusVisuals()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseSystemFocusVisuals(value) {
        if (!this.HasProp("__IControl3")) {
            if ((queryResult := this.QueryInterface(IControl3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl3 := IControl3(outPtr)
        }

        return this.__IControl3.put_UseSystemFocusVisuals(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFocusEngagementEnabled() {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.get_IsFocusEngagementEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFocusEngagementEnabled(value) {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.put_IsFocusEngagementEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFocusEngaged() {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.get_IsFocusEngaged()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFocusEngaged(value) {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.put_IsFocusEngaged(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequiresPointer() {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.get_RequiresPointer()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RequiresPointer(value) {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.put_RequiresPointer(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusLeft() {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.get_XYFocusLeft()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusLeft(value) {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.put_XYFocusLeft(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusRight() {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.get_XYFocusRight()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusRight(value) {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.put_XYFocusRight(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusUp() {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.get_XYFocusUp()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusUp(value) {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.put_XYFocusUp(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusDown() {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.get_XYFocusDown()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusDown(value) {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.put_XYFocusDown(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ElementSoundMode() {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.get_ElementSoundMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ElementSoundMode(value) {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.put_ElementSoundMode(value)
    }

    /**
     * 
     * @param {TypedEventHandler<Control, FocusEngagedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusEngaged(handler) {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.add_FocusEngaged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FocusEngaged(token) {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.remove_FocusEngaged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<Control, FocusDisengagedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusDisengaged(handler) {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.add_FocusDisengaged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FocusDisengaged(token) {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.remove_FocusDisengaged(token)
    }

    /**
     * Releases focus from the control boundaries for a control that has focus engagement (for game pad/remote interaction).
     * @remarks
     * Focus engagement makes it easier to use a game pad or remote control to interact with an app. Setting focus engagement does not affect keyboard or other input devices.
     * 
     * When the [IsFocusEngagementEnabled](control_isfocusengagementenabled.md) property is set to **true**, it marks the control as requiring focus engagement. This means that the user must press the A/Select button to "engage" the control and interact with it. When they are finished, they can press the B/Back button to disengage the control and navigate away from it. You can call RemoveFocusEngagement to programmatically disengage a control.
     * 
     * For more info, see the [Focus engagement](/windows/uwp/input-and-devices/designing-for-tv) section of the [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv) article.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.removefocusengagement
     */
    RemoveFocusEngagement() {
        if (!this.HasProp("__IControl4")) {
            if ((queryResult := this.QueryInterface(IControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl4 := IControl4(outPtr)
        }

        return this.__IControl4.RemoveFocusEngagement()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_DefaultStyleResourceUri() {
        if (!this.HasProp("__IControl5")) {
            if ((queryResult := this.QueryInterface(IControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl5 := IControl5(outPtr)
        }

        return this.__IControl5.get_DefaultStyleResourceUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_DefaultStyleResourceUri(value) {
        if (!this.HasProp("__IControl5")) {
            if ((queryResult := this.QueryInterface(IControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl5 := IControl5(outPtr)
        }

        return this.__IControl5.put_DefaultStyleResourceUri(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackgroundSizing() {
        if (!this.HasProp("__IControl7")) {
            if ((queryResult := this.QueryInterface(IControl7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl7 := IControl7(outPtr)
        }

        return this.__IControl7.get_BackgroundSizing()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BackgroundSizing(value) {
        if (!this.HasProp("__IControl7")) {
            if ((queryResult := this.QueryInterface(IControl7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl7 := IControl7(outPtr)
        }

        return this.__IControl7.put_BackgroundSizing(value)
    }

    /**
     * 
     * @returns {CornerRadius} 
     */
    get_CornerRadius() {
        if (!this.HasProp("__IControl7")) {
            if ((queryResult := this.QueryInterface(IControl7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl7 := IControl7(outPtr)
        }

        return this.__IControl7.get_CornerRadius()
    }

    /**
     * 
     * @param {CornerRadius} value 
     * @returns {HRESULT} 
     */
    put_CornerRadius(value) {
        if (!this.HasProp("__IControl7")) {
            if ((queryResult := this.QueryInterface(IControl7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControl7 := IControl7(outPtr)
        }

        return this.__IControl7.put_CornerRadius(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_DefaultStyleKey() {
        if (!this.HasProp("__IControlProtected")) {
            if ((queryResult := this.QueryInterface(IControlProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlProtected := IControlProtected(outPtr)
        }

        return this.__IControlProtected.get_DefaultStyleKey()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_DefaultStyleKey(value) {
        if (!this.HasProp("__IControlProtected")) {
            if ((queryResult := this.QueryInterface(IControlProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlProtected := IControlProtected(outPtr)
        }

        return this.__IControlProtected.put_DefaultStyleKey(value)
    }

    /**
     * Retrieves the named element in the instantiated [ControlTemplate](controltemplate.md) visual tree.
     * @remarks
     * You call GetTemplateChild to get references to objects in a controls [Template](control_template.md) after it's instantiated. The [ControlTemplate](controltemplate.md) is instantiated in the [OnApplyTemplate](../windows.ui.xaml/frameworkelement_onapplytemplate_1955470198.md) method. You can use the GetTemplateChild method inside your [OnApplyTemplate](../windows.ui.xaml/frameworkelement_onapplytemplate_1955470198.md) override and keep a reference to the objects you need.
     * @param {HSTRING} childName The name of the element to find.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.gettemplatechild
     */
    GetTemplateChild(childName) {
        if (!this.HasProp("__IControlProtected")) {
            if ((queryResult := this.QueryInterface(IControlProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlProtected := IControlProtected(outPtr)
        }

        return this.__IControlProtected.GetTemplateChild(childName)
    }

    /**
     * Called before the [PointerEntered](../windows.ui.xaml/uielement_pointerentered.md) event occurs.
     * @remarks
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See WBB 465675-->
     * @param {PointerRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onpointerentered
     */
    OnPointerEntered(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnPointerEntered(e)
    }

    /**
     * Called before the [PointerPressed](../windows.ui.xaml/uielement_pointerpressed.md) event occurs.
     * @remarks
     * As it's implemented directly on [Control](control.md), OnPointerPressed has an empty implementation. But each ancestor in a control's hierarchy may have provided an implementation. You won't be able to see this implementation because it's internal native code. In some cases a control will already have existing **On**_Event_ overrides that mark the event **Handled**. OnPointerPressed happens to be an **On**_Event_ event that several Windows Runtime XAML controls have provided overrides for. For example, [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) has overridden OnPointerPressed to mark the event **Handled**. What all buttons do instead is to then raise the [Click](../windows.ui.xaml.controls.primitives/buttonbase_click.md) event that represents a higher-level event behavior for that control. That means you won't easily be able to handle [UIElement.PointerPressed](../windows.ui.xaml/uielement_pointerpressed.md) on a button, but you probably shouldn't be handling it anyways for most scenarios. Just use [Click](../windows.ui.xaml.controls.primitives/buttonbase_click.md) instead.
     * @param {PointerRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onpointerpressed
     */
    OnPointerPressed(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnPointerPressed(e)
    }

    /**
     * Called before the [PointerMoved](../windows.ui.xaml/uielement_pointermoved.md) event occurs.
     * @param {PointerRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onpointermoved
     */
    OnPointerMoved(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnPointerMoved(e)
    }

    /**
     * Called before the [PointerReleased](../windows.ui.xaml/uielement_pointerreleased.md) event occurs.
     * @param {PointerRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onpointerreleased
     */
    OnPointerReleased(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnPointerReleased(e)
    }

    /**
     * Called before the [PointerExited](../windows.ui.xaml/uielement_pointerexited.md) event occurs.
     * @remarks
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See WBB 465675-->
     * @param {PointerRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onpointerexited
     */
    OnPointerExited(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnPointerExited(e)
    }

    /**
     * Called before the [PointerCaptureLost](../windows.ui.xaml/uielement_pointercapturelost.md) event occurs.
     * @param {PointerRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onpointercapturelost
     */
    OnPointerCaptureLost(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnPointerCaptureLost(e)
    }

    /**
     * Called before the [PointerCanceled](../windows.ui.xaml/uielement_pointercanceled.md) event occurs.
     * @param {PointerRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onpointercanceled
     */
    OnPointerCanceled(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnPointerCanceled(e)
    }

    /**
     * Called before the [PointerWheelChanged](../windows.ui.xaml/uielement_pointerwheelchanged.md) event occurs.
     * @remarks
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See WBB 462116-->
     * @param {PointerRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onpointerwheelchanged
     */
    OnPointerWheelChanged(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnPointerWheelChanged(e)
    }

    /**
     * Called before the [Tapped](../windows.ui.xaml/uielement_tapped.md) event occurs.
     * @remarks
     * This event is not implemented in a [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md).
     * @param {TappedRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.ontapped
     */
    OnTapped(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnTapped(e)
    }

    /**
     * Called before the [DoubleTapped](../windows.ui.xaml/uielement_doubletapped.md) event occurs.
     * @param {DoubleTappedRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.ondoubletapped
     */
    OnDoubleTapped(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnDoubleTapped(e)
    }

    /**
     * Called before the [Holding](../windows.ui.xaml/uielement_holding.md) event occurs.
     * @param {HoldingRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onholding
     */
    OnHolding(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnHolding(e)
    }

    /**
     * Called before the [RightTapped](../windows.ui.xaml/uielement_righttapped.md) event occurs.
     * @remarks
     * This event is not implemented in a [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md).
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See WBB 458128-->
     * @param {RightTappedRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onrighttapped
     */
    OnRightTapped(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnRightTapped(e)
    }

    /**
     * Called before the [ManipulationStarting](../windows.ui.xaml/uielement_manipulationstarting.md) event occurs.
     * @remarks
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See WBB 458026-->
     * @param {ManipulationStartingRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onmanipulationstarting
     */
    OnManipulationStarting(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnManipulationStarting(e)
    }

    /**
     * Called before the [ManipulationInertiaStarting](../windows.ui.xaml/uielement_manipulationinertiastarting.md) event occurs.
     * @remarks
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See WBB 467590-->
     * @param {ManipulationInertiaStartingRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onmanipulationinertiastarting
     */
    OnManipulationInertiaStarting(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnManipulationInertiaStarting(e)
    }

    /**
     * Called before the [ManipulationStarted](../windows.ui.xaml/uielement_manipulationstarted.md) event occurs.
     * @param {ManipulationStartedRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onmanipulationstarted
     */
    OnManipulationStarted(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnManipulationStarted(e)
    }

    /**
     * Called before the [ManipulationDelta](../windows.ui.xaml/uielement_manipulationdelta.md) event occurs.
     * @param {ManipulationDeltaRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onmanipulationdelta
     */
    OnManipulationDelta(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnManipulationDelta(e)
    }

    /**
     * Called before the [ManipulationCompleted](../windows.ui.xaml/uielement_manipulationcompleted.md) event occurs.
     * @remarks
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See WBB 467590-->
     * @param {ManipulationCompletedRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onmanipulationcompleted
     */
    OnManipulationCompleted(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnManipulationCompleted(e)
    }

    /**
     * Called before the [KeyUp](../windows.ui.xaml/uielement_keyup.md) event occurs.
     * @remarks
     * As it's implemented directly on [Control](control.md), OnKeyUp has an empty implementation. But each ancestor in a control's hierarchy may have provided an implementation. You won't be able to see this implementation because it's internal native code. In some cases a control will already have existing **On**_Event_ overrides that mark the event **Handled**. For key events, controls are usually only handling for certain keys, by checking values in [KeyRoutedEventArgs](../windows.ui.xaml.input/keyroutedeventargs.md). For example, [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) detects the Space key as a way to fire [Click](../windows.ui.xaml.controls.primitives/buttonbase_click.md). Control code or your code probably shouldn't be suppressing all key events, because it's a common pattern to let key events bubble to the root visual so that they can be shortcuts or accelerators for app interaction. For more info see [Keyboard interactions](/windows/uwp/input-and-devices/keyboard-interactions).
     * @param {KeyRoutedEventArgs} e The data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onkeyup
     */
    OnKeyUp(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnKeyUp(e)
    }

    /**
     * Called before the [KeyDown](../windows.ui.xaml/uielement_keydown.md) event occurs.
     * @remarks
     * As it's implemented directly on [Control](control.md), OnKeyDown has an empty implementation. But each ancestor in a control's hierarchy may have provided an implementation. You won't be able to see this implementation because it's internal native code. In some cases a control will already have existing **On**_Event_ overrides that mark the event **Handled**. For key events, controls are usually only handling for certain keys, by checking values in [KeyRoutedEventArgs](../windows.ui.xaml.input/keyroutedeventargs.md). For example, [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) detects the Space key as a way to fire [Click](../windows.ui.xaml.controls.primitives/buttonbase_click.md). Control code or your code probably shouldn't be suppressing all key events, because it's a common pattern to let key events bubble to the root visual so that they can be shortcuts or accelerators for app interaction. For more info see [Keyboard interactions](/windows/uwp/input-and-devices/keyboard-interactions).
     * @param {KeyRoutedEventArgs} e The data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onkeydown
     */
    OnKeyDown(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnKeyDown(e)
    }

    /**
     * Called before the [GotFocus](../windows.ui.xaml/uielement_gotfocus.md) event occurs.
     * @param {RoutedEventArgs} e The data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.ongotfocus
     */
    OnGotFocus(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnGotFocus(e)
    }

    /**
     * Called before the [LostFocus](../windows.ui.xaml/uielement_lostfocus.md) event occurs.
     * @param {RoutedEventArgs} e The data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onlostfocus
     */
    OnLostFocus(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnLostFocus(e)
    }

    /**
     * Called before the [DragEnter](../windows.ui.xaml/uielement_dragenter.md) event occurs.
     * @param {DragEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.ondragenter
     */
    OnDragEnter(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnDragEnter(e)
    }

    /**
     * Called before the [DragLeave](../windows.ui.xaml/uielement_dragleave.md) event occurs.
     * @param {DragEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.ondragleave
     */
    OnDragLeave(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnDragLeave(e)
    }

    /**
     * Called before the [DragOver](../windows.ui.xaml/uielement_dragover.md) event occurs.
     * @param {DragEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.ondragover
     */
    OnDragOver(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnDragOver(e)
    }

    /**
     * Called before the [Drop](../windows.ui.xaml/uielement_drop.md) event occurs.
     * @param {DragEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.ondrop
     */
    OnDrop(e) {
        if (!this.HasProp("__IControlOverrides")) {
            if ((queryResult := this.QueryInterface(IControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides := IControlOverrides(outPtr)
        }

        return this.__IControlOverrides.OnDrop(e)
    }

    /**
     * Called before the [PreviewKeyDown](../windows.ui.xaml/uielement_previewkeydown.md) event occurs.
     * @param {KeyRoutedEventArgs} e The data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onpreviewkeydown
     */
    OnPreviewKeyDown(e) {
        if (!this.HasProp("__IControlOverrides6")) {
            if ((queryResult := this.QueryInterface(IControlOverrides6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides6 := IControlOverrides6(outPtr)
        }

        return this.__IControlOverrides6.OnPreviewKeyDown(e)
    }

    /**
     * Called before the [PreviewKeyUp](../windows.ui.xaml/uielement_previewkeyup.md) event occurs.
     * @param {KeyRoutedEventArgs} e The data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.onpreviewkeyup
     */
    OnPreviewKeyUp(e) {
        if (!this.HasProp("__IControlOverrides6")) {
            if ((queryResult := this.QueryInterface(IControlOverrides6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides6 := IControlOverrides6(outPtr)
        }

        return this.__IControlOverrides6.OnPreviewKeyUp(e)
    }

    /**
     * Called before the [CharacterReceived](../windows.ui.xaml/uielement_characterreceived.md) event occurs.
     * @param {CharacterReceivedRoutedEventArgs} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.control.oncharacterreceived
     */
    OnCharacterReceived(e) {
        if (!this.HasProp("__IControlOverrides6")) {
            if ((queryResult := this.QueryInterface(IControlOverrides6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlOverrides6 := IControlOverrides6(outPtr)
        }

        return this.__IControlOverrides6.OnCharacterReceived(e)
    }

;@endregion Instance Methods
}
