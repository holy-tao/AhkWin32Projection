#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\ITwoPaneView.ahk
#Include .\ITwoPaneViewFactory.ahk
#Include .\ITwoPaneViewStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\TwoPaneView.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a container with two views that size and position content in the available space, either side-by-side or top-bottom.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TwoPaneView extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITwoPaneView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITwoPaneView.IID

    /**
     * Identifies the [Pane1](twopaneview_pane1.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.Pane1Property](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.pane1property) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.pane1property
     * @type {DependencyProperty} 
     */
    static Pane1Property {
        get => TwoPaneView.get_Pane1Property()
    }

    /**
     * Identifies the [Pane2](twopaneview_pane2.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.Pane2Property](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.pane2property) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.pane2property
     * @type {DependencyProperty} 
     */
    static Pane2Property {
        get => TwoPaneView.get_Pane2Property()
    }

    /**
     * Identifies the [Pane1Length](twopaneview_pane1length.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.Pane1LengthProperty](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.pane1lengthproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.pane1lengthproperty
     * @type {DependencyProperty} 
     */
    static Pane1LengthProperty {
        get => TwoPaneView.get_Pane1LengthProperty()
    }

    /**
     * Identifies the [Pane2Length](twopaneview_pane2length.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.Pane2LengthProperty](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.pane2lengthproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.pane2lengthproperty
     * @type {DependencyProperty} 
     */
    static Pane2LengthProperty {
        get => TwoPaneView.get_Pane2LengthProperty()
    }

    /**
     * Identifies the [PanePriority](twopaneview_panepriority.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.PanePriorityProperty](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.panepriorityproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.panepriorityproperty
     * @type {DependencyProperty} 
     */
    static PanePriorityProperty {
        get => TwoPaneView.get_PanePriorityProperty()
    }

    /**
     * Identifies the [Mode](twopaneview_mode.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.ModeProperty](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.modeproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.modeproperty
     * @type {DependencyProperty} 
     */
    static ModeProperty {
        get => TwoPaneView.get_ModeProperty()
    }

    /**
     * Identifies the [WideModeConfiguration](twopaneview_widemodeconfiguration.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.WideModeConfigurationProperty](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.widemodeconfigurationproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.widemodeconfigurationproperty
     * @type {DependencyProperty} 
     */
    static WideModeConfigurationProperty {
        get => TwoPaneView.get_WideModeConfigurationProperty()
    }

    /**
     * Identifies the [TallModeConfiguration](twopaneview_tallmodeconfiguration.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.TallModeConfigurationProperty](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.tallmodeconfigurationproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.tallmodeconfigurationproperty
     * @type {DependencyProperty} 
     */
    static TallModeConfigurationProperty {
        get => TwoPaneView.get_TallModeConfigurationProperty()
    }

    /**
     * Identifies the [MinWideModeWidth](twopaneview_minwidemodewidth.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.MinWideModeWidthProperty](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.minwidemodewidthproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.minwidemodewidthproperty
     * @type {DependencyProperty} 
     */
    static MinWideModeWidthProperty {
        get => TwoPaneView.get_MinWideModeWidthProperty()
    }

    /**
     * Identifies the [MinTallModeHeight](twopaneview_mintallmodeheight.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.MinTallModeHeightProperty](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.mintallmodeheightproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.mintallmodeheightproperty
     * @type {DependencyProperty} 
     */
    static MinTallModeHeightProperty {
        get => TwoPaneView.get_MinTallModeHeightProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {TwoPaneView} 
     */
    static CreateInstance() {
        if (!TwoPaneView.HasProp("__ITwoPaneViewFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TwoPaneView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITwoPaneViewFactory.IID)
            TwoPaneView.__ITwoPaneViewFactory := ITwoPaneViewFactory(factoryPtr)
        }

        return TwoPaneView.__ITwoPaneViewFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Pane1Property() {
        if (!TwoPaneView.HasProp("__ITwoPaneViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TwoPaneView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITwoPaneViewStatics.IID)
            TwoPaneView.__ITwoPaneViewStatics := ITwoPaneViewStatics(factoryPtr)
        }

        return TwoPaneView.__ITwoPaneViewStatics.get_Pane1Property()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Pane2Property() {
        if (!TwoPaneView.HasProp("__ITwoPaneViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TwoPaneView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITwoPaneViewStatics.IID)
            TwoPaneView.__ITwoPaneViewStatics := ITwoPaneViewStatics(factoryPtr)
        }

        return TwoPaneView.__ITwoPaneViewStatics.get_Pane2Property()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Pane1LengthProperty() {
        if (!TwoPaneView.HasProp("__ITwoPaneViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TwoPaneView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITwoPaneViewStatics.IID)
            TwoPaneView.__ITwoPaneViewStatics := ITwoPaneViewStatics(factoryPtr)
        }

        return TwoPaneView.__ITwoPaneViewStatics.get_Pane1LengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Pane2LengthProperty() {
        if (!TwoPaneView.HasProp("__ITwoPaneViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TwoPaneView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITwoPaneViewStatics.IID)
            TwoPaneView.__ITwoPaneViewStatics := ITwoPaneViewStatics(factoryPtr)
        }

        return TwoPaneView.__ITwoPaneViewStatics.get_Pane2LengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PanePriorityProperty() {
        if (!TwoPaneView.HasProp("__ITwoPaneViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TwoPaneView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITwoPaneViewStatics.IID)
            TwoPaneView.__ITwoPaneViewStatics := ITwoPaneViewStatics(factoryPtr)
        }

        return TwoPaneView.__ITwoPaneViewStatics.get_PanePriorityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ModeProperty() {
        if (!TwoPaneView.HasProp("__ITwoPaneViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TwoPaneView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITwoPaneViewStatics.IID)
            TwoPaneView.__ITwoPaneViewStatics := ITwoPaneViewStatics(factoryPtr)
        }

        return TwoPaneView.__ITwoPaneViewStatics.get_ModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_WideModeConfigurationProperty() {
        if (!TwoPaneView.HasProp("__ITwoPaneViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TwoPaneView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITwoPaneViewStatics.IID)
            TwoPaneView.__ITwoPaneViewStatics := ITwoPaneViewStatics(factoryPtr)
        }

        return TwoPaneView.__ITwoPaneViewStatics.get_WideModeConfigurationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TallModeConfigurationProperty() {
        if (!TwoPaneView.HasProp("__ITwoPaneViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TwoPaneView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITwoPaneViewStatics.IID)
            TwoPaneView.__ITwoPaneViewStatics := ITwoPaneViewStatics(factoryPtr)
        }

        return TwoPaneView.__ITwoPaneViewStatics.get_TallModeConfigurationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinWideModeWidthProperty() {
        if (!TwoPaneView.HasProp("__ITwoPaneViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TwoPaneView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITwoPaneViewStatics.IID)
            TwoPaneView.__ITwoPaneViewStatics := ITwoPaneViewStatics(factoryPtr)
        }

        return TwoPaneView.__ITwoPaneViewStatics.get_MinWideModeWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinTallModeHeightProperty() {
        if (!TwoPaneView.HasProp("__ITwoPaneViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TwoPaneView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITwoPaneViewStatics.IID)
            TwoPaneView.__ITwoPaneViewStatics := ITwoPaneViewStatics(factoryPtr)
        }

        return TwoPaneView.__ITwoPaneViewStatics.get_MinTallModeHeightProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the content of pane 1.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.Pane1](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.pane1) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.pane1
     * @type {UIElement} 
     */
    Pane1 {
        get => this.get_Pane1()
        set => this.put_Pane1(value)
    }

    /**
     * Gets or sets the content of pane 2.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.Pane2](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.pane2) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.pane2
     * @type {UIElement} 
     */
    Pane2 {
        get => this.get_Pane2()
        set => this.put_Pane2(value)
    }

    /**
     * Gets the calculated width (in wide mode) or height (in tall mode) of pane 1, or sets the GridLength value of pane 1.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.Pane1Length](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.pane1length) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.pane1length
     * @type {GridLength} 
     */
    Pane1Length {
        get => this.get_Pane1Length()
        set => this.put_Pane1Length(value)
    }

    /**
     * Gets the calculated width (in wide mode) or height (in tall mode) of pane 2, or sets the GridLength value of pane 2.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.Pane2Length](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.pane2length) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.pane2length
     * @type {GridLength} 
     */
    Pane2Length {
        get => this.get_Pane2Length()
        set => this.put_Pane2Length(value)
    }

    /**
     * Gets or sets a value that indicates which pane has priority.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.PanePriority](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.panepriority) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.panepriority
     * @type {Integer} 
     */
    PanePriority {
        get => this.get_PanePriority()
        set => this.put_PanePriority(value)
    }

    /**
     * Gets a value that indicates how panes are shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.Mode](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.mode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
    }

    /**
     * Gets or sets a value that indicates how panes are shown in wide mode.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.WideModeConfiguration](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.widemodeconfiguration) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.widemodeconfiguration
     * @type {Integer} 
     */
    WideModeConfiguration {
        get => this.get_WideModeConfiguration()
        set => this.put_WideModeConfiguration(value)
    }

    /**
     * Gets or sets a value that indicates how panes are shown in tall mode.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.TallModeConfiguration](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.tallmodeconfiguration) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.tallmodeconfiguration
     * @type {Integer} 
     */
    TallModeConfiguration {
        get => this.get_TallModeConfiguration()
        set => this.put_TallModeConfiguration(value)
    }

    /**
     * Gets or sets the minimum width at which panes are shown in wide mode.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.MinWideModeWidth](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.minwidemodewidth) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.minwidemodewidth
     * @type {Float} 
     */
    MinWideModeWidth {
        get => this.get_MinWideModeWidth()
        set => this.put_MinWideModeWidth(value)
    }

    /**
     * Gets or sets the minimum height at which panes are shown in tall mode.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.MinTallModeHeight](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.mintallmodeheight) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneview.mintallmodeheight
     * @type {Float} 
     */
    MinTallModeHeight {
        get => this.get_MinTallModeHeight()
        set => this.put_MinTallModeHeight(value)
    }

    /**
     * Occurs when the Mode of the TwoPaneView has changed.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneView.ModeChanged](/windows/winui/api/microsoft.ui.xaml.controls.twopaneview.modechanged) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<TwoPaneView, IInspectable>}
    */
    OnModeChanged {
        get {
            if(!this.HasProp("__OnModeChanged")){
                this.__OnModeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{223d4a57-90c5-5f74-8baf-9250b030bd35}"),
                    TwoPaneView,
                    IInspectable
                )
                this.__OnModeChangedToken := this.add_ModeChanged(this.__OnModeChanged.iface)
            }
            return this.__OnModeChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnModeChangedToken")) {
            this.remove_ModeChanged(this.__OnModeChangedToken)
            this.__OnModeChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Pane1() {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.get_Pane1()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Pane1(value) {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.put_Pane1(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Pane2() {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.get_Pane2()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Pane2(value) {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.put_Pane2(value)
    }

    /**
     * 
     * @returns {GridLength} 
     */
    get_Pane1Length() {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.get_Pane1Length()
    }

    /**
     * 
     * @param {GridLength} value 
     * @returns {HRESULT} 
     */
    put_Pane1Length(value) {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.put_Pane1Length(value)
    }

    /**
     * 
     * @returns {GridLength} 
     */
    get_Pane2Length() {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.get_Pane2Length()
    }

    /**
     * 
     * @param {GridLength} value 
     * @returns {HRESULT} 
     */
    put_Pane2Length(value) {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.put_Pane2Length(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PanePriority() {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.get_PanePriority()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PanePriority(value) {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.put_PanePriority(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.get_Mode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WideModeConfiguration() {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.get_WideModeConfiguration()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_WideModeConfiguration(value) {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.put_WideModeConfiguration(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TallModeConfiguration() {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.get_TallModeConfiguration()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TallModeConfiguration(value) {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.put_TallModeConfiguration(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinWideModeWidth() {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.get_MinWideModeWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinWideModeWidth(value) {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.put_MinWideModeWidth(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinTallModeHeight() {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.get_MinTallModeHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinTallModeHeight(value) {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.put_MinTallModeHeight(value)
    }

    /**
     * 
     * @param {TypedEventHandler<TwoPaneView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ModeChanged(handler) {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.add_ModeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ModeChanged(token) {
        if (!this.HasProp("__ITwoPaneView")) {
            if ((queryResult := this.QueryInterface(ITwoPaneView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPaneView := ITwoPaneView(outPtr)
        }

        return this.__ITwoPaneView.remove_ModeChanged(token)
    }

;@endregion Instance Methods
}
