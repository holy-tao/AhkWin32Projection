#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpreadsheetItemPatternIdentifiers.ahk
#Include .\ISpreadsheetItemPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as automation property identifiers for properties of the [ISpreadsheetItemProvider](../windows.ui.xaml.automation.provider/ispreadsheetitemprovider.md) pattern.
 * @remarks
 * Classes such as SpreadsheetItemPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [ISpreadsheetItemProvider](../windows.ui.xaml.automation.provider/ispreadsheetitemprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.peers/itemscontrolautomationpeer_finditembyproperty_1997743353.md) in an items container peer. This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [ISpreadsheetItemProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-ispreadsheetitemprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.spreadsheetitempatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class SpreadsheetItemPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpreadsheetItemPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpreadsheetItemPatternIdentifiers.IID

    /**
     * Identifies the [Formula](../windows.ui.xaml.automation.provider/ispreadsheetitemprovider_formula.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.spreadsheetitempatternidentifiers.formulaproperty
     * @type {AutomationProperty} 
     */
    static FormulaProperty {
        get => SpreadsheetItemPatternIdentifiers.get_FormulaProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_FormulaProperty() {
        if (!SpreadsheetItemPatternIdentifiers.HasProp("__ISpreadsheetItemPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.SpreadsheetItemPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpreadsheetItemPatternIdentifiersStatics.IID)
            SpreadsheetItemPatternIdentifiers.__ISpreadsheetItemPatternIdentifiersStatics := ISpreadsheetItemPatternIdentifiersStatics(factoryPtr)
        }

        return SpreadsheetItemPatternIdentifiers.__ISpreadsheetItemPatternIdentifiersStatics.get_FormulaProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
