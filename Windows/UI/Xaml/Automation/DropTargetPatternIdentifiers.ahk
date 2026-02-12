#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDropTargetPatternIdentifiers.ahk
#Include .\IDropTargetPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [IDropTargetProvider](../windows.ui.xaml.automation.provider/idroptargetprovider.md).
 * @remarks
 * Classes such as DropTargetPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [IDropTargetProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-idroptargetprovider) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [IDropTargetProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-idroptargetprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.droptargetpatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class DropTargetPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDropTargetPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDropTargetPatternIdentifiers.IID

    /**
     * Gets the identifier for the [DropEffect](../windows.ui.xaml.automation.provider/idroptargetprovider_dropeffect.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.droptargetpatternidentifiers.droptargeteffectproperty
     * @type {AutomationProperty} 
     */
    static DropTargetEffectProperty {
        get => DropTargetPatternIdentifiers.get_DropTargetEffectProperty()
    }

    /**
     * Gets the identifier for the [DropEffects](../windows.ui.xaml.automation.provider/idroptargetprovider_dropeffects.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.droptargetpatternidentifiers.droptargeteffectsproperty
     * @type {AutomationProperty} 
     */
    static DropTargetEffectsProperty {
        get => DropTargetPatternIdentifiers.get_DropTargetEffectsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_DropTargetEffectProperty() {
        if (!DropTargetPatternIdentifiers.HasProp("__IDropTargetPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.DropTargetPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDropTargetPatternIdentifiersStatics.IID)
            DropTargetPatternIdentifiers.__IDropTargetPatternIdentifiersStatics := IDropTargetPatternIdentifiersStatics(factoryPtr)
        }

        return DropTargetPatternIdentifiers.__IDropTargetPatternIdentifiersStatics.get_DropTargetEffectProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_DropTargetEffectsProperty() {
        if (!DropTargetPatternIdentifiers.HasProp("__IDropTargetPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.DropTargetPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDropTargetPatternIdentifiersStatics.IID)
            DropTargetPatternIdentifiers.__IDropTargetPatternIdentifiersStatics := IDropTargetPatternIdentifiersStatics(factoryPtr)
        }

        return DropTargetPatternIdentifiers.__IDropTargetPatternIdentifiersStatics.get_DropTargetEffectsProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
