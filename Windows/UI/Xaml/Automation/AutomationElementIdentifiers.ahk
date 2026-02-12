#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAutomationElementIdentifiers.ahk
#Include .\IAutomationElementIdentifiersStatics3.ahk
#Include .\IAutomationElementIdentifiersStatics2.ahk
#Include .\IAutomationElementIdentifiersStatics4.ahk
#Include .\IAutomationElementIdentifiersStatics.ahk
#Include .\IAutomationElementIdentifiersStatics8.ahk
#Include .\IAutomationElementIdentifiersStatics5.ahk
#Include .\IAutomationElementIdentifiersStatics7.ahk
#Include .\IAutomationElementIdentifiersStatics6.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as automation property identifiers by UI Automation providers and UI Automation clients.
 * @remarks
 * Classes such as **AutomationElementIdentifiers** are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. **AutomationElementIdentifiers** identifies the general automation peer properties that are part of the basic peer functionality, as opposed to being related to a specific automation control pattern. You might use these identifiers if you are implementing a Windows Runtime custom automation peer based on [AutomationPeer](../windows.ui.xaml.automation.peers/automationpeer.md) or [FrameworkElementAutomationPeer](../windows.ui.xaml.automation.peers/frameworkelementautomationpeer.md). These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same set of property identifiers is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. One such property identifier list for clients is documented in the topic [Automation Element Property Identifiers](/windows/desktop/WinAuto/uiauto-automation-element-propids).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AutomationElementIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutomationElementIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutomationElementIdentifiers.IID

    /**
     * Gets the identifier for the position in set automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.positioninsetproperty
     * @type {AutomationProperty} 
     */
    static PositionInSetProperty {
        get => AutomationElementIdentifiers.get_PositionInSetProperty()
    }

    /**
     * Gets the identification of the size of set automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.sizeofsetproperty
     * @type {AutomationProperty} 
     */
    static SizeOfSetProperty {
        get => AutomationElementIdentifiers.get_SizeOfSetProperty()
    }

    /**
     * Gets the identifier for the level automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.levelproperty
     * @type {AutomationProperty} 
     */
    static LevelProperty {
        get => AutomationElementIdentifiers.get_LevelProperty()
    }

    /**
     * Gets the identifier for the annotations automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.annotationsproperty
     * @type {AutomationProperty} 
     */
    static AnnotationsProperty {
        get => AutomationElementIdentifiers.get_AnnotationsProperty()
    }

    /**
     * Identifies the controlled peers automation property. A list of controlled peers is returned by the [GetControlledPeers](../windows.ui.xaml.automation.peers/automationpeer_getcontrolledpeers_1408209931.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.controlledpeersproperty
     * @type {AutomationProperty} 
     */
    static ControlledPeersProperty {
        get => AutomationElementIdentifiers.get_ControlledPeersProperty()
    }

    /**
     * Gets the identifier for the landmark type automation property.
     * @remarks
     * Landmarks are defined by their type, which can be a well-known value, or a custom localized string.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.landmarktypeproperty
     * @type {AutomationProperty} 
     */
    static LandmarkTypeProperty {
        get => AutomationElementIdentifiers.get_LandmarkTypeProperty()
    }

    /**
     * Gets the identifier for the localized landmark type automation property.
     * @remarks
     * Landmarks are defined by their type, which can be a well-known value, or a custom localized string.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.localizedlandmarktypeproperty
     * @type {AutomationProperty} 
     */
    static LocalizedLandmarkTypeProperty {
        get => AutomationElementIdentifiers.get_LocalizedLandmarkTypeProperty()
    }

    /**
     * Identifies the accelerator key automation property. The accelerator key property value is returned by the [GetAcceleratorKey](../windows.ui.xaml.automation.peers/automationpeer_getacceleratorkey_970307487.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.acceleratorkeyproperty
     * @type {AutomationProperty} 
     */
    static AcceleratorKeyProperty {
        get => AutomationElementIdentifiers.get_AcceleratorKeyProperty()
    }

    /**
     * Identifies the access key automation property. The access key property value is returned by the [GetAccessKey](../windows.ui.xaml.automation.peers/automationpeer_getaccesskey_372284052.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.accesskeyproperty
     * @type {AutomationProperty} 
     */
    static AccessKeyProperty {
        get => AutomationElementIdentifiers.get_AccessKeyProperty()
    }

    /**
     * Identifies the automation element identifier automation property. The automation element identifier value is returned by the [GetAutomationId](../windows.ui.xaml.automation.peers/automationpeer_getautomationid_1912681712.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.automationidproperty
     * @type {AutomationProperty} 
     */
    static AutomationIdProperty {
        get => AutomationElementIdentifiers.get_AutomationIdProperty()
    }

    /**
     * Identifies the bounding rectangle automation property. The bounding rectangle property value is returned by the [GetBoundingRectangle](../windows.ui.xaml.automation.peers/automationpeer_getboundingrectangle_297705113.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.boundingrectangleproperty
     * @type {AutomationProperty} 
     */
    static BoundingRectangleProperty {
        get => AutomationElementIdentifiers.get_BoundingRectangleProperty()
    }

    /**
     * Identifies the class name automation property. The class name property value is returned by the [GetClassName](../windows.ui.xaml.automation.peers/automationpeer_getclassname_614238974.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.classnameproperty
     * @type {AutomationProperty} 
     */
    static ClassNameProperty {
        get => AutomationElementIdentifiers.get_ClassNameProperty()
    }

    /**
     * Identifies the clickable point automation property. A valid clickable point property value is returned by the [GetClickablePoint](../windows.ui.xaml.automation.peers/automationpeer_getclickablepoint_955785073.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.clickablepointproperty
     * @type {AutomationProperty} 
     */
    static ClickablePointProperty {
        get => AutomationElementIdentifiers.get_ClickablePointProperty()
    }

    /**
     * Identifies the control type automation property. The control type property value is returned by the [GetAutomationControlType](../windows.ui.xaml.automation.peers/automationpeer_getautomationcontroltype_1156384152.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.controltypeproperty
     * @type {AutomationProperty} 
     */
    static ControlTypeProperty {
        get => AutomationElementIdentifiers.get_ControlTypeProperty()
    }

    /**
     * Identifies the keyboard focus automation property. The keyboard focus state is returned by the [HasKeyboardFocus](../windows.ui.xaml.automation.peers/automationpeer_haskeyboardfocus_1926443629.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.haskeyboardfocusproperty
     * @type {AutomationProperty} 
     */
    static HasKeyboardFocusProperty {
        get => AutomationElementIdentifiers.get_HasKeyboardFocusProperty()
    }

    /**
     * Identifies the help text automation property. The help text property value is returned by the [GetHelpText](../windows.ui.xaml.automation.peers/automationpeer_gethelptext_1251901404.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.helptextproperty
     * @type {AutomationProperty} 
     */
    static HelpTextProperty {
        get => AutomationElementIdentifiers.get_HelpTextProperty()
    }

    /**
     * Identifies the content element determination automation property. The content element status indicates whether the element contains content that is valuable to the end user. The current status is returned by the [IsContentElement](../windows.ui.xaml.automation.peers/automationpeer_iscontentelement_545450603.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.iscontentelementproperty
     * @type {AutomationProperty} 
     */
    static IsContentElementProperty {
        get => AutomationElementIdentifiers.get_IsContentElementProperty()
    }

    /**
     * Identifies the control element determination automation property. The control element status indicates whether the element contains user interface components that can be manipulated. The current status is returned by the [IsControlElement](../windows.ui.xaml.automation.peers/automationpeer_iscontrolelement_1004644794.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.iscontrolelementproperty
     * @type {AutomationProperty} 
     */
    static IsControlElementProperty {
        get => AutomationElementIdentifiers.get_IsControlElementProperty()
    }

    /**
     * Identifies the enabled determination automation property. The enabled status indicates whether the item referenced by the automation peer is enabled. The current status is returned by the [IsEnabled](../windows.ui.xaml.automation.peers/automationpeer_isenabled_180154405.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.isenabledproperty
     * @type {AutomationProperty} 
     */
    static IsEnabledProperty {
        get => AutomationElementIdentifiers.get_IsEnabledProperty()
    }

    /**
     * Identifies the keyboard-focusable determination automation property. The keyboard focusable status is returned by the [IsKeyboardFocusable](../windows.ui.xaml.automation.peers/automationpeer_iskeyboardfocusable_2030365113.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.iskeyboardfocusableproperty
     * @type {AutomationProperty} 
     */
    static IsKeyboardFocusableProperty {
        get => AutomationElementIdentifiers.get_IsKeyboardFocusableProperty()
    }

    /**
     * Identifies the offscreen determination automation property. The offscreen status indicates whether the item referenced by the automation peer is off the screen. The current status is returned by the [IsOffscreen](../windows.ui.xaml.automation.peers/automationpeer_isoffscreen_970705929.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.isoffscreenproperty
     * @type {AutomationProperty} 
     */
    static IsOffscreenProperty {
        get => AutomationElementIdentifiers.get_IsOffscreenProperty()
    }

    /**
     * Identifies the password determination automation property. The password status indicates whether the item referenced by the automation peer contains a password. The current status is returned by the [IsPassword](../windows.ui.xaml.automation.peers/automationpeer_ispassword_1875117543.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.ispasswordproperty
     * @type {AutomationProperty} 
     */
    static IsPasswordProperty {
        get => AutomationElementIdentifiers.get_IsPasswordProperty()
    }

    /**
     * Identifies the form requirement determination automation property. The form requirement status indicates whether the element must be completed on a form. The current status is returned by the [IsRequiredForForm](../windows.ui.xaml.automation.peers/automationpeer_isrequiredforform_1300796554.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.isrequiredforformproperty
     * @type {AutomationProperty} 
     */
    static IsRequiredForFormProperty {
        get => AutomationElementIdentifiers.get_IsRequiredForFormProperty()
    }

    /**
     * Identifies the item status automation property. The current item status is returned by the [GetItemStatus](../windows.ui.xaml.automation.peers/automationpeer_getitemstatus_341251311.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.itemstatusproperty
     * @type {AutomationProperty} 
     */
    static ItemStatusProperty {
        get => AutomationElementIdentifiers.get_ItemStatusProperty()
    }

    /**
     * Identifies the item type automation property. The item type value is returned by [GetItemType](../windows.ui.xaml.automation.peers/automationpeer_getitemtype_747068727.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.itemtypeproperty
     * @type {AutomationProperty} 
     */
    static ItemTypeProperty {
        get => AutomationElementIdentifiers.get_ItemTypeProperty()
    }

    /**
     * Identifies the labeled-by peer automation property. The labeling relationship for an automation peer is returned by the [GetLabeledBy](../windows.ui.xaml.automation.peers/automationpeer_getlabeledby_1845689.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.labeledbyproperty
     * @type {AutomationProperty} 
     */
    static LabeledByProperty {
        get => AutomationElementIdentifiers.get_LabeledByProperty()
    }

    /**
     * Identifies the localized control type automation property which provides a mechanism to alter the control type read by Narrator.
     * @remarks
     * The current localized control type is returned by the [GetLocalizedControlTypeCore](../windows.ui.xaml.automation.peers/automationpeer_getlocalizedcontroltypecore_1799576178.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.localizedcontroltypeproperty
     * @type {AutomationProperty} 
     */
    static LocalizedControlTypeProperty {
        get => AutomationElementIdentifiers.get_LocalizedControlTypeProperty()
    }

    /**
     * Identifies the element name automation property. The current name is returned by the [GetName](../windows.ui.xaml.automation.peers/automationpeer_getname_1386609741.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.nameproperty
     * @type {AutomationProperty} 
     */
    static NameProperty {
        get => AutomationElementIdentifiers.get_NameProperty()
    }

    /**
     * Identifies the orientation automation property. The current orientation value is returned by the [GetOrientation](../windows.ui.xaml.automation.peers/automationpeer_getorientation_419829207.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.orientationproperty
     * @type {AutomationProperty} 
     */
    static OrientationProperty {
        get => AutomationElementIdentifiers.get_OrientationProperty()
    }

    /**
     * Identifies the live settings automation property. The live settings property value is returned by the [GetLiveSetting](automationproperties_getlivesetting_1890338705.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.livesettingproperty
     * @type {AutomationProperty} 
     */
    static LiveSettingProperty {
        get => AutomationElementIdentifiers.get_LiveSettingProperty()
    }

    /**
     * Identifies the Boolean [AutomationProperties.IsDialogProperty](automationproperties_isdialogproperty.md) that indicates whether the automation element is a dialog window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.isdialogproperty
     * @type {AutomationProperty} 
     */
    static IsDialogProperty {
        get => AutomationElementIdentifiers.get_IsDialogProperty()
    }

    /**
     * Identifies the Boolean automation property that indicates if the automation element represents peripheral UI.
     * @remarks
     * A Boolean that indicates the automation element represents peripheral UI is returned by the [GetIsPeripheral](automationproperties_getisperipheral_1121244247.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.isperipheralproperty
     * @type {AutomationProperty} 
     */
    static IsPeripheralProperty {
        get => AutomationElementIdentifiers.get_IsPeripheralProperty()
    }

    /**
     * Identifies the Boolean automation property that indicates if the data is valid for the form.
     * @remarks
     * A Boolean that indicates if the data is valid for the form is returned by the [GetIsDataValidForForm](automationproperties_getisdatavalidforform_597294680.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.isdatavalidforformproperty
     * @type {AutomationProperty} 
     */
    static IsDataValidForFormProperty {
        get => AutomationElementIdentifiers.get_IsDataValidForFormProperty()
    }

    /**
     * Identifies the full description automation property.
     * @remarks
     * A localized string that describes the visual appearance or contents of something such as an image or image control is returned by the [GetFullDescription](automationproperties_getfulldescription_437649034.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.fulldescriptionproperty
     * @type {AutomationProperty} 
     */
    static FullDescriptionProperty {
        get => AutomationElementIdentifiers.get_FullDescriptionProperty()
    }

    /**
     * Identifies the described by automation property.
     * @remarks
     * The collection of elements that provide more information about the automation element is returned by the [GetDescribedBy](automationproperties_getdescribedby_903862056.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.describedbyproperty
     * @type {AutomationProperty} 
     */
    static DescribedByProperty {
        get => AutomationElementIdentifiers.get_DescribedByProperty()
    }

    /**
     * Identifies the "flows to" automation property. The "flows to" property value is returned by the [GetFlowsTo](automationproperties_getflowsto_483856830.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.flowstoproperty
     * @type {AutomationProperty} 
     */
    static FlowsToProperty {
        get => AutomationElementIdentifiers.get_FlowsToProperty()
    }

    /**
     * Identifies the "flows from" automation property. The "flows from" property value is returned by the [GetFlowsFrom](automationproperties_getflowsfrom_1915156123.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.flowsfromproperty
     * @type {AutomationProperty} 
     */
    static FlowsFromProperty {
        get => AutomationElementIdentifiers.get_FlowsFromProperty()
    }

    /**
     * Identifies the heading level automation property. The heading level property value is returned by the [GetHeadingLevel](automationproperties_getheadinglevel_655629781.md) method.
     * @remarks
     * Heading elements help organize the user interface and make it easier to navigate. Some assistive technology (AT) allows users to quickly jump between headings. Headings have a level from 1 to 9.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.headinglevelproperty
     * @type {AutomationProperty} 
     */
    static HeadingLevelProperty {
        get => AutomationElementIdentifiers.get_HeadingLevelProperty()
    }

    /**
     * Identifies the Culture property, which contains a locale identifier for the automation element (for example, 0x0409 for "en-US" or English (United States)).
     * @remarks
     * Each locale has a unique identifier, a 32-bit value that consists of a language identifier and a sort order identifier. The locale identifier is a standard international numeric abbreviation and has the components necessary to uniquely identify one of the installed operating system-defined locales. For more information, see [Language Identifier Constants and Strings](/windows/desktop/Intl/language-identifier-constants-and-strings).  
     * 
     * This property may exist on a per-control basis, but typically is only available on an application level.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationelementidentifiers.cultureproperty
     * @type {AutomationProperty} 
     */
    static CultureProperty {
        get => AutomationElementIdentifiers.get_CultureProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_PositionInSetProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics3.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics3 := IAutomationElementIdentifiersStatics3(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics3.get_PositionInSetProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_SizeOfSetProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics3.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics3 := IAutomationElementIdentifiersStatics3(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics3.get_SizeOfSetProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_LevelProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics3.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics3 := IAutomationElementIdentifiersStatics3(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics3.get_LevelProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_AnnotationsProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics3.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics3 := IAutomationElementIdentifiersStatics3(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics3.get_AnnotationsProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ControlledPeersProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics2.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics2 := IAutomationElementIdentifiersStatics2(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics2.get_ControlledPeersProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_LandmarkTypeProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics4.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics4 := IAutomationElementIdentifiersStatics4(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics4.get_LandmarkTypeProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_LocalizedLandmarkTypeProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics4.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics4 := IAutomationElementIdentifiersStatics4(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics4.get_LocalizedLandmarkTypeProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_AcceleratorKeyProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_AcceleratorKeyProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_AccessKeyProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_AccessKeyProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_AutomationIdProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_AutomationIdProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_BoundingRectangleProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_BoundingRectangleProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ClassNameProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_ClassNameProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ClickablePointProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_ClickablePointProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ControlTypeProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_ControlTypeProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_HasKeyboardFocusProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_HasKeyboardFocusProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_HelpTextProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_HelpTextProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsContentElementProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_IsContentElementProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsControlElementProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_IsControlElementProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsEnabledProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_IsEnabledProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsKeyboardFocusableProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_IsKeyboardFocusableProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsOffscreenProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_IsOffscreenProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsPasswordProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_IsPasswordProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsRequiredForFormProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_IsRequiredForFormProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ItemStatusProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_ItemStatusProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ItemTypeProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_ItemTypeProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_LabeledByProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_LabeledByProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_LocalizedControlTypeProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_LocalizedControlTypeProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_NameProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_NameProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_OrientationProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_OrientationProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_LiveSettingProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics := IAutomationElementIdentifiersStatics(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics.get_LiveSettingProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsDialogProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics8.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics8 := IAutomationElementIdentifiersStatics8(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics8.get_IsDialogProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsPeripheralProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics5.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics5 := IAutomationElementIdentifiersStatics5(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics5.get_IsPeripheralProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsDataValidForFormProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics5.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics5 := IAutomationElementIdentifiersStatics5(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics5.get_IsDataValidForFormProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_FullDescriptionProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics5.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics5 := IAutomationElementIdentifiersStatics5(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics5.get_FullDescriptionProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_DescribedByProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics5.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics5 := IAutomationElementIdentifiersStatics5(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics5.get_DescribedByProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_FlowsToProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics5.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics5 := IAutomationElementIdentifiersStatics5(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics5.get_FlowsToProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_FlowsFromProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics5.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics5 := IAutomationElementIdentifiersStatics5(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics5.get_FlowsFromProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_HeadingLevelProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics7.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics7 := IAutomationElementIdentifiersStatics7(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics7.get_HeadingLevelProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_CultureProperty() {
        if (!AutomationElementIdentifiers.HasProp("__IAutomationElementIdentifiersStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationElementIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationElementIdentifiersStatics6.IID)
            AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics6 := IAutomationElementIdentifiersStatics6(factoryPtr)
        }

        return AutomationElementIdentifiers.__IAutomationElementIdentifiersStatics6.get_CultureProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
