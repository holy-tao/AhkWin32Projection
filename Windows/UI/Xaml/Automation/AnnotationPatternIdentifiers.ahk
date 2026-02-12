#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAnnotationPatternIdentifiers.ahk
#Include .\IAnnotationPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [IAnnotationProvider](../windows.ui.xaml.automation.provider/iannotationprovider.md).
 * @remarks
 * Classes such as AnnotationPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [IAnnotationProvider](../windows.ui.xaml.automation.provider/iannotationprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [IAnnotationProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iannotationprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.annotationpatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AnnotationPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAnnotationPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAnnotationPatternIdentifiers.IID

    /**
     * Gets the identifier for the [AnnotationTypeId](../windows.ui.xaml.automation.provider/iannotationprovider_annotationtypeid.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.annotationpatternidentifiers.annotationtypeidproperty
     * @type {AutomationProperty} 
     */
    static AnnotationTypeIdProperty {
        get => AnnotationPatternIdentifiers.get_AnnotationTypeIdProperty()
    }

    /**
     * Gets the identifier for the [AnnotationTypeName](../windows.ui.xaml.automation.provider/iannotationprovider_annotationtypename.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.annotationpatternidentifiers.annotationtypenameproperty
     * @type {AutomationProperty} 
     */
    static AnnotationTypeNameProperty {
        get => AnnotationPatternIdentifiers.get_AnnotationTypeNameProperty()
    }

    /**
     * Gets the identifier for the [Author](../windows.ui.xaml.automation.provider/iannotationprovider_author.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.annotationpatternidentifiers.authorproperty
     * @type {AutomationProperty} 
     */
    static AuthorProperty {
        get => AnnotationPatternIdentifiers.get_AuthorProperty()
    }

    /**
     * Gets the identifier for the [DateTime](../windows.ui.xaml.automation.provider/iannotationprovider_datetime.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.annotationpatternidentifiers.datetimeproperty
     * @type {AutomationProperty} 
     */
    static DateTimeProperty {
        get => AnnotationPatternIdentifiers.get_DateTimeProperty()
    }

    /**
     * Gets the identifier for the [Target](../windows.ui.xaml.automation.provider/iannotationprovider_target.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.annotationpatternidentifiers.targetproperty
     * @type {AutomationProperty} 
     */
    static TargetProperty {
        get => AnnotationPatternIdentifiers.get_TargetProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_AnnotationTypeIdProperty() {
        if (!AnnotationPatternIdentifiers.HasProp("__IAnnotationPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AnnotationPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAnnotationPatternIdentifiersStatics.IID)
            AnnotationPatternIdentifiers.__IAnnotationPatternIdentifiersStatics := IAnnotationPatternIdentifiersStatics(factoryPtr)
        }

        return AnnotationPatternIdentifiers.__IAnnotationPatternIdentifiersStatics.get_AnnotationTypeIdProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_AnnotationTypeNameProperty() {
        if (!AnnotationPatternIdentifiers.HasProp("__IAnnotationPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AnnotationPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAnnotationPatternIdentifiersStatics.IID)
            AnnotationPatternIdentifiers.__IAnnotationPatternIdentifiersStatics := IAnnotationPatternIdentifiersStatics(factoryPtr)
        }

        return AnnotationPatternIdentifiers.__IAnnotationPatternIdentifiersStatics.get_AnnotationTypeNameProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_AuthorProperty() {
        if (!AnnotationPatternIdentifiers.HasProp("__IAnnotationPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AnnotationPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAnnotationPatternIdentifiersStatics.IID)
            AnnotationPatternIdentifiers.__IAnnotationPatternIdentifiersStatics := IAnnotationPatternIdentifiersStatics(factoryPtr)
        }

        return AnnotationPatternIdentifiers.__IAnnotationPatternIdentifiersStatics.get_AuthorProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_DateTimeProperty() {
        if (!AnnotationPatternIdentifiers.HasProp("__IAnnotationPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AnnotationPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAnnotationPatternIdentifiersStatics.IID)
            AnnotationPatternIdentifiers.__IAnnotationPatternIdentifiersStatics := IAnnotationPatternIdentifiersStatics(factoryPtr)
        }

        return AnnotationPatternIdentifiers.__IAnnotationPatternIdentifiersStatics.get_DateTimeProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_TargetProperty() {
        if (!AnnotationPatternIdentifiers.HasProp("__IAnnotationPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AnnotationPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAnnotationPatternIdentifiersStatics.IID)
            AnnotationPatternIdentifiers.__IAnnotationPatternIdentifiersStatics := IAnnotationPatternIdentifiersStatics(factoryPtr)
        }

        return AnnotationPatternIdentifiers.__IAnnotationPatternIdentifiersStatics.get_TargetProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
