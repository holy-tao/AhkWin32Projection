#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\IToolTip.ahk
#Include .\IToolTip2.ahk
#Include .\IToolTipStatics.ahk
#Include .\IToolTipFactory.ahk
#Include .\IToolTipStatics2.ahk
#Include ..\RoutedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\RoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a pop-up window for displaying information about an element in the UI.
 * @remarks
 * A tooltip is a popup that contains additional information about another control or object. Tooltips display automatically when the user moves focus to, presses and holds, or hovers the pointer over the associated control. The tooltip disappears when the user moves focus from, stops pressing on, or stops hovering the pointer over the associated control (unless the pointer is moving towards the tooltip).
 * 
 * > [!NOTE]
 * > Starting with Windows 11 version 21H2, a tooltip can also be dismissed by pressing the CTRL key.
 * 
 * Here's a ToolTip for a [Button](button.md).
 * 
 * <img alt="Tool tip control" src="images/controls/ToolTip.png" />
 * 
 * For design guidelines, see [Guidelines for tooltips](/windows/uwp/controls-and-patterns/tooltips).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltip
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ToolTip extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToolTip

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToolTip.IID

    /**
     * Identifies the [HorizontalOffset](tooltip_horizontaloffset.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltip.horizontaloffsetproperty
     * @type {DependencyProperty} 
     */
    static HorizontalOffsetProperty {
        get => ToolTip.get_HorizontalOffsetProperty()
    }

    /**
     * Identifies the [IsOpen](tooltip_isopen.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltip.isopenproperty
     * @type {DependencyProperty} 
     */
    static IsOpenProperty {
        get => ToolTip.get_IsOpenProperty()
    }

    /**
     * Identifies the [Placement](tooltip_placement.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltip.placementproperty
     * @type {DependencyProperty} 
     */
    static PlacementProperty {
        get => ToolTip.get_PlacementProperty()
    }

    /**
     * Identifies the [PlacementTarget](tooltip_placementtarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltip.placementtargetproperty
     * @type {DependencyProperty} 
     */
    static PlacementTargetProperty {
        get => ToolTip.get_PlacementTargetProperty()
    }

    /**
     * Identifies the [VerticalOffset](tooltip_verticaloffset.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltip.verticaloffsetproperty
     * @type {DependencyProperty} 
     */
    static VerticalOffsetProperty {
        get => ToolTip.get_VerticalOffsetProperty()
    }

    /**
     * Identifies the PlacementRect dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltip.placementrectproperty
     * @type {DependencyProperty} 
     */
    static PlacementRectProperty {
        get => ToolTip.get_PlacementRectProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalOffsetProperty() {
        if (!ToolTip.HasProp("__IToolTipStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTip")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipStatics.IID)
            ToolTip.__IToolTipStatics := IToolTipStatics(factoryPtr)
        }

        return ToolTip.__IToolTipStatics.get_HorizontalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsOpenProperty() {
        if (!ToolTip.HasProp("__IToolTipStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTip")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipStatics.IID)
            ToolTip.__IToolTipStatics := IToolTipStatics(factoryPtr)
        }

        return ToolTip.__IToolTipStatics.get_IsOpenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlacementProperty() {
        if (!ToolTip.HasProp("__IToolTipStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTip")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipStatics.IID)
            ToolTip.__IToolTipStatics := IToolTipStatics(factoryPtr)
        }

        return ToolTip.__IToolTipStatics.get_PlacementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlacementTargetProperty() {
        if (!ToolTip.HasProp("__IToolTipStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTip")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipStatics.IID)
            ToolTip.__IToolTipStatics := IToolTipStatics(factoryPtr)
        }

        return ToolTip.__IToolTipStatics.get_PlacementTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalOffsetProperty() {
        if (!ToolTip.HasProp("__IToolTipStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTip")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipStatics.IID)
            ToolTip.__IToolTipStatics := IToolTipStatics(factoryPtr)
        }

        return ToolTip.__IToolTipStatics.get_VerticalOffsetProperty()
    }

    /**
     * 
     * @returns {ToolTip} 
     */
    static CreateInstance() {
        if (!ToolTip.HasProp("__IToolTipFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTip")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipFactory.IID)
            ToolTip.__IToolTipFactory := IToolTipFactory(factoryPtr)
        }

        return ToolTip.__IToolTipFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlacementRectProperty() {
        if (!ToolTip.HasProp("__IToolTipStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToolTip")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToolTipStatics2.IID)
            ToolTip.__IToolTipStatics2 := IToolTipStatics2(factoryPtr)
        }

        return ToolTip.__IToolTipStatics2.get_PlacementRectProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the horizontal distance between the target origin and the pop-up alignment point.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltip.horizontaloffset
     * @type {Float} 
     */
    HorizontalOffset {
        get => this.get_HorizontalOffset()
        set => this.put_HorizontalOffset(value)
    }

    /**
     * Gets or sets a value that indicates whether the [ToolTip](tooltip.md) is visible.
     * @remarks
     * This property is not typically set in XAML.
     * 
     * A [ToolTip](tooltip.md) must be assigned to another UI element that is its owner. In XAML, use the [ToolTipService.Tooltip](/uwp/api/windows.ui.xaml.controls.tooltipservice.tooltip) attached property to assign the [ToolTip](tooltip.md) to an owner. In code, use the [ToolTipService.SetToolTip](tooltipservice_settooltip_1924909593.md) method to assign the [ToolTip](tooltip.md) to an owner. If you set the IsOpen property to **true** in your app code before the [ToolTip](tooltip.md) is assigned to an owner, an exception is thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltip.isopen
     * @type {Boolean} 
     */
    IsOpen {
        get => this.get_IsOpen()
        set => this.put_IsOpen(value)
    }

    /**
     * Gets or sets how a [ToolTip](tooltip.md) is positioned in relation to the placement target element.
     * @remarks
     * If there is no explicit [PlacementTarget](tooltip_placementtarget.md), the placement target for a [ToolTip](tooltip.md) is the element that specifies the [ToolTip](slider_isthumbtooltipenabled.md) as the value for its [TooltipService.ToolTip](/uwp/api/windows.ui.xaml.controls.tooltipservice.tooltip) attached property value, and any Placement value applies to that target.
     * 
     * Placement and [PlacementTarget](tooltip_placementtarget.md) are usually left as the defaults. The scenario for specifying either or both of these properties is if you are trying to avoid a case where the tooltip obscures the content it is referring to while the tooltip is displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltip.placement
     * @type {Integer} 
     */
    Placement {
        get => this.get_Placement()
        set => this.put_Placement(value)
    }

    /**
     * Gets or sets the visual element or control that the tool tip should be positioned in relation to when opened by the [ToolTipService](tooltipservice.md).
     * @remarks
     * If there is no explicit PlacementTarget, the placement target for a [ToolTip](tooltip.md) is the element that specifies the [ToolTip](slider_isthumbtooltipenabled.md) as the value for its [TooltipService.ToolTip](/uwp/api/windows.ui.xaml.controls.tooltipservice.tooltip) attached property value, and any [Placement](tooltip_placement.md) value applies to that target. The placement target determination is based on visual tree composition, and whether to display a tooltip at all is parallel to the target's hit test characteristics. A [Control](control.md) instance where [IsEnabled](control_isenabled.md) is false will not display a [ToolTip](tooltip.md).
     * 
     * [Placement](tooltip_placement.md) and PlacementTarget are usually left as the defaults. The scenario for specifying either or both of these properties is if you are trying to avoid a case where the tooltip obscures the content it is referring to while the tooltip is displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltip.placementtarget
     * @type {UIElement} 
     */
    PlacementTarget {
        get => this.get_PlacementTarget()
        set => this.put_PlacementTarget(value)
    }

    /**
     * Gets or sets the vertical distance between the target origin and the pop-up alignment point.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltip.verticaloffset
     * @type {Float} 
     */
    VerticalOffset {
        get => this.get_VerticalOffset()
        set => this.put_VerticalOffset(value)
    }

    /**
     * Gets an object that provides calculated values that can be referenced as **TemplateBinding** sources when defining templates for a [ToolTip](tooltip.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltip.templatesettings
     * @type {ToolTipTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * Gets or sets the rectangular area that the tooltip should be positioned in relation to when opened by the [ToolTipService](tooltipservice.md). If space allows, the open tooltip will not occlude the area defined by its PlacementRect.
     * @remarks
     * PlacementRect anchors the tooltip's position and also serves as an area that the opened tooltip will not occlude, provided there's sufficient space to draw tooltip outside this area. You can specify the origin of the rectangle relative to the tooltip's owner, and the height and width of the exclusion area. The [Placement](tooltip_placement.md) property will define if tooltip should draw above, below, left, or right of the PlacementRect.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.tooltip.placementrect
     * @type {IReference<RECT>} 
     */
    PlacementRect {
        get => this.get_PlacementRect()
        set => this.put_PlacementRect(value)
    }

    /**
     * Occurs when a [ToolTip](tooltip.md) is closed and is no longer visible.
     * @type {RoutedEventHandler}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

    /**
     * Occurs when a [ToolTip](tooltip.md) becomes visible.
     * @type {RoutedEventHandler}
    */
    OnOpened {
        get {
            if(!this.HasProp("__OnOpened")){
                this.__OnOpened := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnOpenedToken := this.add_Opened(this.__OnOpened.iface)
            }
            return this.__OnOpened
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        if(this.HasProp("__OnOpenedToken")) {
            this.remove_Opened(this.__OnOpenedToken)
            this.__OnOpened.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalOffset() {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.get_HorizontalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalOffset(value) {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.put_HorizontalOffset(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOpen() {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.get_IsOpen()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOpen(value) {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.put_IsOpen(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Placement() {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.get_Placement()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Placement(value) {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.put_Placement(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_PlacementTarget() {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.get_PlacementTarget()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_PlacementTarget(value) {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.put_PlacementTarget(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalOffset() {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.get_VerticalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_VerticalOffset(value) {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.put_VerticalOffset(value)
    }

    /**
     * 
     * @returns {ToolTipTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.get_TemplateSettings()
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.remove_Closed(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opened(handler) {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.add_Opened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Opened(token) {
        if (!this.HasProp("__IToolTip")) {
            if ((queryResult := this.QueryInterface(IToolTip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip := IToolTip(outPtr)
        }

        return this.__IToolTip.remove_Opened(token)
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_PlacementRect() {
        if (!this.HasProp("__IToolTip2")) {
            if ((queryResult := this.QueryInterface(IToolTip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip2 := IToolTip2(outPtr)
        }

        return this.__IToolTip2.get_PlacementRect()
    }

    /**
     * 
     * @param {IReference<RECT>} value 
     * @returns {HRESULT} 
     */
    put_PlacementRect(value) {
        if (!this.HasProp("__IToolTip2")) {
            if ((queryResult := this.QueryInterface(IToolTip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTip2 := IToolTip2(outPtr)
        }

        return this.__IToolTip2.put_PlacementRect(value)
    }

;@endregion Instance Methods
}
