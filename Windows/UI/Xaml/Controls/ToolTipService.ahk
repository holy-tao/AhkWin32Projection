#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToolTipService.ahk
#Include .\IToolTipServiceStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a service that provides static methods to display a [ToolTip](tooltip.md).
 * @remarks
 * A [ToolTip](tooltip.md) must be assigned to another UI element that is its owner. In Extensible Application Markup Language (XAML), use the ToolTipService.ToolTip attached property to assign the [ToolTip](tooltip.md) to an owner. In code, use the [ToolTipService.SetToolTip](tooltipservice_settooltip_1924909593.md) method to assign the [ToolTip](tooltip.md) to an owner.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltipservice
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ToolTipService extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToolTipService

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToolTipService.IID

    /**
     * Identifies the [ToolTipService.Placement](tooltipservice_placement.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltipservice.placementproperty
     * @type {DependencyProperty} 
     */
    static PlacementProperty {
        get => ToolTipService.get_PlacementProperty()
    }

    /**
     * Identifies the [ToolTipService.PlacementTarget](tooltipservice_placementtarget.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltipservice.placementtargetproperty
     * @type {DependencyProperty} 
     */
    static PlacementTargetProperty {
        get => ToolTipService.get_PlacementTargetProperty()
    }

    /**
     * Identifies the [ToolTipService.ToolTip](tooltipservice_tooltip.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltipservice.tooltipproperty
     * @type {DependencyProperty} 
     */
    static ToolTipProperty {
        get => ToolTipService.get_ToolTipProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlacementProperty() {
        if (!ToolTipService.HasProp("__IToolTipServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTipService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipServiceStatics.IID)
            ToolTipService.__IToolTipServiceStatics := IToolTipServiceStatics(factoryPtr)
        }

        return ToolTipService.__IToolTipServiceStatics.get_PlacementProperty()
    }

    /**
     * Gets the [ToolTipService.Placement](tooltipservice_placement.md) XAML attached property value for the specified target element.
     * @param {DependencyObject} element The target element for the attached property value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltipservice.getplacement
     */
    static GetPlacement(element) {
        if (!ToolTipService.HasProp("__IToolTipServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTipService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipServiceStatics.IID)
            ToolTipService.__IToolTipServiceStatics := IToolTipServiceStatics(factoryPtr)
        }

        return ToolTipService.__IToolTipServiceStatics.GetPlacement(element)
    }

    /**
     * Sets the [ToolTipService.Placement](tooltipservice_placement.md) XAML attached property value for the specified target element.
     * @remarks
     * This method supports the [ToolTipService.Placement](tooltipservice_placement.md) attached property usage for Extensible Application Markup Language (XAML). The target element is not necessarily a [ToolTip](tooltip.md), it might be an element that owns an inferred tooltip through usage of [ToolTipService](tooltipservice.md) APIs. Also, the target element is not necessarily the final placement target, because that can be reset by setting the [ToolTipService.PlacementTarget](tooltipservice_placement.md) attached property.
     * @param {DependencyObject} element The target element for the attached property value.
     * @param {Integer} value One of the [PlacementMode](../windows.ui.xaml.controls.primitives/placementmode.md) values, which specifies where the tooltip should appear relative to the control that is the placement target.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltipservice.setplacement
     */
    static SetPlacement(element, value) {
        if (!ToolTipService.HasProp("__IToolTipServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTipService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipServiceStatics.IID)
            ToolTipService.__IToolTipServiceStatics := IToolTipServiceStatics(factoryPtr)
        }

        return ToolTipService.__IToolTipServiceStatics.SetPlacement(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlacementTargetProperty() {
        if (!ToolTipService.HasProp("__IToolTipServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTipService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipServiceStatics.IID)
            ToolTipService.__IToolTipServiceStatics := IToolTipServiceStatics(factoryPtr)
        }

        return ToolTipService.__IToolTipServiceStatics.get_PlacementTargetProperty()
    }

    /**
     * Gets the [ToolTipService.PlacementTarget](tooltipservice_placementtarget.md) XAML attached property value for the specified target element.
     * @param {DependencyObject} element The target element for the attached property value.
     * @returns {UIElement} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltipservice.getplacementtarget
     */
    static GetPlacementTarget(element) {
        if (!ToolTipService.HasProp("__IToolTipServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTipService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipServiceStatics.IID)
            ToolTipService.__IToolTipServiceStatics := IToolTipServiceStatics(factoryPtr)
        }

        return ToolTipService.__IToolTipServiceStatics.GetPlacementTarget(element)
    }

    /**
     * Sets the [ToolTipService.PlacementTarget](tooltipservice_placementtarget.md) XAML attached property value for the specified target element.
     * @remarks
     * This method supports the [ToolTipService.PlacementTarget](tooltipservice_placementtarget.md) attached property usage for Extensible Application Markup Language (XAML). The value for *element* is not necessarily a [ToolTip](tooltip.md), it might be an element that owns an inferred tooltip through usage of [ToolTipService](tooltipservice.md) APIs. You can use the [ToolTipService.PlacementTarget](tooltipservice_placementtarget.md) attached property to set the placement target to be different than the element that owns the [ToolTip](tooltip.md) for purposes of UI behavior and built-in [PointerEntered](../windows.ui.xaml/uielement_pointerentered.md) / [PointerExited](../windows.ui.xaml/uielement_pointerexited.md) handling. This enables controls to act like a unit for tooltip display, so that the tooltip from one control does not obscure an important part of a related control when it displays.
     * @param {DependencyObject} element The target element for the attached property value.
     * @param {UIElement} value The visual element that should be the placement target for the tooltip.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltipservice.setplacementtarget
     */
    static SetPlacementTarget(element, value) {
        if (!ToolTipService.HasProp("__IToolTipServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTipService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipServiceStatics.IID)
            ToolTipService.__IToolTipServiceStatics := IToolTipServiceStatics(factoryPtr)
        }

        return ToolTipService.__IToolTipServiceStatics.SetPlacementTarget(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ToolTipProperty() {
        if (!ToolTipService.HasProp("__IToolTipServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTipService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipServiceStatics.IID)
            ToolTipService.__IToolTipServiceStatics := IToolTipServiceStatics(factoryPtr)
        }

        return ToolTipService.__IToolTipServiceStatics.get_ToolTipProperty()
    }

    /**
     * Gets the value of the [ToolTipService.ToolTip](tooltipservice_tooltip.md) XAML attached property for an object.
     * @param {DependencyObject} element The object from which the property value is read.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltipservice.gettooltip
     */
    static GetToolTip(element) {
        if (!ToolTipService.HasProp("__IToolTipServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTipService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipServiceStatics.IID)
            ToolTipService.__IToolTipServiceStatics := IToolTipServiceStatics(factoryPtr)
        }

        return ToolTipService.__IToolTipServiceStatics.GetToolTip(element)
    }

    /**
     * Sets the value of the [ToolTipService.ToolTip](tooltipservice_tooltip.md) XAML attached property.
     * @remarks
     * A [ToolTip](tooltip.md) must be assigned to another UI element that is its owner. In Extensible Application Markup Language (XAML), use the [ToolTipService.Tooltip](tooltipservice_tooltip.md) attached property to assign the [ToolTip](tooltip.md) to an owner. In code, use the ToolTipService.SetToolTip method to assign the [ToolTip](tooltip.md) to an owner.
     * 
     * See [ToolTipService.ToolTip](tooltipservice_tooltip.md) or [ToolTip](tooltip.md) to learn more about the object content or text that is appropriate to use as tooltip content.
     * @param {DependencyObject} element The object to set tooltip content on.
     * @param {IInspectable} value The value to set for tooltip content.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltipservice.settooltip
     */
    static SetToolTip(element, value) {
        if (!ToolTipService.HasProp("__IToolTipServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTipService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipServiceStatics.IID)
            ToolTipService.__IToolTipServiceStatics := IToolTipServiceStatics(factoryPtr)
        }

        return ToolTipService.__IToolTipServiceStatics.SetToolTip(element, value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
