#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IRefreshVisualizer.ahk
#Include .\IRefreshVisualizerStatics.ahk
#Include .\IRefreshVisualizerFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\RefreshVisualizer.ahk
#Include .\RefreshRequestedEventArgs.ahk
#Include .\RefreshStateChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that provides animated state indicators for content refresh.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshVisualizer](/windows/winui/api/microsoft.ui.xaml.controls.refreshvisualizer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshvisualizer
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RefreshVisualizer extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRefreshVisualizer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRefreshVisualizer.IID

    /**
     * Identifies the InfoProvider dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshVisualizer.InfoProviderProperty](/windows/winui/api/microsoft.ui.xaml.controls.refreshvisualizer.infoproviderproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshvisualizer.infoproviderproperty
     * @type {DependencyProperty} 
     */
    static InfoProviderProperty {
        get => RefreshVisualizer.get_InfoProviderProperty()
    }

    /**
     * Identifies the Orientation dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshVisualizer.OrientationProperty](/windows/winui/api/microsoft.ui.xaml.controls.refreshvisualizer.orientationproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshvisualizer.orientationproperty
     * @type {DependencyProperty} 
     */
    static OrientationProperty {
        get => RefreshVisualizer.get_OrientationProperty()
    }

    /**
     * Identifies the Content dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshVisualizer.ContentProperty](/windows/winui/api/microsoft.ui.xaml.controls.refreshvisualizer.contentproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshvisualizer.contentproperty
     * @type {DependencyProperty} 
     */
    static ContentProperty {
        get => RefreshVisualizer.get_ContentProperty()
    }

    /**
     * Identifies the State dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshVisualizer.StateProperty](/windows/winui/api/microsoft.ui.xaml.controls.refreshvisualizer.stateproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshvisualizer.stateproperty
     * @type {DependencyProperty} 
     */
    static StateProperty {
        get => RefreshVisualizer.get_StateProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_InfoProviderProperty() {
        if (!RefreshVisualizer.HasProp("__IRefreshVisualizerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RefreshVisualizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRefreshVisualizerStatics.IID)
            RefreshVisualizer.__IRefreshVisualizerStatics := IRefreshVisualizerStatics(factoryPtr)
        }

        return RefreshVisualizer.__IRefreshVisualizerStatics.get_InfoProviderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OrientationProperty() {
        if (!RefreshVisualizer.HasProp("__IRefreshVisualizerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RefreshVisualizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRefreshVisualizerStatics.IID)
            RefreshVisualizer.__IRefreshVisualizerStatics := IRefreshVisualizerStatics(factoryPtr)
        }

        return RefreshVisualizer.__IRefreshVisualizerStatics.get_OrientationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentProperty() {
        if (!RefreshVisualizer.HasProp("__IRefreshVisualizerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RefreshVisualizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRefreshVisualizerStatics.IID)
            RefreshVisualizer.__IRefreshVisualizerStatics := IRefreshVisualizerStatics(factoryPtr)
        }

        return RefreshVisualizer.__IRefreshVisualizerStatics.get_ContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StateProperty() {
        if (!RefreshVisualizer.HasProp("__IRefreshVisualizerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RefreshVisualizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRefreshVisualizerStatics.IID)
            RefreshVisualizer.__IRefreshVisualizerStatics := IRefreshVisualizerStatics(factoryPtr)
        }

        return RefreshVisualizer.__IRefreshVisualizerStatics.get_StateProperty()
    }

    /**
     * 
     * @returns {RefreshVisualizer} 
     */
    static CreateInstance() {
        if (!RefreshVisualizer.HasProp("__IRefreshVisualizerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RefreshVisualizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRefreshVisualizerFactory.IID)
            RefreshVisualizer.__IRefreshVisualizerFactory := IRefreshVisualizerFactory(factoryPtr)
        }

        return RefreshVisualizer.__IRefreshVisualizerFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates the orientation of the visualizer.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshVisualizer.Orientation](/windows/winui/api/microsoft.ui.xaml.controls.refreshvisualizer.orientation) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshvisualizer.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets the content of the visualizer.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshVisualizer.Content](/windows/winui/api/microsoft.ui.xaml.controls.refreshvisualizer.content) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshvisualizer.content
     * @type {UIElement} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Gets a value that indicates the state of the visualizer.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshVisualizer.State](/windows/winui/api/microsoft.ui.xaml.controls.refreshvisualizer.state) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshvisualizer.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Occurs when an update of the content has been initiated.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshVisualizer.RefreshRequested](/windows/winui/api/microsoft.ui.xaml.controls.refreshvisualizer.refreshrequested) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<RefreshVisualizer, RefreshRequestedEventArgs>}
    */
    OnRefreshRequested {
        get {
            if(!this.HasProp("__OnRefreshRequested")){
                this.__OnRefreshRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3a0bc0e0-6fc3-5489-abec-eb96176dd3a7}"),
                    RefreshVisualizer,
                    RefreshRequestedEventArgs
                )
                this.__OnRefreshRequestedToken := this.add_RefreshRequested(this.__OnRefreshRequested.iface)
            }
            return this.__OnRefreshRequested
        }
    }

    /**
     * Occurs when the state of the visualizer changes.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshVisualizer.RefreshStateChanged](/windows/winui/api/microsoft.ui.xaml.controls.refreshvisualizer.refreshstatechanged) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<RefreshVisualizer, RefreshStateChangedEventArgs>}
    */
    OnRefreshStateChanged {
        get {
            if(!this.HasProp("__OnRefreshStateChanged")){
                this.__OnRefreshStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{20110ea9-4b08-5242-b485-22112fe93e20}"),
                    RefreshVisualizer,
                    RefreshStateChangedEventArgs
                )
                this.__OnRefreshStateChangedToken := this.add_RefreshStateChanged(this.__OnRefreshStateChanged.iface)
            }
            return this.__OnRefreshStateChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnRefreshRequestedToken")) {
            this.remove_RefreshRequested(this.__OnRefreshRequestedToken)
            this.__OnRefreshRequested.iface.Dispose()
        }

        if(this.HasProp("__OnRefreshStateChangedToken")) {
            this.remove_RefreshStateChanged(this.__OnRefreshStateChangedToken)
            this.__OnRefreshStateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Initiates an update of the content.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshVisualizer.RequestRefresh](/windows/winui/api/microsoft.ui.xaml.controls.refreshvisualizer.requestrefresh) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshvisualizer.requestrefresh
     */
    RequestRefresh() {
        if (!this.HasProp("__IRefreshVisualizer")) {
            if ((queryResult := this.QueryInterface(IRefreshVisualizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshVisualizer := IRefreshVisualizer(outPtr)
        }

        return this.__IRefreshVisualizer.RequestRefresh()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IRefreshVisualizer")) {
            if ((queryResult := this.QueryInterface(IRefreshVisualizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshVisualizer := IRefreshVisualizer(outPtr)
        }

        return this.__IRefreshVisualizer.get_Orientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IRefreshVisualizer")) {
            if ((queryResult := this.QueryInterface(IRefreshVisualizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshVisualizer := IRefreshVisualizer(outPtr)
        }

        return this.__IRefreshVisualizer.put_Orientation(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Content() {
        if (!this.HasProp("__IRefreshVisualizer")) {
            if ((queryResult := this.QueryInterface(IRefreshVisualizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshVisualizer := IRefreshVisualizer(outPtr)
        }

        return this.__IRefreshVisualizer.get_Content()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__IRefreshVisualizer")) {
            if ((queryResult := this.QueryInterface(IRefreshVisualizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshVisualizer := IRefreshVisualizer(outPtr)
        }

        return this.__IRefreshVisualizer.put_Content(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IRefreshVisualizer")) {
            if ((queryResult := this.QueryInterface(IRefreshVisualizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshVisualizer := IRefreshVisualizer(outPtr)
        }

        return this.__IRefreshVisualizer.get_State()
    }

    /**
     * 
     * @param {TypedEventHandler<RefreshVisualizer, RefreshRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RefreshRequested(handler) {
        if (!this.HasProp("__IRefreshVisualizer")) {
            if ((queryResult := this.QueryInterface(IRefreshVisualizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshVisualizer := IRefreshVisualizer(outPtr)
        }

        return this.__IRefreshVisualizer.add_RefreshRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RefreshRequested(token) {
        if (!this.HasProp("__IRefreshVisualizer")) {
            if ((queryResult := this.QueryInterface(IRefreshVisualizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshVisualizer := IRefreshVisualizer(outPtr)
        }

        return this.__IRefreshVisualizer.remove_RefreshRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RefreshVisualizer, RefreshStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RefreshStateChanged(handler) {
        if (!this.HasProp("__IRefreshVisualizer")) {
            if ((queryResult := this.QueryInterface(IRefreshVisualizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshVisualizer := IRefreshVisualizer(outPtr)
        }

        return this.__IRefreshVisualizer.add_RefreshStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RefreshStateChanged(token) {
        if (!this.HasProp("__IRefreshVisualizer")) {
            if ((queryResult := this.QueryInterface(IRefreshVisualizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshVisualizer := IRefreshVisualizer(outPtr)
        }

        return this.__IRefreshVisualizer.remove_RefreshStateChanged(token)
    }

;@endregion Instance Methods
}
