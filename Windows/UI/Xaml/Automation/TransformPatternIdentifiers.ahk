#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITransformPatternIdentifiers.ahk
#Include .\ITransformPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [ITransformProvider](../windows.ui.xaml.automation.provider/itransformprovider.md).
 * @remarks
 * Classes such as TransformPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [ITransformProvider](../windows.ui.xaml.automation.provider/itransformprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [ITransformProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itransformprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.transformpatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class TransformPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITransformPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITransformPatternIdentifiers.IID

    /**
     * Identifies the [CanMove](../windows.ui.xaml.automation.provider/itransformprovider_canmove.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.transformpatternidentifiers.canmoveproperty
     * @type {AutomationProperty} 
     */
    static CanMoveProperty {
        get => TransformPatternIdentifiers.get_CanMoveProperty()
    }

    /**
     * Identifies the [CanResize](../windows.ui.xaml.automation.provider/itransformprovider_canresize.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.transformpatternidentifiers.canresizeproperty
     * @type {AutomationProperty} 
     */
    static CanResizeProperty {
        get => TransformPatternIdentifiers.get_CanResizeProperty()
    }

    /**
     * Identifies the [CanRotate](../windows.ui.xaml.automation.provider/itransformprovider_canrotate.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.transformpatternidentifiers.canrotateproperty
     * @type {AutomationProperty} 
     */
    static CanRotateProperty {
        get => TransformPatternIdentifiers.get_CanRotateProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_CanMoveProperty() {
        if (!TransformPatternIdentifiers.HasProp("__ITransformPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.TransformPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITransformPatternIdentifiersStatics.IID)
            TransformPatternIdentifiers.__ITransformPatternIdentifiersStatics := ITransformPatternIdentifiersStatics(factoryPtr)
        }

        return TransformPatternIdentifiers.__ITransformPatternIdentifiersStatics.get_CanMoveProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_CanResizeProperty() {
        if (!TransformPatternIdentifiers.HasProp("__ITransformPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.TransformPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITransformPatternIdentifiersStatics.IID)
            TransformPatternIdentifiers.__ITransformPatternIdentifiersStatics := ITransformPatternIdentifiersStatics(factoryPtr)
        }

        return TransformPatternIdentifiers.__ITransformPatternIdentifiersStatics.get_CanResizeProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_CanRotateProperty() {
        if (!TransformPatternIdentifiers.HasProp("__ITransformPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.TransformPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITransformPatternIdentifiersStatics.IID)
            TransformPatternIdentifiers.__ITransformPatternIdentifiersStatics := ITransformPatternIdentifiersStatics(factoryPtr)
        }

        return TransformPatternIdentifiers.__ITransformPatternIdentifiersStatics.get_CanRotateProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
