#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppWindowTitleBarVisibility.ahk
#Include .\IAppWindowTitleBar.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the title bar of an app window.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class AppWindowTitleBar extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppWindowTitleBarVisibility

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppWindowTitleBarVisibility.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the color of the title bar background.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.backgroundcolor
     * @type {IReference<Color>} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
        set => this.put_BackgroundColor(value)
    }

    /**
     * Gets or sets the background color of the title bar buttons.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.buttonbackgroundcolor
     * @type {IReference<Color>} 
     */
    ButtonBackgroundColor {
        get => this.get_ButtonBackgroundColor()
        set => this.put_ButtonBackgroundColor(value)
    }

    /**
     * Gets or sets the foreground color of the title bar buttons.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.buttonforegroundcolor
     * @type {IReference<Color>} 
     */
    ButtonForegroundColor {
        get => this.get_ButtonForegroundColor()
        set => this.put_ButtonForegroundColor(value)
    }

    /**
     * Gets or sets the background color of a title bar button when the pointer is over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.buttonhoverbackgroundcolor
     * @type {IReference<Color>} 
     */
    ButtonHoverBackgroundColor {
        get => this.get_ButtonHoverBackgroundColor()
        set => this.put_ButtonHoverBackgroundColor(value)
    }

    /**
     * Gets or sets the foreground color of a title bar button when the pointer is over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.buttonhoverforegroundcolor
     * @type {IReference<Color>} 
     */
    ButtonHoverForegroundColor {
        get => this.get_ButtonHoverForegroundColor()
        set => this.put_ButtonHoverForegroundColor(value)
    }

    /**
     * Gets or sets the background color of a title bar button when it's inactive.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.buttoninactivebackgroundcolor
     * @type {IReference<Color>} 
     */
    ButtonInactiveBackgroundColor {
        get => this.get_ButtonInactiveBackgroundColor()
        set => this.put_ButtonInactiveBackgroundColor(value)
    }

    /**
     * Gets or sets the foreground color of a title bar button when it's inactive.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.buttoninactiveforegroundcolor
     * @type {IReference<Color>} 
     */
    ButtonInactiveForegroundColor {
        get => this.get_ButtonInactiveForegroundColor()
        set => this.put_ButtonInactiveForegroundColor(value)
    }

    /**
     * Gets or sets the background color of a title bar button when it's pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.buttonpressedbackgroundcolor
     * @type {IReference<Color>} 
     */
    ButtonPressedBackgroundColor {
        get => this.get_ButtonPressedBackgroundColor()
        set => this.put_ButtonPressedBackgroundColor(value)
    }

    /**
     * Gets or sets the foreground color of a title bar button when it's pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.buttonpressedforegroundcolor
     * @type {IReference<Color>} 
     */
    ButtonPressedForegroundColor {
        get => this.get_ButtonPressedForegroundColor()
        set => this.put_ButtonPressedForegroundColor(value)
    }

    /**
     * Gets or sets a value that specifies whether this title bar should replace the default window title bar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.extendscontentintotitlebar
     * @type {Boolean} 
     */
    ExtendsContentIntoTitleBar {
        get => this.get_ExtendsContentIntoTitleBar()
        set => this.put_ExtendsContentIntoTitleBar(value)
    }

    /**
     * Gets or sets the color of the title bar foreground.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.foregroundcolor
     * @type {IReference<Color>} 
     */
    ForegroundColor {
        get => this.get_ForegroundColor()
        set => this.put_ForegroundColor(value)
    }

    /**
     * Gets or sets the color of the title bar background when it's inactive.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.inactivebackgroundcolor
     * @type {IReference<Color>} 
     */
    InactiveBackgroundColor {
        get => this.get_InactiveBackgroundColor()
        set => this.put_InactiveBackgroundColor(value)
    }

    /**
     * Gets or sets the color of the title bar foreground when it's inactive.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.inactiveforegroundcolor
     * @type {IReference<Color>} 
     */
    InactiveForegroundColor {
        get => this.get_InactiveForegroundColor()
        set => this.put_InactiveForegroundColor(value)
    }

    /**
     * Gets a value that specifies whether this title bar is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.isvisible
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns the preferred visibility mode for the title bar.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.getpreferredvisibility
     */
    GetPreferredVisibility() {
        if (!this.HasProp("__IAppWindowTitleBarVisibility")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBarVisibility.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBarVisibility := IAppWindowTitleBarVisibility(outPtr)
        }

        return this.__IAppWindowTitleBarVisibility.GetPreferredVisibility()
    }

    /**
     * Sets the preferred visibility mode for the title bar.
     * 
     * > [!IMPORTANT]
     * > The **AppWindowTitleBar.SetPreferredVisibility** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @param {Integer} visibilityMode A value of the enumeration that specifies the preferred visibility mode for the title bar.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.setpreferredvisibility
     */
    SetPreferredVisibility(visibilityMode) {
        if (!this.HasProp("__IAppWindowTitleBarVisibility")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBarVisibility.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBarVisibility := IAppWindowTitleBarVisibility(outPtr)
        }

        return this.__IAppWindowTitleBarVisibility.SetPreferredVisibility(visibilityMode)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_BackgroundColor() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.get_BackgroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_BackgroundColor(value) {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.put_BackgroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonBackgroundColor() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.get_ButtonBackgroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonBackgroundColor(value) {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.put_ButtonBackgroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonForegroundColor() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.get_ButtonForegroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonForegroundColor(value) {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.put_ButtonForegroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonHoverBackgroundColor() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.get_ButtonHoverBackgroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonHoverBackgroundColor(value) {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.put_ButtonHoverBackgroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonHoverForegroundColor() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.get_ButtonHoverForegroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonHoverForegroundColor(value) {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.put_ButtonHoverForegroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonInactiveBackgroundColor() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.get_ButtonInactiveBackgroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonInactiveBackgroundColor(value) {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.put_ButtonInactiveBackgroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonInactiveForegroundColor() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.get_ButtonInactiveForegroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonInactiveForegroundColor(value) {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.put_ButtonInactiveForegroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonPressedBackgroundColor() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.get_ButtonPressedBackgroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonPressedBackgroundColor(value) {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.put_ButtonPressedBackgroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonPressedForegroundColor() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.get_ButtonPressedForegroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonPressedForegroundColor(value) {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.put_ButtonPressedForegroundColor(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ExtendsContentIntoTitleBar() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.get_ExtendsContentIntoTitleBar()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ExtendsContentIntoTitleBar(value) {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.put_ExtendsContentIntoTitleBar(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ForegroundColor() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.get_ForegroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ForegroundColor(value) {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.put_ForegroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_InactiveBackgroundColor() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.get_InactiveBackgroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_InactiveBackgroundColor(value) {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.put_InactiveBackgroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_InactiveForegroundColor() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.get_InactiveForegroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_InactiveForegroundColor(value) {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.put_InactiveForegroundColor(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVisible() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.get_IsVisible()
    }

    /**
     * Gets a list of title bar occlusions.
     * @returns {IVectorView<AppWindowTitleBarOcclusion>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebar.gettitlebarocclusions
     */
    GetTitleBarOcclusions() {
        if (!this.HasProp("__IAppWindowTitleBar")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBar := IAppWindowTitleBar(outPtr)
        }

        return this.__IAppWindowTitleBar.GetTitleBarOcclusions()
    }

;@endregion Instance Methods
}
