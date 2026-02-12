#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDockPatternIdentifiers.ahk
#Include .\IDockPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [IDockProvider](../windows.ui.xaml.automation.provider/idockprovider.md).
 * @remarks
 * Classes such as DockPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [IDockProvider](../windows.ui.xaml.automation.provider/idockprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [IDockProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-idockprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.dockpatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class DockPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDockPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDockPatternIdentifiers.IID

    /**
     * Identifies the [DockPosition](../windows.ui.xaml.automation.provider/idockprovider_dockposition.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.dockpatternidentifiers.dockpositionproperty
     * @type {AutomationProperty} 
     */
    static DockPositionProperty {
        get => DockPatternIdentifiers.get_DockPositionProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_DockPositionProperty() {
        if (!DockPatternIdentifiers.HasProp("__IDockPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.DockPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDockPatternIdentifiersStatics.IID)
            DockPatternIdentifiers.__IDockPatternIdentifiersStatics := IDockPatternIdentifiersStatics(factoryPtr)
        }

        return DockPatternIdentifiers.__IDockPatternIdentifiersStatics.get_DockPositionProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
