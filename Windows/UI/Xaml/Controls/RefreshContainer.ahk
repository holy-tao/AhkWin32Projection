#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\IRefreshContainer.ahk
#Include .\IRefreshContainerStatics.ahk
#Include .\IRefreshContainerFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\RefreshContainer.ahk
#Include .\RefreshRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a container control that provides a [RefreshVisualizer](refreshvisualizer.md) and pull-to-refresh functionality for scrollable content.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshContainer](/windows/winui/api/microsoft.ui.xaml.controls.refreshcontainer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshcontainer
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RefreshContainer extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRefreshContainer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRefreshContainer.IID

    /**
     * Identifies the Visualizer dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshContainer.VisualizerProperty](/windows/winui/api/microsoft.ui.xaml.controls.refreshcontainer.visualizerproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshcontainer.visualizerproperty
     * @type {DependencyProperty} 
     */
    static VisualizerProperty {
        get => RefreshContainer.get_VisualizerProperty()
    }

    /**
     * Identifies the PullDirection dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshContainer.PullDirectionProperty](/windows/winui/api/microsoft.ui.xaml.controls.refreshcontainer.pulldirectionproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshcontainer.pulldirectionproperty
     * @type {DependencyProperty} 
     */
    static PullDirectionProperty {
        get => RefreshContainer.get_PullDirectionProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VisualizerProperty() {
        if (!RefreshContainer.HasProp("__IRefreshContainerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RefreshContainer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRefreshContainerStatics.IID)
            RefreshContainer.__IRefreshContainerStatics := IRefreshContainerStatics(factoryPtr)
        }

        return RefreshContainer.__IRefreshContainerStatics.get_VisualizerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PullDirectionProperty() {
        if (!RefreshContainer.HasProp("__IRefreshContainerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RefreshContainer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRefreshContainerStatics.IID)
            RefreshContainer.__IRefreshContainerStatics := IRefreshContainerStatics(factoryPtr)
        }

        return RefreshContainer.__IRefreshContainerStatics.get_PullDirectionProperty()
    }

    /**
     * 
     * @returns {RefreshContainer} 
     */
    static CreateInstance() {
        if (!RefreshContainer.HasProp("__IRefreshContainerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RefreshContainer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRefreshContainerFactory.IID)
            RefreshContainer.__IRefreshContainerFactory := IRefreshContainerFactory(factoryPtr)
        }

        return RefreshContainer.__IRefreshContainerFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [RefreshVisualizer](refreshvisualizer.md) for this container.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshContainer.Visualizer](/windows/winui/api/microsoft.ui.xaml.controls.refreshcontainer.visualizer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshcontainer.visualizer
     * @type {RefreshVisualizer} 
     */
    Visualizer {
        get => this.get_Visualizer()
        set => this.put_Visualizer(value)
    }

    /**
     * Gets or sets a value that specifies the direction to pull to initiate a refresh.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshContainer.PullDirection](/windows/winui/api/microsoft.ui.xaml.controls.refreshcontainer.pulldirection) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshcontainer.pulldirection
     * @type {Integer} 
     */
    PullDirection {
        get => this.get_PullDirection()
        set => this.put_PullDirection(value)
    }

    /**
     * Occurs when an update of the content has been initiated.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshContainer.RefreshRequested](/windows/winui/api/microsoft.ui.xaml.controls.refreshcontainer.refreshrequested) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<RefreshContainer, RefreshRequestedEventArgs>}
    */
    OnRefreshRequested {
        get {
            if(!this.HasProp("__OnRefreshRequested")){
                this.__OnRefreshRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{fdf80fc9-3610-5649-b695-d50928d2e509}"),
                    RefreshContainer,
                    RefreshRequestedEventArgs
                )
                this.__OnRefreshRequestedToken := this.add_RefreshRequested(this.__OnRefreshRequested.iface)
            }
            return this.__OnRefreshRequested
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

        super.__Delete()
    }

    /**
     * 
     * @returns {RefreshVisualizer} 
     */
    get_Visualizer() {
        if (!this.HasProp("__IRefreshContainer")) {
            if ((queryResult := this.QueryInterface(IRefreshContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshContainer := IRefreshContainer(outPtr)
        }

        return this.__IRefreshContainer.get_Visualizer()
    }

    /**
     * 
     * @param {RefreshVisualizer} value 
     * @returns {HRESULT} 
     */
    put_Visualizer(value) {
        if (!this.HasProp("__IRefreshContainer")) {
            if ((queryResult := this.QueryInterface(IRefreshContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshContainer := IRefreshContainer(outPtr)
        }

        return this.__IRefreshContainer.put_Visualizer(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PullDirection() {
        if (!this.HasProp("__IRefreshContainer")) {
            if ((queryResult := this.QueryInterface(IRefreshContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshContainer := IRefreshContainer(outPtr)
        }

        return this.__IRefreshContainer.get_PullDirection()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PullDirection(value) {
        if (!this.HasProp("__IRefreshContainer")) {
            if ((queryResult := this.QueryInterface(IRefreshContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshContainer := IRefreshContainer(outPtr)
        }

        return this.__IRefreshContainer.put_PullDirection(value)
    }

    /**
     * 
     * @param {TypedEventHandler<RefreshContainer, RefreshRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RefreshRequested(handler) {
        if (!this.HasProp("__IRefreshContainer")) {
            if ((queryResult := this.QueryInterface(IRefreshContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshContainer := IRefreshContainer(outPtr)
        }

        return this.__IRefreshContainer.add_RefreshRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RefreshRequested(token) {
        if (!this.HasProp("__IRefreshContainer")) {
            if ((queryResult := this.QueryInterface(IRefreshContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshContainer := IRefreshContainer(outPtr)
        }

        return this.__IRefreshContainer.remove_RefreshRequested(token)
    }

    /**
     * Initiates an update of the content.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshContainer.RequestRefresh](/windows/winui/api/microsoft.ui.xaml.controls.refreshcontainer.requestrefresh) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshcontainer.requestrefresh
     */
    RequestRefresh() {
        if (!this.HasProp("__IRefreshContainer")) {
            if ((queryResult := this.QueryInterface(IRefreshContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRefreshContainer := IRefreshContainer(outPtr)
        }

        return this.__IRefreshContainer.RequestRefresh()
    }

;@endregion Instance Methods
}
