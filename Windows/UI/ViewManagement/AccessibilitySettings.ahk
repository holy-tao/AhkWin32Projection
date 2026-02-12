#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAccessibilitySettings.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AccessibilitySettings.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to the high contrast accessibility settings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.accessibilitysettings
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class AccessibilitySettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAccessibilitySettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAccessibilitySettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the system high contrast feature is on or off.
     * @remarks
     * This property indicates whether the user wants a high contrast between the colors used for foreground and background visuals. The user controls the setting of the high contrast parameter by using the Ease of Access Center in Control Panel, or another application for customizing the environment.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.accessibilitysettings.highcontrast
     * @type {Boolean} 
     */
    HighContrast {
        get => this.get_HighContrast()
    }

    /**
     * Gets the name of the default high contrast color scheme.
     * @remarks
     * Windows uses the colors defined in the default color scheme to draw UI elements when the high contrast feature is on.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.accessibilitysettings.highcontrastscheme
     * @type {HSTRING} 
     */
    HighContrastScheme {
        get => this.get_HighContrastScheme()
    }

    /**
     * Occurs when the system high contrast feature turns on or off.
     * @type {TypedEventHandler<AccessibilitySettings, IInspectable>}
    */
    OnHighContrastChanged {
        get {
            if(!this.HasProp("__OnHighContrastChanged")){
                this.__OnHighContrastChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f5917e6f-5abf-5e65-b5b4-1b9c8d94e788}"),
                    AccessibilitySettings,
                    IInspectable
                )
                this.__OnHighContrastChangedToken := this.add_HighContrastChanged(this.__OnHighContrastChanged.iface)
            }
            return this.__OnHighContrastChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new [AccessibilitySettings](accessibilitysettings.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.AccessibilitySettings")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnHighContrastChangedToken")) {
            this.remove_HighContrastChanged(this.__OnHighContrastChangedToken)
            this.__OnHighContrastChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HighContrast() {
        if (!this.HasProp("__IAccessibilitySettings")) {
            if ((queryResult := this.QueryInterface(IAccessibilitySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccessibilitySettings := IAccessibilitySettings(outPtr)
        }

        return this.__IAccessibilitySettings.get_HighContrast()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HighContrastScheme() {
        if (!this.HasProp("__IAccessibilitySettings")) {
            if ((queryResult := this.QueryInterface(IAccessibilitySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccessibilitySettings := IAccessibilitySettings(outPtr)
        }

        return this.__IAccessibilitySettings.get_HighContrastScheme()
    }

    /**
     * 
     * @param {TypedEventHandler<AccessibilitySettings, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HighContrastChanged(handler) {
        if (!this.HasProp("__IAccessibilitySettings")) {
            if ((queryResult := this.QueryInterface(IAccessibilitySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccessibilitySettings := IAccessibilitySettings(outPtr)
        }

        return this.__IAccessibilitySettings.add_HighContrastChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_HighContrastChanged(cookie) {
        if (!this.HasProp("__IAccessibilitySettings")) {
            if ((queryResult := this.QueryInterface(IAccessibilitySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccessibilitySettings := IAccessibilitySettings(outPtr)
        }

        return this.__IAccessibilitySettings.remove_HighContrastChanged(cookie)
    }

;@endregion Instance Methods
}
