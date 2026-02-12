#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITransformPattern2Identifiers.ahk
#Include .\ITransformPattern2IdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [ITransformProvider2](../windows.ui.xaml.automation.provider/itransformprovider2.md).
 * @remarks
 * [ITransformProvider2](../windows.ui.xaml.automation.provider/itransformprovider2.md) extends the [ITransformProvider](../windows.ui.xaml.automation.provider/itransformprovider.md) interface to enable Microsoft UI Automation providers to expose properties to support the viewport zooming functionality of a control.
 * 
 * Classes such as TransformPattern2Identifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [ITransformProvider2](../windows.ui.xaml.automation.provider/itransformprovider2.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.peers/itemscontrolautomationpeer_finditembyproperty_1997743353.md) in an items container peer. This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [ITransformProvider2](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itransformprovider2) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.transformpattern2identifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class TransformPattern2Identifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITransformPattern2Identifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITransformPattern2Identifiers.IID

    /**
     * Identifies the [CanZoom](../windows.ui.xaml.automation.provider/itransformprovider2_canzoom.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.transformpattern2identifiers.canzoomproperty
     * @type {AutomationProperty} 
     */
    static CanZoomProperty {
        get => TransformPattern2Identifiers.get_CanZoomProperty()
    }

    /**
     * Identifies the [ZoomLevel](../windows.ui.xaml.automation.provider/itransformprovider2_zoomlevel.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.transformpattern2identifiers.zoomlevelproperty
     * @type {AutomationProperty} 
     */
    static ZoomLevelProperty {
        get => TransformPattern2Identifiers.get_ZoomLevelProperty()
    }

    /**
     * Identifies the [MaxZoom](../windows.ui.xaml.automation.provider/itransformprovider2_maxzoom.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.transformpattern2identifiers.maxzoomproperty
     * @type {AutomationProperty} 
     */
    static MaxZoomProperty {
        get => TransformPattern2Identifiers.get_MaxZoomProperty()
    }

    /**
     * Identifies the [MinZoom](../windows.ui.xaml.automation.provider/itransformprovider2_minzoom.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.transformpattern2identifiers.minzoomproperty
     * @type {AutomationProperty} 
     */
    static MinZoomProperty {
        get => TransformPattern2Identifiers.get_MinZoomProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_CanZoomProperty() {
        if (!TransformPattern2Identifiers.HasProp("__ITransformPattern2IdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.TransformPattern2Identifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITransformPattern2IdentifiersStatics.IID)
            TransformPattern2Identifiers.__ITransformPattern2IdentifiersStatics := ITransformPattern2IdentifiersStatics(factoryPtr)
        }

        return TransformPattern2Identifiers.__ITransformPattern2IdentifiersStatics.get_CanZoomProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ZoomLevelProperty() {
        if (!TransformPattern2Identifiers.HasProp("__ITransformPattern2IdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.TransformPattern2Identifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITransformPattern2IdentifiersStatics.IID)
            TransformPattern2Identifiers.__ITransformPattern2IdentifiersStatics := ITransformPattern2IdentifiersStatics(factoryPtr)
        }

        return TransformPattern2Identifiers.__ITransformPattern2IdentifiersStatics.get_ZoomLevelProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_MaxZoomProperty() {
        if (!TransformPattern2Identifiers.HasProp("__ITransformPattern2IdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.TransformPattern2Identifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITransformPattern2IdentifiersStatics.IID)
            TransformPattern2Identifiers.__ITransformPattern2IdentifiersStatics := ITransformPattern2IdentifiersStatics(factoryPtr)
        }

        return TransformPattern2Identifiers.__ITransformPattern2IdentifiersStatics.get_MaxZoomProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_MinZoomProperty() {
        if (!TransformPattern2Identifiers.HasProp("__ITransformPattern2IdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.TransformPattern2Identifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITransformPattern2IdentifiersStatics.IID)
            TransformPattern2Identifiers.__ITransformPattern2IdentifiersStatics := ITransformPattern2IdentifiersStatics(factoryPtr)
        }

        return TransformPattern2Identifiers.__ITransformPattern2IdentifiersStatics.get_MinZoomProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
