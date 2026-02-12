#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAutomationProperties.ahk
#Include .\IAutomationPropertiesStatics2.ahk
#Include .\IAutomationPropertiesStatics3.ahk
#Include .\IAutomationPropertiesStatics.ahk
#Include .\IAutomationPropertiesStatics8.ahk
#Include .\IAutomationPropertiesStatics9.ahk
#Include .\IAutomationPropertiesStatics4.ahk
#Include .\IAutomationPropertiesStatics6.ahk
#Include .\IAutomationPropertiesStatics7.ahk
#Include .\IAutomationPropertiesStatics5.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides support for getting or setting instance-level values of automation properties. These property values are set as attached properties (typically in XAML) and supplement or override automation property values from a control's [AutomationPeer](../windows.ui.xaml.automation.peers/automationpeer.md).
 * @remarks
 * AutomationProperties is the host service class for several [XAML attached properties](/windows/uwp/xaml-platform/attached-properties-overview). The purpose of these attached properties is to enable setting various per-instance values that are pertinent to how a UI element is reported to the Microsoft UI Automation accessibility framework. This is useful in cases where the class design of the UI element doesn't already forward other UI-related property values as part of its Microsoft UI Automation integration or peer implementation behavior, or where the value being forwarded is not the value you want to report to Microsoft UI Automation.
 * 
 * In order to support XAML processor access to the attached properties, and also to expose equivalent get and set operations to code, each XAML attached property has a pair of **Get** and **Set** accessor methods, which are also members of AutomationProperties. For example, the [GetName](automationproperties_getname_865133976.md) and [SetName](automationproperties_setname_2137845140.md) methods support and provide the equivalent code-only support for reporting automation **Name** values to Microsoft UI Automation, instead of using the Name attached property to set it in XAML. Alternatively, you can use the dependency property system to get or set the value of the attached property, and this also reports the underlying value to Microsoft UI Automation. Call [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md), passing the arguments of the dependency property identifier to set, and a reference to the target object on which to get or set the value.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AutomationProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutomationProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutomationProperties.IID

    /**
     * Identifies the [AutomationProperties.AccessibilityView](automationproperties_accessibilityview.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.accessibilityviewproperty
     * @type {DependencyProperty} 
     */
    static AccessibilityViewProperty {
        get => AutomationProperties.get_AccessibilityViewProperty()
    }

    /**
     * Identifies the [AutomationProperties.ControlledPeers](automationproperties_controlledpeers.md) attached property.
     * @remarks
     * > [!NOTE]
     * 
     * `ControlledPeers` is used when an automation element affects one or more segments of either the application UI or the desktop. This makes it easier to associate the impact of the control operation on other UI elements.
     * 
     * > `AutomationProperties.ControlledPeers` is an atypical attached property because it does not have a `Set` accessor, and thus is not really a XAML attached property with a markup usage. It uses the attached property model as a property store, but does not support an Extensible Application Markup Language (XAML) usage. To get the collection of elements, call [GetControlledPeers](automationproperties_getcontrolledpeers_853183966.md), passing the item as the input parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.controlledpeersproperty
     * @type {DependencyProperty} 
     */
    static ControlledPeersProperty {
        get => AutomationProperties.get_ControlledPeersProperty()
    }

    /**
     * Identifies the [AutomationProperties.PositionInSet](automationproperties_positioninset.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.positioninsetproperty
     * @type {DependencyProperty} 
     */
    static PositionInSetProperty {
        get => AutomationProperties.get_PositionInSetProperty()
    }

    /**
     * Identifies the [AutomationProperties.SizeOfSet](automationproperties_sizeofset.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.sizeofsetproperty
     * @type {DependencyProperty} 
     */
    static SizeOfSetProperty {
        get => AutomationProperties.get_SizeOfSetProperty()
    }

    /**
     * Identifies the [AutomationProperties.Level](automationproperties_level.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.levelproperty
     * @type {DependencyProperty} 
     */
    static LevelProperty {
        get => AutomationProperties.get_LevelProperty()
    }

    /**
     * Identifies the [AutomationProperties.Annotations](automationproperties_annotations.md) attached property.
     * @remarks
     * > [!NOTE]
     * > [AutomationProperties.Annotations](automationproperties_annotations.md) is an atypical attached property because it does not have a `Set` accessor, and thus is not really a XAML attached property with a markup usage. It uses the attached property model as a property store, but does not support an Extensible Application Markup Language (XAML) usage. To get the list of annotations, call [GetAnnotations](automationproperties_getannotations_1232704323.md), passing the item as the input parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.annotationsproperty
     * @type {DependencyProperty} 
     */
    static AnnotationsProperty {
        get => AutomationProperties.get_AnnotationsProperty()
    }

    /**
     * Identifies the [AutomationProperties.AcceleratorKey](automationproperties_acceleratorkey.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.acceleratorkeyproperty
     * @type {DependencyProperty} 
     */
    static AcceleratorKeyProperty {
        get => AutomationProperties.get_AcceleratorKeyProperty()
    }

    /**
     * Identifies the [AutomationProperties.AccessKey](automationproperties_accesskey.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.accesskeyproperty
     * @type {DependencyProperty} 
     */
    static AccessKeyProperty {
        get => AutomationProperties.get_AccessKeyProperty()
    }

    /**
     * Identifies the [AutomationProperties.AutomationId](automationproperties_automationid.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.automationidproperty
     * @type {DependencyProperty} 
     */
    static AutomationIdProperty {
        get => AutomationProperties.get_AutomationIdProperty()
    }

    /**
     * Identifies the [AutomationProperties.HelpText](automationproperties_helptext.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.helptextproperty
     * @type {DependencyProperty} 
     */
    static HelpTextProperty {
        get => AutomationProperties.get_HelpTextProperty()
    }

    /**
     * Identifies the [AutomationProperties.IsRequiredForForm](automationproperties_isrequiredforform.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.isrequiredforformproperty
     * @type {DependencyProperty} 
     */
    static IsRequiredForFormProperty {
        get => AutomationProperties.get_IsRequiredForFormProperty()
    }

    /**
     * Identifies the [AutomationProperties.ItemStatus](automationproperties_itemstatus.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.itemstatusproperty
     * @type {DependencyProperty} 
     */
    static ItemStatusProperty {
        get => AutomationProperties.get_ItemStatusProperty()
    }

    /**
     * Identifies the [AutomationProperties.ItemType](automationproperties_itemtype.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.itemtypeproperty
     * @type {DependencyProperty} 
     */
    static ItemTypeProperty {
        get => AutomationProperties.get_ItemTypeProperty()
    }

    /**
     * Identifies the [AutomationProperties.LabeledBy](automationproperties_labeledby.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.labeledbyproperty
     * @type {DependencyProperty} 
     */
    static LabeledByProperty {
        get => AutomationProperties.get_LabeledByProperty()
    }

    /**
     * Identifies the [AutomationProperties.Name](automationproperties_name.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.nameproperty
     * @type {DependencyProperty} 
     */
    static NameProperty {
        get => AutomationProperties.get_NameProperty()
    }

    /**
     * Identifies the [AutomationProperties.LiveSetting](automationproperties_livesetting.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.livesettingproperty
     * @type {DependencyProperty} 
     */
    static LiveSettingProperty {
        get => AutomationProperties.get_LiveSettingProperty()
    }

    /**
     * Identifies the [AutomationProperties.IsDialog](automationproperties_isdialog.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.isdialogproperty
     * @type {DependencyProperty} 
     */
    static IsDialogProperty {
        get => AutomationProperties.get_IsDialogProperty()
    }

    /**
     * Identifies the [AutomationProperties.AutomationControlType](automationproperties_automationcontroltype.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.automationcontroltypeproperty
     * @type {DependencyProperty} 
     */
    static AutomationControlTypeProperty {
        get => AutomationProperties.get_AutomationControlTypeProperty()
    }

    /**
     * Identifies the [AutomationProperties.LandmarkType](automationproperties_landmarktype.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.landmarktypeproperty
     * @type {DependencyProperty} 
     */
    static LandmarkTypeProperty {
        get => AutomationProperties.get_LandmarkTypeProperty()
    }

    /**
     * Identifies the [AutomationProperties.LocalizedLandmarkType](automationproperties_localizedlandmarktype.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.localizedlandmarktypeproperty
     * @type {DependencyProperty} 
     */
    static LocalizedLandmarkTypeProperty {
        get => AutomationProperties.get_LocalizedLandmarkTypeProperty()
    }

    /**
     * Identifies the [AutomationProperties.Culture](automationproperties_culture.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.cultureproperty
     * @type {DependencyProperty} 
     */
    static CultureProperty {
        get => AutomationProperties.get_CultureProperty()
    }

    /**
     * Identifies the [HeadingLevel](automationproperties_headinglevel.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.headinglevelproperty
     * @type {DependencyProperty} 
     */
    static HeadingLevelProperty {
        get => AutomationProperties.get_HeadingLevelProperty()
    }

    /**
     * Identifies [AutomationProperties.IsPeripheral](automationproperties_isperipheral.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.isperipheralproperty
     * @type {DependencyProperty} 
     */
    static IsPeripheralProperty {
        get => AutomationProperties.get_IsPeripheralProperty()
    }

    /**
     * Identifies the [AutomationProperties.IsDataValidForForm](automationproperties_isdatavalidforform.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.isdatavalidforformproperty
     * @type {DependencyProperty} 
     */
    static IsDataValidForFormProperty {
        get => AutomationProperties.get_IsDataValidForFormProperty()
    }

    /**
     * Identifies the [AutomationProperties.FullDescription](automationproperties_fulldescription.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.fulldescriptionproperty
     * @type {DependencyProperty} 
     */
    static FullDescriptionProperty {
        get => AutomationProperties.get_FullDescriptionProperty()
    }

    /**
     * Identifies the [AutomationProperties.LocalizedControlType](automationproperties_localizedcontroltype.md) XAML attached property, which is a text string describing the type of control that the automation element represents.
     * @remarks
     * The string should contain only lowercase characters:
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.localizedcontroltypeproperty
     * @type {DependencyProperty} 
     */
    static LocalizedControlTypeProperty {
        get => AutomationProperties.get_LocalizedControlTypeProperty()
    }

    /**
     * Identifies the [AutomationProperties.DescribedBy](automationproperties_describedby.md) attached property.
     * @remarks
     * > [!NOTE]
     * > `AutomationProperties.DescribedBy` is an atypical attached property because it does not have a `Set` accessor, and thus is not really a XAML attached property with a markup usage. It uses the attached property model as a property store, but does not support an Extensible Application Markup Language (XAML) usage. To get the array of elements, call [GetDescribedBy](automationproperties_getdescribedby_903862056.md), passing the item as the input parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.describedbyproperty
     * @type {DependencyProperty} 
     */
    static DescribedByProperty {
        get => AutomationProperties.get_DescribedByProperty()
    }

    /**
     * Identifies the [FlowsTo](automationproperties_flowsto.md) attached property.
     * @remarks
     * > [!NOTE]
     * > `AutomationProperties.FlowsTo` is an atypical attached property because it does not have a `Set` accessor, and thus is not really a XAML attached property with a markup usage. It uses the attached property model as a property store, but does not support an Extensible Application Markup Language (XAML) usage. To get the array of elements, call [GetFlowsTo](automationproperties_getflowsto_483856830.md), passing the item as the input parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.flowstoproperty
     * @type {DependencyProperty} 
     */
    static FlowsToProperty {
        get => AutomationProperties.get_FlowsToProperty()
    }

    /**
     * Identifies the [FlowsFrom](automationproperties_flowsfrom.md) attached property.
     * @remarks
     * > [!NOTE]
     * > `AutomationProperties.FlowsFrom` is an atypical attached property because it does not have a `Set` accessor, and thus is not really a XAML attached property with a markup usage. It uses the attached property model as a property store, but does not support an Extensible Application Markup Language (XAML) usage. To get the array of elements, call [GetFlowsFrom](automationproperties_getflowsfrom_1915156123.md), passing the item as the input parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.flowsfromproperty
     * @type {DependencyProperty} 
     */
    static FlowsFromProperty {
        get => AutomationProperties.get_FlowsFromProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AccessibilityViewProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics2.IID)
            AutomationProperties.__IAutomationPropertiesStatics2 := IAutomationPropertiesStatics2(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics2.get_AccessibilityViewProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.AccessibilityView](automationproperties_accessibilityview.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getaccessibilityview
     */
    static GetAccessibilityView(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics2.IID)
            AutomationProperties.__IAutomationPropertiesStatics2 := IAutomationPropertiesStatics2(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics2.GetAccessibilityView(element)
    }

    /**
     * Sets the value of the [AutomationProperties.AccessibilityView](automationproperties_accessibilityview.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to set the attached property on.
     * @param {Integer} value The enumeration value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setaccessibilityview
     */
    static SetAccessibilityView(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics2.IID)
            AutomationProperties.__IAutomationPropertiesStatics2 := IAutomationPropertiesStatics2(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics2.SetAccessibilityView(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ControlledPeersProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics2.IID)
            AutomationProperties.__IAutomationPropertiesStatics2 := IAutomationPropertiesStatics2(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics2.get_ControlledPeersProperty()
    }

    /**
     * A static utility method that retrieves the list of controlled peers from a target owner.
     * @remarks
     * Examining controlled peers is an advanced scenario that most peer implementations won't need to use.
     * 
     * This identifier is commonly used for [Auto-suggest accessibility](/windows/uwp/design/accessibility/accessible-text-requirements#auto-suggest-accessibility).
     * @param {DependencyObject} element The owner object to retrieve controlled peers from.
     * @returns {IVector<UIElement>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getcontrolledpeers
     */
    static GetControlledPeers(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics2.IID)
            AutomationProperties.__IAutomationPropertiesStatics2 := IAutomationPropertiesStatics2(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics2.GetControlledPeers(element)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PositionInSetProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics3.IID)
            AutomationProperties.__IAutomationPropertiesStatics3 := IAutomationPropertiesStatics3(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics3.get_PositionInSetProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.PositionInSet](automationproperties_positioninset.md) property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getpositioninset
     */
    static GetPositionInSet(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics3.IID)
            AutomationProperties.__IAutomationPropertiesStatics3 := IAutomationPropertiesStatics3(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics3.GetPositionInSet(element)
    }

    /**
     * Sets the value of the [AutomationProperties.PositionInSet](automationproperties_positioninset.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) for which to set the property.
     * @param {Integer} value The value of the property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setpositioninset
     */
    static SetPositionInSet(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics3.IID)
            AutomationProperties.__IAutomationPropertiesStatics3 := IAutomationPropertiesStatics3(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics3.SetPositionInSet(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SizeOfSetProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics3.IID)
            AutomationProperties.__IAutomationPropertiesStatics3 := IAutomationPropertiesStatics3(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics3.get_SizeOfSetProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.SizeOfSet](automationproperties_sizeofset.md) property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getsizeofset
     */
    static GetSizeOfSet(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics3.IID)
            AutomationProperties.__IAutomationPropertiesStatics3 := IAutomationPropertiesStatics3(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics3.GetSizeOfSet(element)
    }

    /**
     * Sets the value of the [AutomationProperties.SizeOfSet](automationproperties_sizeofset.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) for which to set the property.
     * @param {Integer} value The value of the property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setsizeofset
     */
    static SetSizeOfSet(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics3.IID)
            AutomationProperties.__IAutomationPropertiesStatics3 := IAutomationPropertiesStatics3(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics3.SetSizeOfSet(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LevelProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics3.IID)
            AutomationProperties.__IAutomationPropertiesStatics3 := IAutomationPropertiesStatics3(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics3.get_LevelProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.Level](automationproperties_level.md) property for the specified element.
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getlevel
     */
    static GetLevel(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics3.IID)
            AutomationProperties.__IAutomationPropertiesStatics3 := IAutomationPropertiesStatics3(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics3.GetLevel(element)
    }

    /**
     * Sets the value of the [AutomationProperties.Level](automationproperties_level.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) for which to set the property.
     * @param {Integer} value The value of the property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setlevel
     */
    static SetLevel(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics3.IID)
            AutomationProperties.__IAutomationPropertiesStatics3 := IAutomationPropertiesStatics3(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics3.SetLevel(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AnnotationsProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics3.IID)
            AutomationProperties.__IAutomationPropertiesStatics3 := IAutomationPropertiesStatics3(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics3.get_AnnotationsProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.Annotations](automationproperties_annotationsproperty.md) property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {IVector<AutomationAnnotation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getannotations
     */
    static GetAnnotations(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics3.IID)
            AutomationProperties.__IAutomationPropertiesStatics3 := IAutomationPropertiesStatics3(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics3.GetAnnotations(element)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AcceleratorKeyProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.get_AcceleratorKeyProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.AcceleratorKey](automationproperties_acceleratorkey.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getacceleratorkey
     */
    static GetAcceleratorKey(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.GetAcceleratorKey(element)
    }

    /**
     * Sets the value of the [AutomationProperties.AcceleratorKey](automationproperties_acceleratorkey.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) for which to set the property.
     * @param {HSTRING} value The accelerator key value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setacceleratorkey
     */
    static SetAcceleratorKey(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.SetAcceleratorKey(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AccessKeyProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.get_AccessKeyProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.AccessKey](automationproperties_accesskey.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getaccesskey
     */
    static GetAccessKey(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.GetAccessKey(element)
    }

    /**
     * Sets the value of the [AutomationProperties.AccessKey](automationproperties_accesskey.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) for which to set the property.
     * @param {HSTRING} value The access key value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setaccesskey
     */
    static SetAccessKey(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.SetAccessKey(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AutomationIdProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.get_AutomationIdProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.AutomationId](automationproperties_automationid.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getautomationid
     */
    static GetAutomationId(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.GetAutomationId(element)
    }

    /**
     * Sets the value of the [AutomationProperties.AutomationId](automationproperties_automationid.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) for which to set the property.
     * @param {HSTRING} value The UI Automation identifier value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setautomationid
     */
    static SetAutomationId(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.SetAutomationId(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HelpTextProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.get_HelpTextProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.HelpText](automationproperties_helptext.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.gethelptext
     */
    static GetHelpText(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.GetHelpText(element)
    }

    /**
     * Sets the value of the [AutomationProperties.HelpText](automationproperties_helptext.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) for which to set the property.
     * @param {HSTRING} value The help text.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.sethelptext
     */
    static SetHelpText(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.SetHelpText(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsRequiredForFormProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.get_IsRequiredForFormProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.IsRequiredForForm](automationproperties_isrequiredforform.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getisrequiredforform
     */
    static GetIsRequiredForForm(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.GetIsRequiredForForm(element)
    }

    /**
     * Sets the value of the [AutomationProperties.IsRequiredForForm](automationproperties_isrequiredforform.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) for which to set the property.
     * @param {Boolean} value **true** to specify that the element is required to be filled out on a form; otherwise, **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setisrequiredforform
     */
    static SetIsRequiredForForm(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.SetIsRequiredForForm(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemStatusProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.get_ItemStatusProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.ItemStatus](automationproperties_itemstatus.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getitemstatus
     */
    static GetItemStatus(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.GetItemStatus(element)
    }

    /**
     * Sets the value of the [AutomationProperties.ItemStatus](automationproperties_itemstatus.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) for which to set the property.
     * @param {HSTRING} value The item status.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setitemstatus
     */
    static SetItemStatus(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.SetItemStatus(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemTypeProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.get_ItemTypeProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.ItemType](automationproperties_itemtype.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getitemtype
     */
    static GetItemType(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.GetItemType(element)
    }

    /**
     * Sets the value of the [AutomationProperties.ItemType](automationproperties_itemtype.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) for which to set the property.
     * @param {HSTRING} value The item type.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setitemtype
     */
    static SetItemType(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.SetItemType(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LabeledByProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.get_LabeledByProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.LabeledBy](automationproperties_labeledby.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {UIElement} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getlabeledby
     */
    static GetLabeledBy(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.GetLabeledBy(element)
    }

    /**
     * Sets the value of the [AutomationProperties.LabeledBy](automationproperties_labeledby.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) for which to set the property.
     * @param {UIElement} value The UI element that represents the label for *element*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setlabeledby
     */
    static SetLabeledBy(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.SetLabeledBy(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_NameProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.get_NameProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.Name](automationproperties_name.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getname
     */
    static GetName(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.GetName(element)
    }

    /**
     * Sets the value of the [AutomationProperties.Name](automationproperties_name.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) for which to set the property.
     * @param {HSTRING} value The object name.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setname
     */
    static SetName(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.SetName(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LiveSettingProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.get_LiveSettingProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.LiveSetting](automationproperties_livesetting.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getlivesetting
     */
    static GetLiveSetting(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.GetLiveSetting(element)
    }

    /**
     * Sets the value of the [AutomationProperties.LiveSetting](automationproperties_livesetting.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) for which to set the property.
     * @param {Integer} value The [AutomationLiveSetting](../windows.ui.xaml.automation.peers/automationlivesetting.md) value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setlivesetting
     */
    static SetLiveSetting(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics.IID)
            AutomationProperties.__IAutomationPropertiesStatics := IAutomationPropertiesStatics(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics.SetLiveSetting(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsDialogProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics8.IID)
            AutomationProperties.__IAutomationPropertiesStatics8 := IAutomationPropertiesStatics8(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics8.get_IsDialogProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.IsDialog](automationproperties_isdialog.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The object to check.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getisdialog
     */
    static GetIsDialog(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics8.IID)
            AutomationProperties.__IAutomationPropertiesStatics8 := IAutomationPropertiesStatics8(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics8.GetIsDialog(element)
    }

    /**
     * Sets a Boolean value that indicates whether the specified element should be identified as a dialog window.
     * @remarks
     * [Flyout](../windows.ui.xaml.controls/flyout.md) and [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) elements default to **true** for [AutomationProperties.IsDialog](automationproperties_isdialog.md).
     * @param {DependencyObject} element The object to identify as a dialog window.
     * @param {Boolean} value **true** if the element should be identified as a dialog window; otherwise, **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setisdialog
     */
    static SetIsDialog(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics8.IID)
            AutomationProperties.__IAutomationPropertiesStatics8 := IAutomationPropertiesStatics8(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics8.SetIsDialog(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AutomationControlTypeProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics9")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics9.IID)
            AutomationProperties.__IAutomationPropertiesStatics9 := IAutomationPropertiesStatics9(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics9.get_AutomationControlTypeProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.AutomationControlType](automationproperties_automationcontroltype.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {UIElement} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getautomationcontroltype
     */
    static GetAutomationControlType(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics9")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics9.IID)
            AutomationProperties.__IAutomationPropertiesStatics9 := IAutomationPropertiesStatics9(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics9.GetAutomationControlType(element)
    }

    /**
     * Sets the value of the [AutomationProperties.AutomationControlType](automationproperties_automationcontroltype.md) attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {UIElement} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) for which to set the property.
     * @param {Integer} value The UI Automation control type to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setautomationcontroltype
     */
    static SetAutomationControlType(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics9")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics9.IID)
            AutomationProperties.__IAutomationPropertiesStatics9 := IAutomationPropertiesStatics9(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics9.SetAutomationControlType(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LandmarkTypeProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics4.IID)
            AutomationProperties.__IAutomationPropertiesStatics4 := IAutomationPropertiesStatics4(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics4.get_LandmarkTypeProperty()
    }

    /**
     * Gets the value of the landmark type attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getlandmarktype
     */
    static GetLandmarkType(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics4.IID)
            AutomationProperties.__IAutomationPropertiesStatics4 := IAutomationPropertiesStatics4(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics4.GetLandmarkType(element)
    }

    /**
     * Sets the value of the landmark type attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {Integer} value The value of the landmark type property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setlandmarktype
     */
    static SetLandmarkType(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics4.IID)
            AutomationProperties.__IAutomationPropertiesStatics4 := IAutomationPropertiesStatics4(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics4.SetLandmarkType(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LocalizedLandmarkTypeProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics4.IID)
            AutomationProperties.__IAutomationPropertiesStatics4 := IAutomationPropertiesStatics4(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics4.get_LocalizedLandmarkTypeProperty()
    }

    /**
     * Gets the value of the localized landmark type attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The [DependencyObject](../windows.ui.xaml/dependencyobject.md) to check.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getlocalizedlandmarktype
     */
    static GetLocalizedLandmarkType(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics4.IID)
            AutomationProperties.__IAutomationPropertiesStatics4 := IAutomationPropertiesStatics4(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics4.GetLocalizedLandmarkType(element)
    }

    /**
     * Sets the value of the localized landmark type attached property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {HSTRING} value The localized string defining the landmark type of the *element*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setlocalizedlandmarktype
     */
    static SetLocalizedLandmarkType(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics4.IID)
            AutomationProperties.__IAutomationPropertiesStatics4 := IAutomationPropertiesStatics4(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics4.SetLocalizedLandmarkType(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CultureProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics6.IID)
            AutomationProperties.__IAutomationPropertiesStatics6 := IAutomationPropertiesStatics6(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics6.get_CultureProperty()
    }

    /**
     * Gets the value of the [Culture](automationproperties_culture.md) XAML attached property for the specified [DependencyObject](/uwp/api/windows.ui.xaml.dependencyobject).
     * @param {DependencyObject} element The [DependencyObject](/uwp/api/windows.ui.xaml.dependencyobject) to check.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getculture
     */
    static GetCulture(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics6.IID)
            AutomationProperties.__IAutomationPropertiesStatics6 := IAutomationPropertiesStatics6(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics6.GetCulture(element)
    }

    /**
     * Sets the value of the [Culture](automationproperties_culture.md) attached property for the specified [DependencyObject](/uwp/api/windows.ui.xaml.dependencyobject).
     * @param {DependencyObject} element The [DependencyObject](/uwp/api/windows.ui.xaml.dependencyobject) for which to set the culture property.
     * @param {Integer} value The value of the culture property to set for the specified *element*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setculture
     */
    static SetCulture(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics6.IID)
            AutomationProperties.__IAutomationPropertiesStatics6 := IAutomationPropertiesStatics6(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics6.SetCulture(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeadingLevelProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics7.IID)
            AutomationProperties.__IAutomationPropertiesStatics7 := IAutomationPropertiesStatics7(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics7.get_HeadingLevelProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.HeadingLevel](automationproperties_headinglevel.md) property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @remarks
     * Heading elements organize the user interface and make it easier to navigate. Some assistive technology (AT) allows users to quickly jump between headings. Headings have a level from 1 to 9.
     * 
     * ![Mouse settings page in Windows Ease of Access settings](images/MouseSettings.png)
     * 
     * Examples of headings would be section titles within Windows Settings. For instance, under the **Ease of Access** -> **Mouse** page, **Pointer size**, **Pointer color**, and **Mouse keys** would be a heading of level 1.
     * @param {DependencyObject} element The specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getheadinglevel
     */
    static GetHeadingLevel(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics7.IID)
            AutomationProperties.__IAutomationPropertiesStatics7 := IAutomationPropertiesStatics7(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics7.GetHeadingLevel(element)
    }

    /**
     * Sets the value of the [AutomationProperties.HeadingLevel](automationproperties_headinglevelproperty.md) property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @remarks
     * Heading elements organize the user interface and make it easier to navigate. Some assistive technology (AT) allows users to quickly jump between headings. Headings have a level from 1 to 9.  
     * 
     * ![Mouse settings page in Windows Ease of Access settings](images/MouseSettings.png)
     * 
     * Examples of headings would be section titles within Windows Settings. For instance, under the **Ease of Access** -> **Mouse** page, **Pointer size**, **Pointer color**, and **Mouse keys** would be a heading of level 1.
     * @param {DependencyObject} element The specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {Integer} value The value for the heading level.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setheadinglevel
     */
    static SetHeadingLevel(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics7.IID)
            AutomationProperties.__IAutomationPropertiesStatics7 := IAutomationPropertiesStatics7(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics7.SetHeadingLevel(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsPeripheralProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.get_IsPeripheralProperty()
    }

    /**
     * Gets a Boolean value that indicates whether the specified element represents peripheral UI.
     * @param {DependencyObject} element The element to check for peripheral data.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getisperipheral
     */
    static GetIsPeripheral(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.GetIsPeripheral(element)
    }

    /**
     * Sets a Boolean value that indicates whether the specified element represents peripheral UI.
     * @param {DependencyObject} element The element for which to set peripheral data.
     * @param {Boolean} value A Boolean value that indicates whether the [DependencyObject](../windows.ui.xaml/dependencyobject.md) specified by the *element* parameter represents peripheral UI.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setisperipheral
     */
    static SetIsPeripheral(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.SetIsPeripheral(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsDataValidForFormProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.get_IsDataValidForFormProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.IsDataValidForForm](automationproperties_isdatavalidforform.md) property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The element for which to get data validation.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getisdatavalidforform
     */
    static GetIsDataValidForForm(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.GetIsDataValidForForm(element)
    }

    /**
     * Sets a Boolean value that indicates whether the entered or selected value is valid for the form rule associated with the specified element.
     * @param {DependencyObject} element The element for which to set data validation.
     * @param {Boolean} value A Boolean value that indicates whether the entered or selected data is valid for the form.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setisdatavalidforform
     */
    static SetIsDataValidForForm(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.SetIsDataValidForForm(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FullDescriptionProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.get_FullDescriptionProperty()
    }

    /**
     * Gets the value of the [AutomationProperties.FullDescription](automationproperties_fulldescription.md) property for the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The object for which to get the full description.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getfulldescription
     */
    static GetFullDescription(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.GetFullDescription(element)
    }

    /**
     * Sets a localized string that describes the visual appearance or contents of the specified [DependencyObject](../windows.ui.xaml/dependencyobject.md).
     * @param {DependencyObject} element The object for which to set the full description.
     * @param {HSTRING} value The localized full description of the object specified in the *element* parameter.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setfulldescription
     */
    static SetFullDescription(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.SetFullDescription(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LocalizedControlTypeProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.get_LocalizedControlTypeProperty()
    }

    /**
     * Gets a localized string that indicates the type of the specified control.
     * @remarks
     * Provides a mechanism to alter the control type read by Narrator. This is helpful in describing custom UI as "Menu" or "Button" where default controls are not used or composite UI built from common controls is used to create new functionality.
     * @param {DependencyObject} element The control for which to retrieve the type.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getlocalizedcontroltype
     */
    static GetLocalizedControlType(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.GetLocalizedControlType(element)
    }

    /**
     * Sets a localized string that indicates the type of the specified control.
     * @remarks
     * Provides a mechanism to alter the control type read by Narrator. This is helpful in describing custom UI as "Menu" or "Button" where default controls are not used or composite UI built from common controls is used to create new functionality.
     * @param {DependencyObject} element The control for which to set the type.
     * @param {HSTRING} value A localized string that indicates the type of the control specified by the *element* parameter.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.setlocalizedcontroltype
     */
    static SetLocalizedControlType(element, value) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.SetLocalizedControlType(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DescribedByProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.get_DescribedByProperty()
    }

    /**
     * Gets a collection of elements that provide more information about the specified automation element.
     * @remarks
     * The described by collection is used when an automation element is explained by another segment of the application UI. For example, the collection can contain a text element of "2,529 items in 85 groups, 10 items selected" from a complex custom list object. Instead of using the object model for clients to digest similar information, the described by collection can offer quick access to UI elements that may already offer useful end-user information describing the UI element.
     * @param {DependencyObject} element The automation element for which to get the described by collection.
     * @returns {IVector<DependencyObject>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getdescribedby
     */
    static GetDescribedBy(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.GetDescribedBy(element)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FlowsToProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.get_FlowsToProperty()
    }

    /**
     * Gets a list of automation elements that suggests the reading order after the specified automation element.
     * @remarks
     * Get the list, then call the [Add](/dotnet/api/system.collections.generic.icollection-1.add?view=dotnet-uwp-10.0&preserve-view=true) method to add a new element.
     * 
     * > [!IMPORTANT]
     * > When modifying the flow, be careful not to create a situation where the user gets stuck in a navigation loop that they can't escape if they are only using a keyboard.
     * @param {DependencyObject} element The element for which to get the following reading order elements.
     * @returns {IVector<DependencyObject>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getflowsto
     */
    static GetFlowsTo(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.GetFlowsTo(element)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FlowsFromProperty() {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.get_FlowsFromProperty()
    }

    /**
     * Gets a list of automation elements that suggests the reading order before the specified automation element.
     * @remarks
     * Get the list, then call the [Add](/dotnet/api/system.collections.generic.icollection-1.add?view=dotnet-uwp-10.0&preserve-view=true) method to add a new element.
     * 
     * > [!IMPORTANT]
     * > When modifying the flow, be careful not to create a situation where the user gets stuck in a navigation loop that they can't escape if they are only using a keyboard.
     * @param {DependencyObject} element The element for which to get the preceding reading order elements.
     * @returns {IVector<DependencyObject>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperties.getflowsfrom
     */
    static GetFlowsFrom(element) {
        if (!AutomationProperties.HasProp("__IAutomationPropertiesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPropertiesStatics5.IID)
            AutomationProperties.__IAutomationPropertiesStatics5 := IAutomationPropertiesStatics5(factoryPtr)
        }

        return AutomationProperties.__IAutomationPropertiesStatics5.GetFlowsFrom(element)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
