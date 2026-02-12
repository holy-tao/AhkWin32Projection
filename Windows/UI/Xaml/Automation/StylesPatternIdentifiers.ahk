#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStylesPatternIdentifiers.ahk
#Include .\IStylesPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [IStylesProvider](../windows.ui.xaml.automation.provider/istylesprovider.md).
 * @remarks
 * Classes such as StylesPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [IStylesProvider](../windows.ui.xaml.automation.provider/istylesprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.peers/itemscontrolautomationpeer_finditembyproperty_1997743353.md) in an items container peer. This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [IStylesProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-istylesprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.stylespatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class StylesPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStylesPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStylesPatternIdentifiers.IID

    /**
     * Identifies the [ExtendedProperties](../windows.ui.xaml.automation.provider/istylesprovider_extendedproperties.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.stylespatternidentifiers.extendedpropertiesproperty
     * @type {AutomationProperty} 
     */
    static ExtendedPropertiesProperty {
        get => StylesPatternIdentifiers.get_ExtendedPropertiesProperty()
    }

    /**
     * Identifies the [FillColor](../windows.ui.xaml.automation.provider/istylesprovider_fillcolor.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.stylespatternidentifiers.fillcolorproperty
     * @type {AutomationProperty} 
     */
    static FillColorProperty {
        get => StylesPatternIdentifiers.get_FillColorProperty()
    }

    /**
     * Identifies the [FillPatternColor](../windows.ui.xaml.automation.provider/istylesprovider_fillpatterncolor.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.stylespatternidentifiers.fillpatterncolorproperty
     * @type {AutomationProperty} 
     */
    static FillPatternColorProperty {
        get => StylesPatternIdentifiers.get_FillPatternColorProperty()
    }

    /**
     * Identifies the [FillPatternStyle](../windows.ui.xaml.automation.provider/istylesprovider_fillpatternstyle.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.stylespatternidentifiers.fillpatternstyleproperty
     * @type {AutomationProperty} 
     */
    static FillPatternStyleProperty {
        get => StylesPatternIdentifiers.get_FillPatternStyleProperty()
    }

    /**
     * Identifies the [Shape](../windows.ui.xaml.automation.provider/istylesprovider_shape.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.stylespatternidentifiers.shapeproperty
     * @type {AutomationProperty} 
     */
    static ShapeProperty {
        get => StylesPatternIdentifiers.get_ShapeProperty()
    }

    /**
     * Identifies the [StyleId](../windows.ui.xaml.automation.provider/istylesprovider_styleid.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.stylespatternidentifiers.styleidproperty
     * @type {AutomationProperty} 
     */
    static StyleIdProperty {
        get => StylesPatternIdentifiers.get_StyleIdProperty()
    }

    /**
     * Identifies the [StyleName](../windows.ui.xaml.automation.provider/istylesprovider_stylename.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.stylespatternidentifiers.stylenameproperty
     * @type {AutomationProperty} 
     */
    static StyleNameProperty {
        get => StylesPatternIdentifiers.get_StyleNameProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ExtendedPropertiesProperty() {
        if (!StylesPatternIdentifiers.HasProp("__IStylesPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.StylesPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStylesPatternIdentifiersStatics.IID)
            StylesPatternIdentifiers.__IStylesPatternIdentifiersStatics := IStylesPatternIdentifiersStatics(factoryPtr)
        }

        return StylesPatternIdentifiers.__IStylesPatternIdentifiersStatics.get_ExtendedPropertiesProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_FillColorProperty() {
        if (!StylesPatternIdentifiers.HasProp("__IStylesPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.StylesPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStylesPatternIdentifiersStatics.IID)
            StylesPatternIdentifiers.__IStylesPatternIdentifiersStatics := IStylesPatternIdentifiersStatics(factoryPtr)
        }

        return StylesPatternIdentifiers.__IStylesPatternIdentifiersStatics.get_FillColorProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_FillPatternColorProperty() {
        if (!StylesPatternIdentifiers.HasProp("__IStylesPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.StylesPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStylesPatternIdentifiersStatics.IID)
            StylesPatternIdentifiers.__IStylesPatternIdentifiersStatics := IStylesPatternIdentifiersStatics(factoryPtr)
        }

        return StylesPatternIdentifiers.__IStylesPatternIdentifiersStatics.get_FillPatternColorProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_FillPatternStyleProperty() {
        if (!StylesPatternIdentifiers.HasProp("__IStylesPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.StylesPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStylesPatternIdentifiersStatics.IID)
            StylesPatternIdentifiers.__IStylesPatternIdentifiersStatics := IStylesPatternIdentifiersStatics(factoryPtr)
        }

        return StylesPatternIdentifiers.__IStylesPatternIdentifiersStatics.get_FillPatternStyleProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ShapeProperty() {
        if (!StylesPatternIdentifiers.HasProp("__IStylesPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.StylesPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStylesPatternIdentifiersStatics.IID)
            StylesPatternIdentifiers.__IStylesPatternIdentifiersStatics := IStylesPatternIdentifiersStatics(factoryPtr)
        }

        return StylesPatternIdentifiers.__IStylesPatternIdentifiersStatics.get_ShapeProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_StyleIdProperty() {
        if (!StylesPatternIdentifiers.HasProp("__IStylesPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.StylesPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStylesPatternIdentifiersStatics.IID)
            StylesPatternIdentifiers.__IStylesPatternIdentifiersStatics := IStylesPatternIdentifiersStatics(factoryPtr)
        }

        return StylesPatternIdentifiers.__IStylesPatternIdentifiersStatics.get_StyleIdProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_StyleNameProperty() {
        if (!StylesPatternIdentifiers.HasProp("__IStylesPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.StylesPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStylesPatternIdentifiersStatics.IID)
            StylesPatternIdentifiers.__IStylesPatternIdentifiersStatics := IStylesPatternIdentifiersStatics(factoryPtr)
        }

        return StylesPatternIdentifiers.__IStylesPatternIdentifiersStatics.get_StyleNameProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
