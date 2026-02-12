#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayEnhancementOverride.ahk
#Include .\IDisplayEnhancementOverrideStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\DisplayEnhancementOverride.ahk
#Include .\DisplayEnhancementOverrideCapabilitiesChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Contains the base features that describe how to override setting displays.
 * @remarks
 * This class acts as a base class for [ColorOverrideSettings](coloroverridesettings.md) and [BrightnessOverride](brightnessoverride.md).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverride
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class DisplayEnhancementOverride extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayEnhancementOverride

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayEnhancementOverride.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a display enhancement override object for the current view.
     * @returns {DisplayEnhancementOverride} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverride.getforcurrentview
     */
    static GetForCurrentView() {
        if (!DisplayEnhancementOverride.HasProp("__IDisplayEnhancementOverrideStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayEnhancementOverride")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayEnhancementOverrideStatics.IID)
            DisplayEnhancementOverride.__IDisplayEnhancementOverrideStatics := IDisplayEnhancementOverrideStatics(factoryPtr)
        }

        return DisplayEnhancementOverride.__IDisplayEnhancementOverrideStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets and sets the color override settings.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverride.coloroverridesettings
     * @type {ColorOverrideSettings} 
     */
    ColorOverrideSettings {
        get => this.get_ColorOverrideSettings()
        set => this.put_ColorOverrideSettings(value)
    }

    /**
     * Gets and sets the brightness override settings.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverride.brightnessoverridesettings
     * @type {BrightnessOverrideSettings} 
     */
    BrightnessOverrideSettings {
        get => this.get_BrightnessOverrideSettings()
        set => this.put_BrightnessOverrideSettings(value)
    }

    /**
     * Gets a value that describes whether the current display settings can be overridden.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverride.canoverride
     * @type {Boolean} 
     */
    CanOverride {
        get => this.get_CanOverride()
    }

    /**
     * Gets a value that describes whether the display enhancement overrides are active.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverride.isoverrideactive
     * @type {Boolean} 
     */
    IsOverrideActive {
        get => this.get_IsOverrideActive()
    }

    /**
     * Raised when the ability to override the display settings have been changed.
     * @type {TypedEventHandler<DisplayEnhancementOverride, IInspectable>}
    */
    OnCanOverrideChanged {
        get {
            if(!this.HasProp("__OnCanOverrideChanged")){
                this.__OnCanOverrideChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3247b54b-7f00-5555-81df-afae022f0796}"),
                    DisplayEnhancementOverride,
                    IInspectable
                )
                this.__OnCanOverrideChangedToken := this.add_CanOverrideChanged(this.__OnCanOverrideChanged.iface)
            }
            return this.__OnCanOverrideChanged
        }
    }

    /**
     * Raised when the [IsOverrideActive](displayenhancementoverride_isoverrideactive.md) property is changed.
     * @type {TypedEventHandler<DisplayEnhancementOverride, IInspectable>}
    */
    OnIsOverrideActiveChanged {
        get {
            if(!this.HasProp("__OnIsOverrideActiveChanged")){
                this.__OnIsOverrideActiveChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3247b54b-7f00-5555-81df-afae022f0796}"),
                    DisplayEnhancementOverride,
                    IInspectable
                )
                this.__OnIsOverrideActiveChangedToken := this.add_IsOverrideActiveChanged(this.__OnIsOverrideActiveChanged.iface)
            }
            return this.__OnIsOverrideActiveChanged
        }
    }

    /**
     * Raised when the display enhancement override capabilities have been changed.
     * @type {TypedEventHandler<DisplayEnhancementOverride, DisplayEnhancementOverrideCapabilitiesChangedEventArgs>}
    */
    OnDisplayEnhancementOverrideCapabilitiesChanged {
        get {
            if(!this.HasProp("__OnDisplayEnhancementOverrideCapabilitiesChanged")){
                this.__OnDisplayEnhancementOverrideCapabilitiesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7e61af14-3e29-5039-92ee-3f2472b99e43}"),
                    DisplayEnhancementOverride,
                    DisplayEnhancementOverrideCapabilitiesChangedEventArgs
                )
                this.__OnDisplayEnhancementOverrideCapabilitiesChangedToken := this.add_DisplayEnhancementOverrideCapabilitiesChanged(this.__OnDisplayEnhancementOverrideCapabilitiesChanged.iface)
            }
            return this.__OnDisplayEnhancementOverrideCapabilitiesChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCanOverrideChangedToken")) {
            this.remove_CanOverrideChanged(this.__OnCanOverrideChangedToken)
            this.__OnCanOverrideChanged.iface.Dispose()
        }

        if(this.HasProp("__OnIsOverrideActiveChangedToken")) {
            this.remove_IsOverrideActiveChanged(this.__OnIsOverrideActiveChangedToken)
            this.__OnIsOverrideActiveChanged.iface.Dispose()
        }

        if(this.HasProp("__OnDisplayEnhancementOverrideCapabilitiesChangedToken")) {
            this.remove_DisplayEnhancementOverrideCapabilitiesChanged(this.__OnDisplayEnhancementOverrideCapabilitiesChangedToken)
            this.__OnDisplayEnhancementOverrideCapabilitiesChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {ColorOverrideSettings} 
     */
    get_ColorOverrideSettings() {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.get_ColorOverrideSettings()
    }

    /**
     * 
     * @param {ColorOverrideSettings} value 
     * @returns {HRESULT} 
     */
    put_ColorOverrideSettings(value) {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.put_ColorOverrideSettings(value)
    }

    /**
     * 
     * @returns {BrightnessOverrideSettings} 
     */
    get_BrightnessOverrideSettings() {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.get_BrightnessOverrideSettings()
    }

    /**
     * 
     * @param {BrightnessOverrideSettings} value 
     * @returns {HRESULT} 
     */
    put_BrightnessOverrideSettings(value) {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.put_BrightnessOverrideSettings(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanOverride() {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.get_CanOverride()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOverrideActive() {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.get_IsOverrideActive()
    }

    /**
     * Retrieves the current display enhancement overide capabilities.
     * @returns {DisplayEnhancementOverrideCapabilities} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverride.getcurrentdisplayenhancementoverridecapabilities
     */
    GetCurrentDisplayEnhancementOverrideCapabilities() {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.GetCurrentDisplayEnhancementOverrideCapabilities()
    }

    /**
     * Requests that the current display be overridden with the current display override settings.
     * @remarks
     * RequestOverride notifies the system that the current [DisplayEnhancementOverride](displayenhancementoverride.md) object wants to apply its brightness and color settings to the system. It is up to the system to decide if these settings will be applied. Applying settings is atomic: either all settings are applied, or none at all.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverride.requestoverride
     */
    RequestOverride() {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.RequestOverride()
    }

    /**
     * Notifies the system that this display enhancement object no longer wants to apply its settings.
     * @remarks
     * It is permissible to call this without a preceding [RequestOverride](displayenhancementoverride_requestoverride_158486181.md) call.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverride.stopoverride
     */
    StopOverride() {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.StopOverride()
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayEnhancementOverride, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CanOverrideChanged(handler) {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.add_CanOverrideChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CanOverrideChanged(token) {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.remove_CanOverrideChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayEnhancementOverride, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsOverrideActiveChanged(handler) {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.add_IsOverrideActiveChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsOverrideActiveChanged(token) {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.remove_IsOverrideActiveChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayEnhancementOverride, DisplayEnhancementOverrideCapabilitiesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DisplayEnhancementOverrideCapabilitiesChanged(handler) {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.add_DisplayEnhancementOverrideCapabilitiesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DisplayEnhancementOverrideCapabilitiesChanged(token) {
        if (!this.HasProp("__IDisplayEnhancementOverride")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverride := IDisplayEnhancementOverride(outPtr)
        }

        return this.__IDisplayEnhancementOverride.remove_DisplayEnhancementOverrideCapabilitiesChanged(token)
    }

;@endregion Instance Methods
}
