#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDebugSettings.ahk
#Include .\IDebugSettings2.ahk
#Include .\IDebugSettings3.ahk
#Include .\IDebugSettings4.ahk
#Include .\BindingFailedEventHandler.ahk
#Include .\BindingFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Declares how certain aspects of the app behave when it is run in a debug environment
 * @remarks
 * This class can't be constructed. Get the value from [Application.DebugSettings](application_debugsettings.md) and then change the properties as necessary.
 * 
 * [OnLaunched](application_onlaunched_859642554.md) is a good place to change DebugSettings values.
 * 
 * Not all modes enabled by DebugSettings require that a debugger is attached. For example, the frame-rate counter associated with [EnableFrameRateCounter](debugsettings_enableframeratecounter.md) will appear in an app that runs with that setting even if you activate it as a tile without the debugger.
 * 
 * Don't leave any DebugSettings properties explicitly set in your production code.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.debugsettings
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DebugSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDebugSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDebugSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether to display frame-rate and per-frame CPU usage info. These display as an overlay of counters in the window chrome while the app runs.
     * @remarks
     * The overlay debug counters have two sets of numbers. The set that appears on the upper left of the screen applies to just your app. The set that appears on the upper right applies to the system overall, and is also accounting for other apps that are drawing to the composited desktop. The right-side counter comes from the Microsoft DirectComposition components that are handling compositing for Microsoft Windows in general. Basically, if you set EnableFrameRateCounter to **true**, this also calls [IDCompositionDeviceDebug.EnableDebugCounters](/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevicedebug-enabledebugcounters) in the underlying components. The result is that both the counters specific to apps using XAML and the Microsoft DirectComposition counters for all apps appear when you debug your UWP app.
     * 
     * The format for the frame-rate counter displayed in the window chrome is:
     * 
     * | *App fps* | *App CPU* | … | … | *Sys fps* | *Sys CPU* |
     * | --- | --- | --- | --- | --- | --- |
     * | 000 | 000 | … | … | 000 | 000 |
     * | The app's UI thread frame rate, in frames per second. | The CPU usage of the app's UI thread per frame, in milliseconds. | … | … | The system-wide composition engine frame rate, in frames per second. This is typically pegged to 60. | The system-wide overall CPU usage of the composition thread per frame, in milliseconds. |
     * 
     * The *App fps* value is specifically reporting on the UI thread. There could be a much higher apparent refresh rate happening in your app that's related to the composition thread, but not to the UI thread. For more info on what each thread is responsible for, see [Performance best practices for ](/previous-versions/windows/apps/hh750313(v=win.10)).
     * 
     * [OnLaunched](application_onlaunched_859642554.md) is a good place to change [DebugSettings](debugsettings.md) values. Another possibility is the `App()` constructor.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.debugsettings.enableframeratecounter
     * @type {Boolean} 
     */
    EnableFrameRateCounter {
        get => this.get_EnableFrameRateCounter()
        set => this.put_EnableFrameRateCounter(value)
    }

    /**
     * Gets or sets a value that indicates whether to engage the binding tracing feature of Microsoft Visual Studio when the app runs.
     * @remarks
     * This property is **true** by default, but for binding tracing to work, you must also select **Mixed** debugger type in Microsoft Visual Studio on the **Debug** page of the project designer.
     * 
     * When binding tracing is enabled and you run your app with the debugger attached, any binding errors appear in the **Output** window in Microsoft Visual Studio.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.debugsettings.isbindingtracingenabled
     * @type {Boolean} 
     */
    IsBindingTracingEnabled {
        get => this.get_IsBindingTracingEnabled()
        set => this.put_IsBindingTracingEnabled(value)
    }

    /**
     * Gets or sets a value that enables a debug setting that visualizes overdraw operations. This visualization is useful during application development for detecting layout, animation, and other operations that are graphics processing intensive.
     * @remarks
     * Use this property as a debugging aid to visibly detect areas of the UI where applying a [CacheMode](uielement_cachemode.md) for textures might be useful. For more info, see "Cache static content" section of [Optimize your XAML markup](/windows/uwp/debug-test-perf/optimize-xaml-loading).
     * 
     * [OnLaunched](application_onlaunched_859642554.md) is a good place to change [DebugSettings](debugsettings.md) values.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.debugsettings.isoverdrawheatmapenabled
     * @type {Boolean} 
     */
    IsOverdrawHeatMapEnabled {
        get => this.get_IsOverdrawHeatMapEnabled()
        set => this.put_IsOverdrawHeatMapEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether to highlight areas of the app UI surface that are being redrawn each frame.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.debugsettings.enableredrawregions
     * @type {Boolean} 
     */
    EnableRedrawRegions {
        get => this.get_EnableRedrawRegions()
        set => this.put_EnableRedrawRegions(value)
    }

    /**
     * Gets or sets a value that indicates whether to engage the text performance visualization feature of Microsoft Visual Studio when the app runs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.debugsettings.istextperformancevisualizationenabled
     * @type {Boolean} 
     */
    IsTextPerformanceVisualizationEnabled {
        get => this.get_IsTextPerformanceVisualizationEnabled()
        set => this.put_IsTextPerformanceVisualizationEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether XAML errors cause an immediate FailFast rather than returning an error.
     * @remarks
     * This property is an aid to help application debugging, but it is not limited to debug builds or use in the debugger. This feature can be enabled by apps even when deployed to the Store.
     * 
     * Enabling FailFastOnErrors lets you find errors earlier, with potentially more usable information. It also causes crashes where errors would otherwise be ignored. For example, with FailFastOnErrors disabled, a XAML Image element raises an Image.ImageFailed event if it can't load an image, but otherwise ignores the error. If FailFastOnErrors is enabled, it will cause the application to crash instead.
     * 
     * The Visual Studio managed code debugger does not break on FailFast errors. You should select the **Mixed** debugger type in Microsoft Visual Studio on the **Debug** page of the project designer.
     * 
     * This property is ignored when code is running in a designer (when [DesignMode.DesignModeEnabled](/windows.applicationmodel/designmode_designmodeenabled.md) is **true**).
     * 
     * When FailFastOnErrors is enabled, the Application.UnhandledException event is not raised.
     * 
     * This property can be changed at any time, not just during app startup.
     * 
     * This property affects all XAML threads in the process.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.debugsettings.failfastonerrors
     * @type {Boolean} 
     */
    FailFastOnErrors {
        get => this.get_FailFastOnErrors()
        set => this.put_FailFastOnErrors(value)
    }

    /**
     * Occurs when a [Binding](../windows.ui.xaml.data/binding.md) cannot be resolved.
     * @remarks
     * [IsBindingTracingEnabled](debugsettings_isbindingtracingenabled.md) must be **true** and there must be a debugger attached to the app process in order for BindingFailed to fire and for tracing to appear in debugger output. You don't need to handle the event in order to see tracing appear in a debugger. The debugger output contains message information that goes to the **Output** window of the debugger. Attaching a BindingFailed handler yourself is an advanced scenario for when you want to see the raw message.
     * @type {BindingFailedEventHandler}
    */
    OnBindingFailed {
        get {
            if(!this.HasProp("__OnBindingFailed")){
                this.__OnBindingFailed := WinRTEventHandler(
                    BindingFailedEventHandler,
                    BindingFailedEventHandler.IID,
                    IInspectable,
                    BindingFailedEventArgs
                )
                this.__OnBindingFailedToken := this.add_BindingFailed(this.__OnBindingFailed.iface)
            }
            return this.__OnBindingFailed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnBindingFailedToken")) {
            this.remove_BindingFailed(this.__OnBindingFailedToken)
            this.__OnBindingFailed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnableFrameRateCounter() {
        if (!this.HasProp("__IDebugSettings")) {
            if ((queryResult := this.QueryInterface(IDebugSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDebugSettings := IDebugSettings(outPtr)
        }

        return this.__IDebugSettings.get_EnableFrameRateCounter()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EnableFrameRateCounter(value) {
        if (!this.HasProp("__IDebugSettings")) {
            if ((queryResult := this.QueryInterface(IDebugSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDebugSettings := IDebugSettings(outPtr)
        }

        return this.__IDebugSettings.put_EnableFrameRateCounter(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBindingTracingEnabled() {
        if (!this.HasProp("__IDebugSettings")) {
            if ((queryResult := this.QueryInterface(IDebugSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDebugSettings := IDebugSettings(outPtr)
        }

        return this.__IDebugSettings.get_IsBindingTracingEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsBindingTracingEnabled(value) {
        if (!this.HasProp("__IDebugSettings")) {
            if ((queryResult := this.QueryInterface(IDebugSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDebugSettings := IDebugSettings(outPtr)
        }

        return this.__IDebugSettings.put_IsBindingTracingEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOverdrawHeatMapEnabled() {
        if (!this.HasProp("__IDebugSettings")) {
            if ((queryResult := this.QueryInterface(IDebugSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDebugSettings := IDebugSettings(outPtr)
        }

        return this.__IDebugSettings.get_IsOverdrawHeatMapEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOverdrawHeatMapEnabled(value) {
        if (!this.HasProp("__IDebugSettings")) {
            if ((queryResult := this.QueryInterface(IDebugSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDebugSettings := IDebugSettings(outPtr)
        }

        return this.__IDebugSettings.put_IsOverdrawHeatMapEnabled(value)
    }

    /**
     * 
     * @param {BindingFailedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BindingFailed(handler) {
        if (!this.HasProp("__IDebugSettings")) {
            if ((queryResult := this.QueryInterface(IDebugSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDebugSettings := IDebugSettings(outPtr)
        }

        return this.__IDebugSettings.add_BindingFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BindingFailed(token) {
        if (!this.HasProp("__IDebugSettings")) {
            if ((queryResult := this.QueryInterface(IDebugSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDebugSettings := IDebugSettings(outPtr)
        }

        return this.__IDebugSettings.remove_BindingFailed(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnableRedrawRegions() {
        if (!this.HasProp("__IDebugSettings2")) {
            if ((queryResult := this.QueryInterface(IDebugSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDebugSettings2 := IDebugSettings2(outPtr)
        }

        return this.__IDebugSettings2.get_EnableRedrawRegions()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EnableRedrawRegions(value) {
        if (!this.HasProp("__IDebugSettings2")) {
            if ((queryResult := this.QueryInterface(IDebugSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDebugSettings2 := IDebugSettings2(outPtr)
        }

        return this.__IDebugSettings2.put_EnableRedrawRegions(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextPerformanceVisualizationEnabled() {
        if (!this.HasProp("__IDebugSettings3")) {
            if ((queryResult := this.QueryInterface(IDebugSettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDebugSettings3 := IDebugSettings3(outPtr)
        }

        return this.__IDebugSettings3.get_IsTextPerformanceVisualizationEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextPerformanceVisualizationEnabled(value) {
        if (!this.HasProp("__IDebugSettings3")) {
            if ((queryResult := this.QueryInterface(IDebugSettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDebugSettings3 := IDebugSettings3(outPtr)
        }

        return this.__IDebugSettings3.put_IsTextPerformanceVisualizationEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_FailFastOnErrors() {
        if (!this.HasProp("__IDebugSettings4")) {
            if ((queryResult := this.QueryInterface(IDebugSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDebugSettings4 := IDebugSettings4(outPtr)
        }

        return this.__IDebugSettings4.get_FailFastOnErrors()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_FailFastOnErrors(value) {
        if (!this.HasProp("__IDebugSettings4")) {
            if ((queryResult := this.QueryInterface(IDebugSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDebugSettings4 := IDebugSettings4(outPtr)
        }

        return this.__IDebugSettings4.put_FailFastOnErrors(value)
    }

;@endregion Instance Methods
}
