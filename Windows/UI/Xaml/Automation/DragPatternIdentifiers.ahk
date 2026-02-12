#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDragPatternIdentifiers.ahk
#Include .\IDragPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [IDragProvider](../windows.ui.xaml.automation.provider/idragprovider.md).
 * @remarks
 * Classes such as DragPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [IDragProvider](../windows.ui.xaml.automation.provider/idragprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [IDragProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-idragprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.dragpatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class DragPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDragPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDragPatternIdentifiers.IID

    /**
     * Gets the identifier for the [DropEffect](../windows.ui.xaml.automation.provider/idragprovider_dropeffect.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.dragpatternidentifiers.dropeffectproperty
     * @type {AutomationProperty} 
     */
    static DropEffectProperty {
        get => DragPatternIdentifiers.get_DropEffectProperty()
    }

    /**
     * Gets the identifier for the [DropEffects](../windows.ui.xaml.automation.provider/idragprovider_dropeffects.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.dragpatternidentifiers.dropeffectsproperty
     * @type {AutomationProperty} 
     */
    static DropEffectsProperty {
        get => DragPatternIdentifiers.get_DropEffectsProperty()
    }

    /**
     * Gets the identifier for the [GrabbedItems](../windows.ui.xaml.automation.provider/idragprovider_getgrabbeditems_46670767.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.dragpatternidentifiers.grabbeditemsproperty
     * @type {AutomationProperty} 
     */
    static GrabbedItemsProperty {
        get => DragPatternIdentifiers.get_GrabbedItemsProperty()
    }

    /**
     * Gets the identifier for the [IsGrabbed](../windows.ui.xaml.automation.provider/idragprovider_isgrabbed.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.dragpatternidentifiers.isgrabbedproperty
     * @type {AutomationProperty} 
     */
    static IsGrabbedProperty {
        get => DragPatternIdentifiers.get_IsGrabbedProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_DropEffectProperty() {
        if (!DragPatternIdentifiers.HasProp("__IDragPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.DragPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDragPatternIdentifiersStatics.IID)
            DragPatternIdentifiers.__IDragPatternIdentifiersStatics := IDragPatternIdentifiersStatics(factoryPtr)
        }

        return DragPatternIdentifiers.__IDragPatternIdentifiersStatics.get_DropEffectProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_DropEffectsProperty() {
        if (!DragPatternIdentifiers.HasProp("__IDragPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.DragPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDragPatternIdentifiersStatics.IID)
            DragPatternIdentifiers.__IDragPatternIdentifiersStatics := IDragPatternIdentifiersStatics(factoryPtr)
        }

        return DragPatternIdentifiers.__IDragPatternIdentifiersStatics.get_DropEffectsProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_GrabbedItemsProperty() {
        if (!DragPatternIdentifiers.HasProp("__IDragPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.DragPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDragPatternIdentifiersStatics.IID)
            DragPatternIdentifiers.__IDragPatternIdentifiersStatics := IDragPatternIdentifiersStatics(factoryPtr)
        }

        return DragPatternIdentifiers.__IDragPatternIdentifiersStatics.get_GrabbedItemsProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsGrabbedProperty() {
        if (!DragPatternIdentifiers.HasProp("__IDragPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.DragPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDragPatternIdentifiersStatics.IID)
            DragPatternIdentifiers.__IDragPatternIdentifiersStatics := IDragPatternIdentifiersStatics(factoryPtr)
        }

        return DragPatternIdentifiers.__IDragPatternIdentifiersStatics.get_IsGrabbedProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
