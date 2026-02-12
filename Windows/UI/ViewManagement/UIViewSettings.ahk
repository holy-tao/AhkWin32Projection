#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUIViewSettings.ahk
#Include .\IUIViewSettingsPreferredInteractionMode.ahk
#Include .\IUIViewSettingsStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\UIViewSettings.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents UI states and behaviors associated with the device mode (Tablet or Desktop) and input device type.
 * @remarks
 * To get an instance of this class, call [GetForCurrentView](uiviewsettings_getforcurrentview_1363600702.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uiviewsettings
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class UIViewSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUIViewSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUIViewSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the UI states and behaviors associated with the device mode (Tablet or Desktop) for the active app.
     * @returns {UIViewSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uiviewsettings.getforcurrentview
     */
    static GetForCurrentView() {
        if (!UIViewSettings.HasProp("__IUIViewSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.UIViewSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIViewSettingsStatics.IID)
            UIViewSettings.__IUIViewSettingsStatics := IUIViewSettingsStatics(factoryPtr)
        }

        return UIViewSettings.__IUIViewSettingsStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether the device UI is optimized for touch input or mouse input.
     * @remarks
     * This property can be used to optimize your app based on input type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uiviewsettings.userinteractionmode
     * @type {Integer} 
     */
    UserInteractionMode {
        get => this.get_UserInteractionMode()
    }

    /**
     * An event that's raised when the system state has changed in such a way that the system's preferred user interaction mode might have changed. In response to this event being raised, call [GetPreferredInteractionMode](./uiviewsettings_getpreferredinteractionmode_653911321.md) to retrieve the system's current preferred user interaction mode, and update your user interface (UI) if the preferred mode has changed.
     * @remarks
     * **PreferredInteractionModeChanged** is raised on a background thread, so your app should marshal the signal back to the proper thread for your app's user interface.
     * 
     * If **PreferredInteractionModeChanged** is not supported on the target device, then it will never be raised on that device.
     * @type {TypedEventHandler<UIViewSettings, IInspectable>}
    */
    OnPreferredInteractionModeChanged {
        get {
            if(!this.HasProp("__OnPreferredInteractionModeChanged")){
                this.__OnPreferredInteractionModeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{bf3e2a14-6fce-5bb3-838e-de9a00e11aad}"),
                    UIViewSettings,
                    IInspectable
                )
                this.__OnPreferredInteractionModeChangedToken := this.add_PreferredInteractionModeChanged(this.__OnPreferredInteractionModeChanged.iface)
            }
            return this.__OnPreferredInteractionModeChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPreferredInteractionModeChangedToken")) {
            this.remove_PreferredInteractionModeChanged(this.__OnPreferredInteractionModeChangedToken)
            this.__OnPreferredInteractionModeChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UserInteractionMode() {
        if (!this.HasProp("__IUIViewSettings")) {
            if ((queryResult := this.QueryInterface(IUIViewSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIViewSettings := IUIViewSettings(outPtr)
        }

        return this.__IUIViewSettings.get_UserInteractionMode()
    }

    /**
     * Of the passed-in values, and based on the current system state, retrieves the system's preferred (most appropriate) user interaction mode among the modes it supports. You can get the user interaction mode that's currently in effect for a system from [UserInteractionMode](./uiviewsettings_userinteractionmode.md).
     * @remarks
     * The system's preferred user interaction mode indicates the input modality for which you should optimize your app's user interface. For example, if the preferred interaction mode is touch, then for easier touchability your app might want to add extra padding around the controls in its user interface (UI).
     * @param {Integer} supportedModes_length 
     * @param {Pointer<Integer>} supportedModes A list of user interaction modes for the system to choose a preferred one from. You must pass at least one value. And [UserInteractionMode.Mouse](./uiviewsettings_userinteractionmode.md) must be one of the values.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uiviewsettings.getpreferredinteractionmode
     */
    GetPreferredInteractionMode(supportedModes_length, supportedModes) {
        if (!this.HasProp("__IUIViewSettingsPreferredInteractionMode")) {
            if ((queryResult := this.QueryInterface(IUIViewSettingsPreferredInteractionMode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIViewSettingsPreferredInteractionMode := IUIViewSettingsPreferredInteractionMode(outPtr)
        }

        return this.__IUIViewSettingsPreferredInteractionMode.GetPreferredInteractionMode(supportedModes_length, supportedModes)
    }

    /**
     * 
     * @param {TypedEventHandler<UIViewSettings, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PreferredInteractionModeChanged(handler) {
        if (!this.HasProp("__IUIViewSettingsPreferredInteractionMode")) {
            if ((queryResult := this.QueryInterface(IUIViewSettingsPreferredInteractionMode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIViewSettingsPreferredInteractionMode := IUIViewSettingsPreferredInteractionMode(outPtr)
        }

        return this.__IUIViewSettingsPreferredInteractionMode.add_PreferredInteractionModeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PreferredInteractionModeChanged(token) {
        if (!this.HasProp("__IUIViewSettingsPreferredInteractionMode")) {
            if ((queryResult := this.QueryInterface(IUIViewSettingsPreferredInteractionMode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIViewSettingsPreferredInteractionMode := IUIViewSettingsPreferredInteractionMode(outPtr)
        }

        return this.__IUIViewSettingsPreferredInteractionMode.remove_PreferredInteractionModeChanged(token)
    }

;@endregion Instance Methods
}
