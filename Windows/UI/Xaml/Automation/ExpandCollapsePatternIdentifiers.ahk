#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IExpandCollapsePatternIdentifiers.ahk
#Include .\IExpandCollapsePatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [IExpandCollapseProvider](../windows.ui.xaml.automation.provider/iexpandcollapseprovider.md).
 * @remarks
 * Classes such as ExpandCollapsePatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [IExpandCollapseProvider](../windows.ui.xaml.automation.provider/iexpandcollapseprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [IExpandCollapseProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iexpandcollapseprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.expandcollapsepatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class ExpandCollapsePatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IExpandCollapsePatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IExpandCollapsePatternIdentifiers.IID

    /**
     * Identifies the [ExpandCollapseState](../windows.ui.xaml.automation.provider/iexpandcollapseprovider_expandcollapsestate.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.expandcollapsepatternidentifiers.expandcollapsestateproperty
     * @type {AutomationProperty} 
     */
    static ExpandCollapseStateProperty {
        get => ExpandCollapsePatternIdentifiers.get_ExpandCollapseStateProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ExpandCollapseStateProperty() {
        if (!ExpandCollapsePatternIdentifiers.HasProp("__IExpandCollapsePatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.ExpandCollapsePatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IExpandCollapsePatternIdentifiersStatics.IID)
            ExpandCollapsePatternIdentifiers.__IExpandCollapsePatternIdentifiersStatics := IExpandCollapsePatternIdentifiersStatics(factoryPtr)
        }

        return ExpandCollapsePatternIdentifiers.__IExpandCollapsePatternIdentifiersStatics.get_ExpandCollapseStateProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
