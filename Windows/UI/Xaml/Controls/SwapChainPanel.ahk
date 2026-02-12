#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Grid.ahk
#Include .\ISwapChainPanel.ahk
#Include .\ISwapChainPanelFactory.ahk
#Include .\ISwapChainPanelStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\SwapChainPanel.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides a hosting surface, where Microsoft DirectX swap chains provide content that can be rendered into a XAML UI. A SwapChainPanel element is a key component for an app that renders Microsoft DirectX graphics and then presents those visuals within a XAML page.
 * @remarks
 * A SwapChainPanel is a [Grid](grid.md) subclass, so you can use [ColumnDefinitions](grid_columndefinitions.md) and [RowDefinitions](grid_rowdefinitions.md) properties to declare the panel's characteristics, and the attached properties of [Grid](grid.md) such as [Grid.Row](/uwp/api/windows.ui.xaml.controls.grid.row) and [Grid.Column](/uwp/api/windows.ui.xaml.controls.grid.column) on child elements to position those child elements in the layout.
 * 
 * SwapChainPanel inherits the Background property from Panel, but you can't set the Background on a SwapChainPanel. An error occurs if you attempt to set it.
 * 
 * The SwapChainPanel class does not inherit from the [Control](control.md) class, so you can't programmatically focus it directly for purposes of capturing key events. Consider setting the focus to a focusable element inside the panel and letting the key event bubble.
 * 
 * In order to maintain crisp vector rendering, you should listen for the [CompositionScaleChanged](swapchainpanel_compositionscalechanged.md) event and query the [CompositionScaleX](swapchainpanel_compositionscalex.md) and [CompositionScaleY](swapchainpanel_compositionscaley.md) property values to account for the current UI scale, and potentially [render again from DirectX](/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1). Otherwise XAML layout might do the scaling and your visuals might be degraded.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swapchainpanel
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SwapChainPanel extends Grid {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISwapChainPanel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISwapChainPanel.IID

    /**
     * Identifies the [CompositionScaleX](swapchainpanel_compositionscalex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swapchainpanel.compositionscalexproperty
     * @type {DependencyProperty} 
     */
    static CompositionScaleXProperty {
        get => SwapChainPanel.get_CompositionScaleXProperty()
    }

    /**
     * Identifies the [CompositionScaleY](swapchainpanel_compositionscaley.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swapchainpanel.compositionscaleyproperty
     * @type {DependencyProperty} 
     */
    static CompositionScaleYProperty {
        get => SwapChainPanel.get_CompositionScaleYProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {SwapChainPanel} 
     */
    static CreateInstance() {
        if (!SwapChainPanel.HasProp("__ISwapChainPanelFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwapChainPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwapChainPanelFactory.IID)
            SwapChainPanel.__ISwapChainPanelFactory := ISwapChainPanelFactory(factoryPtr)
        }

        return SwapChainPanel.__ISwapChainPanelFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CompositionScaleXProperty() {
        if (!SwapChainPanel.HasProp("__ISwapChainPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwapChainPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwapChainPanelStatics.IID)
            SwapChainPanel.__ISwapChainPanelStatics := ISwapChainPanelStatics(factoryPtr)
        }

        return SwapChainPanel.__ISwapChainPanelStatics.get_CompositionScaleXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CompositionScaleYProperty() {
        if (!SwapChainPanel.HasProp("__ISwapChainPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwapChainPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwapChainPanelStatics.IID)
            SwapChainPanel.__ISwapChainPanelStatics := ISwapChainPanelStatics(factoryPtr)
        }

        return SwapChainPanel.__ISwapChainPanelStatics.get_CompositionScaleYProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the x-axis scale factor of the [SwapChainPanel](swapchainpanel.md).
     * @remarks
     * The CompositionScaleX scale factor is applied to the swap chain content when it's rendered to the screen and composited into the XAML content. The scale factor is derived from calculating the render transformations (implicit or explicit) applied to the [SwapChainPanel](swapchainpanel.md) and its ancestors.
     * 
     * The scale factor will be an estimate if a [Projection](../windows.ui.xaml/uielement_projection.md) property value is present on the [SwapChainPanel](swapchainpanel.md) or one of its ancestors.
     * 
     * Check this property any time you are handling [CompositionScaleChanged](swapchainpanel_compositionscalechanged.md) ([CompositionScaleChanged](swapchainpanel_compositionscalechanged.md) doesn't have event data, but if it fires it means that CompositionScaleX, [CompositionScaleY](swapchainpanel_compositionscaley.md), or both have changed values on this [SwapChainPanel](swapchainpanel.md)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swapchainpanel.compositionscalex
     * @type {Float} 
     */
    CompositionScaleX {
        get => this.get_CompositionScaleX()
    }

    /**
     * Gets the y-axis scale factor of the [SwapChainPanel](swapchainpanel.md).
     * @remarks
     * The CompositionScaleY scale factor is applied to the swap chain content when it's rendered to the screen and composited into the XAML content. The scale factor is derived from calculating the render transformations (implicit or explicit) applied to the [SwapChainPanel](swapchainpanel.md) and its ancestors.
     * 
     * The scale factor will be an estimate if a [Projection](../windows.ui.xaml/uielement_projection.md) property value is present on the [SwapChainPanel](swapchainpanel.md) or one of its ancestors.
     * 
     * Check this property any time you are handling [CompositionScaleChanged](swapchainpanel_compositionscalechanged.md) ([CompositionScaleChanged](swapchainpanel_compositionscalechanged.md) doesn't have event data, but if it fires it means that [CompositionScaleX](swapchainpanel_compositionscalex.md), CompositionScaleY, or both have changed values on this [SwapChainPanel](swapchainpanel.md)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swapchainpanel.compositionscaley
     * @type {Float} 
     */
    CompositionScaleY {
        get => this.get_CompositionScaleY()
    }

    /**
     * Occurs when the composition scale factor of the [SwapChainPanel](swapchainpanel.md) has changed.
     * @remarks
     * The supplier of the swap chain content might need to resize their content if a layout pass determines a new size for the panel or containers it's within, or if a [RenderTransform](../windows.ui.xaml/uielement_rendertransform.md) is applied on the [SwapChainPanel](swapchainpanel.md) or any of its ancestors. Changes of this nature aren't always originated by app logic that's easy to detect from other events (for example the user might change a device orientation or a view state that causes layout to rerun), so this event provides a notification specifically for the scenario of changing the swap chain content size, which would typically invert the scale factors applied.
     * 
     * Check [CompositionScaleX](swapchainpanel_compositionscalex.md) and [CompositionScaleY](swapchainpanel_compositionscaley.md) any time you are handling CompositionScaleChanged (CompositionScaleChanged doesn't have event data, but if it fires it means that one or both properties have changed values on this [SwapChainPanel](swapchainpanel.md)).
     * 
     * This event fires asynchronously versus the originating change. For example, dynamic animations or manipulations might affect the scale factor, and the event is raised when those dynamic changes are completed.
     * @type {TypedEventHandler<SwapChainPanel, IInspectable>}
    */
    OnCompositionScaleChanged {
        get {
            if(!this.HasProp("__OnCompositionScaleChanged")){
                this.__OnCompositionScaleChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a8bbf146-b687-5c03-9a42-2ae2d55bfbb4}"),
                    SwapChainPanel,
                    IInspectable
                )
                this.__OnCompositionScaleChangedToken := this.add_CompositionScaleChanged(this.__OnCompositionScaleChanged.iface)
            }
            return this.__OnCompositionScaleChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCompositionScaleChangedToken")) {
            this.remove_CompositionScaleChanged(this.__OnCompositionScaleChangedToken)
            this.__OnCompositionScaleChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CompositionScaleX() {
        if (!this.HasProp("__ISwapChainPanel")) {
            if ((queryResult := this.QueryInterface(ISwapChainPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwapChainPanel := ISwapChainPanel(outPtr)
        }

        return this.__ISwapChainPanel.get_CompositionScaleX()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CompositionScaleY() {
        if (!this.HasProp("__ISwapChainPanel")) {
            if ((queryResult := this.QueryInterface(ISwapChainPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwapChainPanel := ISwapChainPanel(outPtr)
        }

        return this.__ISwapChainPanel.get_CompositionScaleY()
    }

    /**
     * 
     * @param {TypedEventHandler<SwapChainPanel, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CompositionScaleChanged(handler) {
        if (!this.HasProp("__ISwapChainPanel")) {
            if ((queryResult := this.QueryInterface(ISwapChainPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwapChainPanel := ISwapChainPanel(outPtr)
        }

        return this.__ISwapChainPanel.add_CompositionScaleChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CompositionScaleChanged(token) {
        if (!this.HasProp("__ISwapChainPanel")) {
            if ((queryResult := this.QueryInterface(ISwapChainPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwapChainPanel := ISwapChainPanel(outPtr)
        }

        return this.__ISwapChainPanel.remove_CompositionScaleChanged(token)
    }

    /**
     * Creates a core input object that handles the input types as specified by the *deviceTypes* parameter. This core input object can process input events on a background thread.
     * @remarks
     * This method enables an app that includes a [SwapChainPanel](swapchainpanel.md) to handle input and rendering independent of the XAML UI thread, because you're deliberately providing the input processing logic on a background thread. You must call CreateCoreIndependentInputSource from a non-UI thread, otherwise this method will fail.
     * 
     * Use the [CreateCoreIndependentInputSource](swapchainbackgroundpanel_createcoreindependentinputsource_467679991.md) method to create a core input object and associate it with your [SwapChainPanel](swapchainpanel.md). Upon successful creation, user input of the specified device types that accesses [SwapChainPanel](swapchainpanel.md) contents will be redirected to the thread that CreateCoreIndependentInputSource was called from. Your app can handle this input by registering for input events and processing those events on a background thread. In order to receive input messages through the [CoreIndependentInputSource](../windows.ui.core/coreindependentinputsource.md) object, the app code must set a swap chain on the [SwapChainPanel](swapchainpanel.md), and render (at a Microsoft DirectX level) from this swap chain at least once. That provides the rendering that makes hit testing possible.
     * 
     * You typically use [CoreDispatcher.ProcessEvents](../windows.ui.core/coredispatcher_processevents_1611214514.md) as part of the event handling. Get a [CoreDispatcher](../windows.ui.core/coredispatcher.md) reference from [CoreIndependentInputSource.Dispatcher](../windows.ui.core/coreindependentinputsource_dispatcher.md). For more info on how to use background threads, see [ThreadPool](../windows.system.threading/threadpool.md) or [Threading and async programming](/windows/uwp/threading-async/index).
     * 
     * You can call CreateCoreIndependentInputSource multiple times. Each time CreateCoreIndependentInputSource is called, the previous [CoreIndependentInputSource](../windows.ui.core/coreindependentinputsource.md) object is disassociated with the [SwapChainPanel](swapchainpanel_swapchainpanel_1221375020.md). In other words, only one [CoreIndependentInputSource](../windows.ui.core/coreindependentinputsource.md) object can get events at a time.
     * 
     * For example code of how to use CreateCoreIndependentInputSource, see the `DrawingPanel` class definition that is part of the [XAML SwapChainPanel DirectX interop sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/XAML%20SwapChainPanel%20DirectX%20interop%20sample).
     * 
     * CreateCoreIndependentInputSource d can return **null** if *deviceTypes* was passed as [CoreInputDeviceTypes.None](../windows.ui.core/coreinputdevicetypes.md) (that's not a typical way to call CreateCoreIndependentInputSource though).
     * 
     * 
     * <!--Implementation detail? Or is there a scenario for that usage?-->
     * @param {Integer} deviceTypes A combined value of the enumeration.
     * @returns {CoreIndependentInputSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swapchainpanel.createcoreindependentinputsource
     */
    CreateCoreIndependentInputSource(deviceTypes) {
        if (!this.HasProp("__ISwapChainPanel")) {
            if ((queryResult := this.QueryInterface(ISwapChainPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwapChainPanel := ISwapChainPanel(outPtr)
        }

        return this.__ISwapChainPanel.CreateCoreIndependentInputSource(deviceTypes)
    }

;@endregion Instance Methods
}
