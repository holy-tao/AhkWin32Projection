#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBrightnessOverride.ahk
#Include .\IBrightnessOverrideStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\BrightnessOverride.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * **BrightnessOverride** allows your application to override the screen brightness level that's set for the device. With this API, you can have per-application brightness controls on devices that support controllable brightness.
  * 
  * You can use **BrightnessOverride** to override the user's brightness level setting either temporarily or permanently.
  * 
  * > [!NOTE]
  * > When you first retrieve an initialized **BrightnessOverride** object from [GetDefaultForSystem](/uwp/api/windows.graphics.display.brightnessoverride.getdefaultforsystem) or from [GetForCurrentView](/uwp/api/windows.graphics.display.brightnessoverride.getforcurrentview), the value of that object's **BrightnessLevel** property is undefined (the value doesn't, for example, represent the current system brightness level). You need to first call [**SetBrightnessLevel**](/uwp/api/windows.graphics.display.brightnessoverride.setbrightnesslevel?view=winrt-19041) to set a brightness level.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverride
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class BrightnessOverride extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBrightnessOverride

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBrightnessOverride.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns a brightness override object. This method does not require [CoreWindow](../windows.ui.core/corewindow.md) so it can be used by apps that are running in the background.
     * @remarks
     * Requires the __systemManagement__ capability to be declared in your app's package manifest. Usage of the __systemManagement__ capability requires [Embedded mode](/windows/iot-core/develop-your-app/embeddedmode) to be enabled. This capability allows apps to have basic system administration privileges. If it isn’t declared, this method throws an access is denied exception. For more info, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations#general-use-capabilities).
     * @returns {BrightnessOverride} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverride.getdefaultforsystem
     */
    static GetDefaultForSystem() {
        if (!BrightnessOverride.HasProp("__IBrightnessOverrideStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.BrightnessOverride")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBrightnessOverrideStatics.IID)
            BrightnessOverride.__IBrightnessOverrideStatics := IBrightnessOverrideStatics(factoryPtr)
        }

        return BrightnessOverride.__IBrightnessOverrideStatics.GetDefaultForSystem()
    }

    /**
     * Returns a [BrightnessOverride](/uwp/api/windows.graphics.display.brightnessoverride) object. This method requires [CoreWindow](../windows.ui.core/corewindow.md), so it can be used only by apps that are currently running in a window. The returned brightness override object might not be the same between multiple calls to **BrightnessOverride.GetForCurrentView** on the same thread.
     * 
     * You must call **BrightnessOverride.GetForCurrentView** from the main UI thread.
     * @remarks
     * This method throws an access-denied exception if there is no [CoreWindow](../windows.ui.core/corewindow.md) on the calling thread.
     * 
     * If you call the [StartOverride](brightnessoverride_startoverride_1290413150.md) method on multiple instances in succession, the override with the highest *brightness* value will take precedence over subsequent calls on instances with lower values. To avoid problems, cache the instance retrieved from **BrightnessOverride.GetForCurrentView** and reuse that instance, or always call [StopOverride](brightnessoverride_stopoverride_1207260318.md) on the previously applied [BrightnessOverride](brightnessoverride.md).
     * @returns {BrightnessOverride} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverride.getforcurrentview
     */
    static GetForCurrentView() {
        if (!BrightnessOverride.HasProp("__IBrightnessOverrideStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.BrightnessOverride")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBrightnessOverrideStatics.IID)
            BrightnessOverride.__IBrightnessOverrideStatics := IBrightnessOverrideStatics(factoryPtr)
        }

        return BrightnessOverride.__IBrightnessOverrideStatics.GetForCurrentView()
    }

    /**
     * Saves the specified brightness override settings by committing these values to user settings. Use this method to persist the override settings after overriding stops. If `null` is passed for *value*, then the system turns on auto-brightness.
     * @remarks
     * Requires the *systemManagement* capability to be declared in your app's package manifest. That capability allows apps to have basic system administration privileges. If it isn't declared, then this method throws an access is denied exception. For more info, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations#general-use-capabilities).
     * @param {BrightnessOverride} value A brightness override object; or `null` to turn on auto-brightness.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverride.saveforsystemasync
     */
    static SaveForSystemAsync(value) {
        if (!BrightnessOverride.HasProp("__IBrightnessOverrideStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.BrightnessOverride")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBrightnessOverrideStatics.IID)
            BrightnessOverride.__IBrightnessOverrideStatics := IBrightnessOverrideStatics(factoryPtr)
        }

        return BrightnessOverride.__IBrightnessOverrideStatics.SaveForSystemAsync(value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Indicates whether the device currently has at least one brightness controllable display. If TRUE, the device has at least one brightness controllable display that supports brightness override.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverride.issupported
     * @type {Boolean} 
     */
    IsSupported {
        get => this.get_IsSupported()
    }

    /**
     * BOOLEAN value that indicates whether the brightness override is active. If TRUE, the current brightness level matches the override brightness level. This property value will always be FALSE if [StartOverride()](brightnessoverride_startoverride_1290413150.md) isn’t called.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverride.isoverrideactive
     * @type {Boolean} 
     */
    IsOverrideActive {
        get => this.get_IsOverrideActive()
    }

    /**
     * Gets the screen brightness level for this [**BrightnessOverride**](/uwp/api/windows.graphics.display.brightnessoverride) instance (if you've previously called [**SetBrightnessLevel**](/uwp/api/windows.graphics.display.brightnessoverride.setbrightnesslevel?view=winrt-19041) to set the brightness level).
     * 
     * > [!NOTE]
     * > When you first retrieve an initialized **BrightnessOverride** object from [GetDefaultForSystem](/uwp/api/windows.graphics.display.brightnessoverride.getdefaultforsystem) or from [GetForCurrentView](/uwp/api/windows.graphics.display.brightnessoverride.getforcurrentview), the value of that object's **BrightnessLevel** property is undefined (the value doesn't, for example, represent the current system brightness level). You need to first call [**SetBrightnessLevel**](/uwp/api/windows.graphics.display.brightnessoverride.setbrightnesslevel?view=winrt-19041) to set a brightness level.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverride.brightnesslevel
     * @type {Float} 
     */
    BrightnessLevel {
        get => this.get_BrightnessLevel()
    }

    /**
     * Occurs when a brightness controllable display is detected or removed. This event is raised when the [IsSupported](brightnessoverride_issupported.md) property changes.
     * @type {TypedEventHandler<BrightnessOverride, IInspectable>}
    */
    OnIsSupportedChanged {
        get {
            if(!this.HasProp("__OnIsSupportedChanged")){
                this.__OnIsSupportedChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a460214e-6620-521d-9cb9-a0a0f732ce90}"),
                    BrightnessOverride,
                    IInspectable
                )
                this.__OnIsSupportedChangedToken := this.add_IsSupportedChanged(this.__OnIsSupportedChanged.iface)
            }
            return this.__OnIsSupportedChanged
        }
    }

    /**
     * Occurs when the screen brightness level either starts to match or stops to match the override brightness level. This event is raised when the [IsOverrideActive](brightnessoverride_isoverrideactive.md) property changes state.
     * @type {TypedEventHandler<BrightnessOverride, IInspectable>}
    */
    OnIsOverrideActiveChanged {
        get {
            if(!this.HasProp("__OnIsOverrideActiveChanged")){
                this.__OnIsOverrideActiveChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a460214e-6620-521d-9cb9-a0a0f732ce90}"),
                    BrightnessOverride,
                    IInspectable
                )
                this.__OnIsOverrideActiveChangedToken := this.add_IsOverrideActiveChanged(this.__OnIsOverrideActiveChanged.iface)
            }
            return this.__OnIsOverrideActiveChanged
        }
    }

    /**
     * Occurs when the screen brightness level changes.
     * @remarks
     * This event is raised whenever the screen brightness changes, regardless whether the app has requested to start the override session or not.
     * @type {TypedEventHandler<BrightnessOverride, IInspectable>}
    */
    OnBrightnessLevelChanged {
        get {
            if(!this.HasProp("__OnBrightnessLevelChanged")){
                this.__OnBrightnessLevelChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a460214e-6620-521d-9cb9-a0a0f732ce90}"),
                    BrightnessOverride,
                    IInspectable
                )
                this.__OnBrightnessLevelChangedToken := this.add_BrightnessLevelChanged(this.__OnBrightnessLevelChanged.iface)
            }
            return this.__OnBrightnessLevelChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnIsSupportedChangedToken")) {
            this.remove_IsSupportedChanged(this.__OnIsSupportedChangedToken)
            this.__OnIsSupportedChanged.iface.Dispose()
        }

        if(this.HasProp("__OnIsOverrideActiveChangedToken")) {
            this.remove_IsOverrideActiveChanged(this.__OnIsOverrideActiveChangedToken)
            this.__OnIsOverrideActiveChanged.iface.Dispose()
        }

        if(this.HasProp("__OnBrightnessLevelChangedToken")) {
            this.remove_BrightnessLevelChanged(this.__OnBrightnessLevelChangedToken)
            this.__OnBrightnessLevelChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSupported() {
        if (!this.HasProp("__IBrightnessOverride")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverride := IBrightnessOverride(outPtr)
        }

        return this.__IBrightnessOverride.get_IsSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOverrideActive() {
        if (!this.HasProp("__IBrightnessOverride")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverride := IBrightnessOverride(outPtr)
        }

        return this.__IBrightnessOverride.get_IsOverrideActive()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BrightnessLevel() {
        if (!this.HasProp("__IBrightnessOverride")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverride := IBrightnessOverride(outPtr)
        }

        return this.__IBrightnessOverride.get_BrightnessLevel()
    }

    /**
     * Sets the brightness level and the override options. When your app is ready to change the current brightness with what you want to override it with, call [StartOverride](/uwp/api/windows.graphics.display.brightnessoverride.startoverride).
     * @param {Float} brightnessLevel Brightness of the screen. Value should be in the range of 0.0 and 1.0, where 1.0 is for 100% brightness.
     * @param {Integer} options Options that modify the brightness level of the screen during the brightness override session.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverride.setbrightnesslevel
     */
    SetBrightnessLevel(brightnessLevel, options) {
        if (!this.HasProp("__IBrightnessOverride")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverride := IBrightnessOverride(outPtr)
        }

        return this.__IBrightnessOverride.SetBrightnessLevel(brightnessLevel, options)
    }

    /**
     * Sets the brightness level, by specifying a scenario that has a well-known brightness level, and the override options of the brightness override.
     * @param {Integer} scenario A scenario that has a well-known brightness level.
     * @param {Integer} options Options that modify the brightness level of the screen during the brightness override session.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverride.setbrightnessscenario
     */
    SetBrightnessScenario(scenario, options) {
        if (!this.HasProp("__IBrightnessOverride")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverride := IBrightnessOverride(outPtr)
        }

        return this.__IBrightnessOverride.SetBrightnessScenario(scenario, options)
    }

    /**
     * Gets the brightness level associated with the specified scenario.
     * @param {Integer} scenario The enum value of the scenario that you want to retrieve the brightness level for, as defined in [DisplayBrightnessScenario](displaybrightnessscenario.md).
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverride.getlevelforscenario
     */
    GetLevelForScenario(scenario) {
        if (!this.HasProp("__IBrightnessOverride")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverride := IBrightnessOverride(outPtr)
        }

        return this.__IBrightnessOverride.GetLevelForScenario(scenario)
    }

    /**
     * Request to start overriding the screen brightness level. The request to start overriding does not mean that the screen brightness level always changes to match the specified override brightness level. It's still up to the system to decide whether or not to honor this override request. Use [IsOverrideActive](brightnessoverride_isoverrideactive.md) and [IsOverrideActiveChanged](brightnessoverride_isoverrideactivechanged.md) properties to determine if the system has honored the override request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverride.startoverride
     */
    StartOverride() {
        if (!this.HasProp("__IBrightnessOverride")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverride := IBrightnessOverride(outPtr)
        }

        return this.__IBrightnessOverride.StartOverride()
    }

    /**
     * Stops overriding the brightness level.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverride.stopoverride
     */
    StopOverride() {
        if (!this.HasProp("__IBrightnessOverride")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverride := IBrightnessOverride(outPtr)
        }

        return this.__IBrightnessOverride.StopOverride()
    }

    /**
     * 
     * @param {TypedEventHandler<BrightnessOverride, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsSupportedChanged(handler) {
        if (!this.HasProp("__IBrightnessOverride")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverride := IBrightnessOverride(outPtr)
        }

        return this.__IBrightnessOverride.add_IsSupportedChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsSupportedChanged(token) {
        if (!this.HasProp("__IBrightnessOverride")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverride := IBrightnessOverride(outPtr)
        }

        return this.__IBrightnessOverride.remove_IsSupportedChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BrightnessOverride, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsOverrideActiveChanged(handler) {
        if (!this.HasProp("__IBrightnessOverride")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverride := IBrightnessOverride(outPtr)
        }

        return this.__IBrightnessOverride.add_IsOverrideActiveChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsOverrideActiveChanged(token) {
        if (!this.HasProp("__IBrightnessOverride")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverride := IBrightnessOverride(outPtr)
        }

        return this.__IBrightnessOverride.remove_IsOverrideActiveChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BrightnessOverride, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BrightnessLevelChanged(handler) {
        if (!this.HasProp("__IBrightnessOverride")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverride := IBrightnessOverride(outPtr)
        }

        return this.__IBrightnessOverride.add_BrightnessLevelChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BrightnessLevelChanged(token) {
        if (!this.HasProp("__IBrightnessOverride")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverride := IBrightnessOverride(outPtr)
        }

        return this.__IBrightnessOverride.remove_BrightnessLevelChanged(token)
    }

;@endregion Instance Methods
}
