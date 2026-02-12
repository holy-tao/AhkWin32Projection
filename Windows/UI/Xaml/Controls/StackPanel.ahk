#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Panel.ahk
#Include .\IStackPanel.ahk
#Include .\IStackPanel2.ahk
#Include .\IStackPanel4.ahk
#Include .\IStackPanel5.ahk
#Include Primitives\IScrollSnapPointsInfo.ahk
#Include .\IInsertionPanel.ahk
#Include .\IStackPanelStatics5.ahk
#Include .\IStackPanelStatics4.ahk
#Include .\IStackPanelStatics.ahk
#Include .\IStackPanelFactory.ahk
#Include .\IStackPanelStatics2.ahk
#Include ..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Arranges child elements into a single line that can be oriented horizontally or vertically.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Layout panels](/windows/uwp/design/layout/layout-panels#stackpanel).
 * 
 * StackPanel is a layout panel that arranges child elements into a single line that can be oriented horizontally or vertically.
 * 
 * :::image type="content" source="images/controls/StackPanel.png" alt-text="StackPanel layout control":::
 * 
 * By default, StackPanel stacks items vertically from top to bottom in the order they are declared. You can set the [Orientation](stackpanel_orientation.md) property to **Horizontal** to stack items from left to right.
 * 
 * You can insert items into a StackPanel at a specific location using the [InsertAt](uielementcollection_insertat_1232866588.md) method in code-behind.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class StackPanel extends Panel {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStackPanel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStackPanel.IID

    /**
     * Identifies the BackgroundSizing dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.backgroundsizingproperty
     * @type {DependencyProperty} 
     */
    static BackgroundSizingProperty {
        get => StackPanel.get_BackgroundSizingProperty()
    }

    /**
     * Identifies the Spacing dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.spacingproperty
     * @type {DependencyProperty} 
     */
    static SpacingProperty {
        get => StackPanel.get_SpacingProperty()
    }

    /**
     * Identifies the AreScrollSnapPointsRegular dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.arescrollsnappointsregularproperty
     * @type {DependencyProperty} 
     */
    static AreScrollSnapPointsRegularProperty {
        get => StackPanel.get_AreScrollSnapPointsRegularProperty()
    }

    /**
     * Identifies the [Orientation](stackpanel_orientation.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.orientationproperty
     * @type {DependencyProperty} 
     */
    static OrientationProperty {
        get => StackPanel.get_OrientationProperty()
    }

    /**
     * Identifies the [BorderBrush](stackpanel_borderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.borderbrushproperty
     * @type {DependencyProperty} 
     */
    static BorderBrushProperty {
        get => StackPanel.get_BorderBrushProperty()
    }

    /**
     * Identifies the [BorderThickness](stackpanel_borderthickness.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.borderthicknessproperty
     * @type {DependencyProperty} 
     */
    static BorderThicknessProperty {
        get => StackPanel.get_BorderThicknessProperty()
    }

    /**
     * Identifies the [CornerRadius](stackpanel_cornerradius.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.cornerradiusproperty
     * @type {DependencyProperty} 
     */
    static CornerRadiusProperty {
        get => StackPanel.get_CornerRadiusProperty()
    }

    /**
     * Identifies the [Padding](stackpanel_padding.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.paddingproperty
     * @type {DependencyProperty} 
     */
    static PaddingProperty {
        get => StackPanel.get_PaddingProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackgroundSizingProperty() {
        if (!StackPanel.HasProp("__IStackPanelStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.StackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStackPanelStatics5.IID)
            StackPanel.__IStackPanelStatics5 := IStackPanelStatics5(factoryPtr)
        }

        return StackPanel.__IStackPanelStatics5.get_BackgroundSizingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SpacingProperty() {
        if (!StackPanel.HasProp("__IStackPanelStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.StackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStackPanelStatics4.IID)
            StackPanel.__IStackPanelStatics4 := IStackPanelStatics4(factoryPtr)
        }

        return StackPanel.__IStackPanelStatics4.get_SpacingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AreScrollSnapPointsRegularProperty() {
        if (!StackPanel.HasProp("__IStackPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.StackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStackPanelStatics.IID)
            StackPanel.__IStackPanelStatics := IStackPanelStatics(factoryPtr)
        }

        return StackPanel.__IStackPanelStatics.get_AreScrollSnapPointsRegularProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OrientationProperty() {
        if (!StackPanel.HasProp("__IStackPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.StackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStackPanelStatics.IID)
            StackPanel.__IStackPanelStatics := IStackPanelStatics(factoryPtr)
        }

        return StackPanel.__IStackPanelStatics.get_OrientationProperty()
    }

    /**
     * 
     * @returns {StackPanel} 
     */
    static CreateInstance() {
        if (!StackPanel.HasProp("__IStackPanelFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.StackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStackPanelFactory.IID)
            StackPanel.__IStackPanelFactory := IStackPanelFactory(factoryPtr)
        }

        return StackPanel.__IStackPanelFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BorderBrushProperty() {
        if (!StackPanel.HasProp("__IStackPanelStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.StackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStackPanelStatics2.IID)
            StackPanel.__IStackPanelStatics2 := IStackPanelStatics2(factoryPtr)
        }

        return StackPanel.__IStackPanelStatics2.get_BorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BorderThicknessProperty() {
        if (!StackPanel.HasProp("__IStackPanelStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.StackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStackPanelStatics2.IID)
            StackPanel.__IStackPanelStatics2 := IStackPanelStatics2(factoryPtr)
        }

        return StackPanel.__IStackPanelStatics2.get_BorderThicknessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CornerRadiusProperty() {
        if (!StackPanel.HasProp("__IStackPanelStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.StackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStackPanelStatics2.IID)
            StackPanel.__IStackPanelStatics2 := IStackPanelStatics2(factoryPtr)
        }

        return StackPanel.__IStackPanelStatics2.get_CornerRadiusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaddingProperty() {
        if (!StackPanel.HasProp("__IStackPanelStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.StackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStackPanelStatics2.IID)
            StackPanel.__IStackPanelStatics2 := IStackPanelStatics2(factoryPtr)
        }

        return StackPanel.__IStackPanelStatics2.get_PaddingProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the generated snap points used for panning in the [StackPanel](stackpanel.md) are equidistant from each other.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.arescrollsnappointsregular
     * @type {Boolean} 
     */
    AreScrollSnapPointsRegular {
        get => this.get_AreScrollSnapPointsRegular()
        set => this.put_AreScrollSnapPointsRegular(value)
    }

    /**
     * Gets or sets the dimension by which child elements are stacked.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets a brush that describes the border fill of the panel.
     * @remarks
     * The [BorderThickness](stackpanel_borderthickness.md) value must be greater than 0 in order to see the BorderBrush value take effect.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.borderbrush
     * @type {Brush} 
     */
    BorderBrush {
        get => this.get_BorderBrush()
        set => this.put_BorderBrush(value)
    }

    /**
     * Gets or sets the border thickness of the panel.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.borderthickness
     * @type {Thickness} 
     */
    BorderThickness {
        get => this.get_BorderThickness()
        set => this.put_BorderThickness(value)
    }

    /**
     * Gets or sets the radius for the corners of the panel's border.
     * @remarks
     * Member components of a [CornerRadius](../windows.ui.xaml/cornerradius.md) value cannot be negative.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.cornerradius
     * @type {CornerRadius} 
     */
    CornerRadius {
        get => this.get_CornerRadius()
        set => this.put_CornerRadius(value)
    }

    /**
     * Gets or sets the distance between the border and its child object.
     * @remarks
     * A related property is [Margin](../windows.ui.xaml/frameworkelement_margin.md) (a property of [FrameworkElement](../windows.ui.xaml/frameworkelement.md)). For more info about the relationship between margin and padding, see [Alignment, margin, and padding](/windows/uwp/layout/alignment-margin-padding) or [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.padding
     * @type {Thickness} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * Gets or sets a uniform distance (in pixels) between stacked items. It is applied in the direction of the StackPanel's Orientation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.spacing
     * @type {Float} 
     */
    Spacing {
        get => this.get_Spacing()
        set => this.put_Spacing(value)
    }

    /**
     * Gets or sets a value that indicates how far the background extends in relation to this element's border.
     * @remarks
     * You can set this property to **OuterBorderEdge** to make the element's background extend under the border. If the border is transparent, the background will show through it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.backgroundsizing
     * @type {Integer} 
     */
    BackgroundSizing {
        get => this.get_BackgroundSizing()
        set => this.put_BackgroundSizing(value)
    }

    /**
     * Gets a value that indicates whether the horizontal snap points for the [StackPanel](stackpanel.md) are equidistant from each other.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.arehorizontalsnappointsregular
     * @type {Boolean} 
     */
    AreHorizontalSnapPointsRegular {
        get => this.get_AreHorizontalSnapPointsRegular()
    }

    /**
     * Gets a value that indicates whether the vertical snap points for the [StackPanel](stackpanel.md) are equidistant from each other.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.areverticalsnappointsregular
     * @type {Boolean} 
     */
    AreVerticalSnapPointsRegular {
        get => this.get_AreVerticalSnapPointsRegular()
    }

    /**
     * Occurs when the measurements for horizontal snap points change.
     * @type {EventHandler<IInspectable>}
    */
    OnHorizontalSnapPointsChanged {
        get {
            if(!this.HasProp("__OnHorizontalSnapPointsChanged")){
                this.__OnHorizontalSnapPointsChanged := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnHorizontalSnapPointsChangedToken := this.add_HorizontalSnapPointsChanged(this.__OnHorizontalSnapPointsChanged.iface)
            }
            return this.__OnHorizontalSnapPointsChanged
        }
    }

    /**
     * Occurs when the measurements for vertical snap points change.
     * @type {EventHandler<IInspectable>}
    */
    OnVerticalSnapPointsChanged {
        get {
            if(!this.HasProp("__OnVerticalSnapPointsChanged")){
                this.__OnVerticalSnapPointsChanged := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnVerticalSnapPointsChangedToken := this.add_VerticalSnapPointsChanged(this.__OnVerticalSnapPointsChanged.iface)
            }
            return this.__OnVerticalSnapPointsChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnHorizontalSnapPointsChangedToken")) {
            this.remove_HorizontalSnapPointsChanged(this.__OnHorizontalSnapPointsChangedToken)
            this.__OnHorizontalSnapPointsChanged.iface.Dispose()
        }

        if(this.HasProp("__OnVerticalSnapPointsChangedToken")) {
            this.remove_VerticalSnapPointsChanged(this.__OnVerticalSnapPointsChangedToken)
            this.__OnVerticalSnapPointsChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreScrollSnapPointsRegular() {
        if (!this.HasProp("__IStackPanel")) {
            if ((queryResult := this.QueryInterface(IStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel := IStackPanel(outPtr)
        }

        return this.__IStackPanel.get_AreScrollSnapPointsRegular()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AreScrollSnapPointsRegular(value) {
        if (!this.HasProp("__IStackPanel")) {
            if ((queryResult := this.QueryInterface(IStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel := IStackPanel(outPtr)
        }

        return this.__IStackPanel.put_AreScrollSnapPointsRegular(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IStackPanel")) {
            if ((queryResult := this.QueryInterface(IStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel := IStackPanel(outPtr)
        }

        return this.__IStackPanel.get_Orientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IStackPanel")) {
            if ((queryResult := this.QueryInterface(IStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel := IStackPanel(outPtr)
        }

        return this.__IStackPanel.put_Orientation(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BorderBrush() {
        if (!this.HasProp("__IStackPanel2")) {
            if ((queryResult := this.QueryInterface(IStackPanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel2 := IStackPanel2(outPtr)
        }

        return this.__IStackPanel2.get_BorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_BorderBrush(value) {
        if (!this.HasProp("__IStackPanel2")) {
            if ((queryResult := this.QueryInterface(IStackPanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel2 := IStackPanel2(outPtr)
        }

        return this.__IStackPanel2.put_BorderBrush(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_BorderThickness() {
        if (!this.HasProp("__IStackPanel2")) {
            if ((queryResult := this.QueryInterface(IStackPanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel2 := IStackPanel2(outPtr)
        }

        return this.__IStackPanel2.get_BorderThickness()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_BorderThickness(value) {
        if (!this.HasProp("__IStackPanel2")) {
            if ((queryResult := this.QueryInterface(IStackPanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel2 := IStackPanel2(outPtr)
        }

        return this.__IStackPanel2.put_BorderThickness(value)
    }

    /**
     * 
     * @returns {CornerRadius} 
     */
    get_CornerRadius() {
        if (!this.HasProp("__IStackPanel2")) {
            if ((queryResult := this.QueryInterface(IStackPanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel2 := IStackPanel2(outPtr)
        }

        return this.__IStackPanel2.get_CornerRadius()
    }

    /**
     * 
     * @param {CornerRadius} value 
     * @returns {HRESULT} 
     */
    put_CornerRadius(value) {
        if (!this.HasProp("__IStackPanel2")) {
            if ((queryResult := this.QueryInterface(IStackPanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel2 := IStackPanel2(outPtr)
        }

        return this.__IStackPanel2.put_CornerRadius(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Padding() {
        if (!this.HasProp("__IStackPanel2")) {
            if ((queryResult := this.QueryInterface(IStackPanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel2 := IStackPanel2(outPtr)
        }

        return this.__IStackPanel2.get_Padding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Padding(value) {
        if (!this.HasProp("__IStackPanel2")) {
            if ((queryResult := this.QueryInterface(IStackPanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel2 := IStackPanel2(outPtr)
        }

        return this.__IStackPanel2.put_Padding(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Spacing() {
        if (!this.HasProp("__IStackPanel4")) {
            if ((queryResult := this.QueryInterface(IStackPanel4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel4 := IStackPanel4(outPtr)
        }

        return this.__IStackPanel4.get_Spacing()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Spacing(value) {
        if (!this.HasProp("__IStackPanel4")) {
            if ((queryResult := this.QueryInterface(IStackPanel4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel4 := IStackPanel4(outPtr)
        }

        return this.__IStackPanel4.put_Spacing(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackgroundSizing() {
        if (!this.HasProp("__IStackPanel5")) {
            if ((queryResult := this.QueryInterface(IStackPanel5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel5 := IStackPanel5(outPtr)
        }

        return this.__IStackPanel5.get_BackgroundSizing()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BackgroundSizing(value) {
        if (!this.HasProp("__IStackPanel5")) {
            if ((queryResult := this.QueryInterface(IStackPanel5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStackPanel5 := IStackPanel5(outPtr)
        }

        return this.__IStackPanel5.put_BackgroundSizing(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreHorizontalSnapPointsRegular() {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.get_AreHorizontalSnapPointsRegular()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreVerticalSnapPointsRegular() {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.get_AreVerticalSnapPointsRegular()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HorizontalSnapPointsChanged(handler) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.add_HorizontalSnapPointsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HorizontalSnapPointsChanged(token) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.remove_HorizontalSnapPointsChanged(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VerticalSnapPointsChanged(handler) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.add_VerticalSnapPointsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VerticalSnapPointsChanged(token) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.remove_VerticalSnapPointsChanged(token)
    }

    /**
     * Returns the set of distances between irregular snap points for a specified orientation and alignment.
     * @param {Integer} orientation_ The orientation (dimension) for the desired snap point set.
     * @param {Integer} alignment The alignment to use when applying the snap points.
     * @returns {IVectorView<Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.getirregularsnappoints
     */
    GetIrregularSnapPoints(orientation_, alignment) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.GetIrregularSnapPoints(orientation_, alignment)
    }

    /**
     * Gets the distance between regular snap points for a specified orientation and alignment.
     * @param {Integer} orientation_ The orientation/dimension for the desired snap point set.
     * @param {Integer} alignment The alignment to use when applying the snap points.
     * @param {Pointer<Single>} offset Out parameter. The offset of the first snap point.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.getregularsnappoints
     */
    GetRegularSnapPoints(orientation_, alignment, offset) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.GetRegularSnapPoints(orientation_, alignment, offset)
    }

    /**
     * Returns the index values of the items that the specified point is between.
     * @remarks
     * Call this method when handling a [DragOver](../windows.ui.xaml/uielement_dragover.md) event to return the indices of the two items between which the [DragOver](../windows.ui.xaml/uielement_dragover.md) is happening and where a potential drop and insertion would happen.
     * @param {POINT} position The point for which to get insertion indexes.
     * @param {Pointer<Int32>} first The index of the item before the specified point.
     * @param {Pointer<Int32>} second The index of the item after the specified point.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stackpanel.getinsertionindexes
     */
    GetInsertionIndexes(position, first, second) {
        if (!this.HasProp("__IInsertionPanel")) {
            if ((queryResult := this.QueryInterface(IInsertionPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInsertionPanel := IInsertionPanel(outPtr)
        }

        return this.__IInsertionPanel.GetInsertionIndexes(position, first, second)
    }

;@endregion Instance Methods
}
