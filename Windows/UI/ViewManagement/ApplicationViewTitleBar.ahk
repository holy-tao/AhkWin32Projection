#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApplicationViewTitleBar.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the title bar of an app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtitlebar
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ApplicationViewTitleBar extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IApplicationViewTitleBar

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IApplicationViewTitleBar.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the color of the title bar foreground.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtitlebar.foregroundcolor
     * @type {IReference<Color>} 
     */
    ForegroundColor {
        get => this.get_ForegroundColor()
        set => this.put_ForegroundColor(value)
    }

    /**
     * Gets or sets the color of the title bar background.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtitlebar.backgroundcolor
     * @type {IReference<Color>} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
        set => this.put_BackgroundColor(value)
    }

    /**
     * Gets or sets the foreground color of the title bar buttons.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtitlebar.buttonforegroundcolor
     * @type {IReference<Color>} 
     */
    ButtonForegroundColor {
        get => this.get_ButtonForegroundColor()
        set => this.put_ButtonForegroundColor(value)
    }

    /**
     * Gets or sets the background color of the title bar buttons.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtitlebar.buttonbackgroundcolor
     * @type {IReference<Color>} 
     */
    ButtonBackgroundColor {
        get => this.get_ButtonBackgroundColor()
        set => this.put_ButtonBackgroundColor(value)
    }

    /**
     * Gets or sets the foreground color of a title bar button when the pointer is over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtitlebar.buttonhoverforegroundcolor
     * @type {IReference<Color>} 
     */
    ButtonHoverForegroundColor {
        get => this.get_ButtonHoverForegroundColor()
        set => this.put_ButtonHoverForegroundColor(value)
    }

    /**
     * Gets or sets the background color of a title bar button when the pointer is over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtitlebar.buttonhoverbackgroundcolor
     * @type {IReference<Color>} 
     */
    ButtonHoverBackgroundColor {
        get => this.get_ButtonHoverBackgroundColor()
        set => this.put_ButtonHoverBackgroundColor(value)
    }

    /**
     * Gets or sets the foreground color of a title bar button when it's pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtitlebar.buttonpressedforegroundcolor
     * @type {IReference<Color>} 
     */
    ButtonPressedForegroundColor {
        get => this.get_ButtonPressedForegroundColor()
        set => this.put_ButtonPressedForegroundColor(value)
    }

    /**
     * Gets or sets the background color of a title bar button when it's pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtitlebar.buttonpressedbackgroundcolor
     * @type {IReference<Color>} 
     */
    ButtonPressedBackgroundColor {
        get => this.get_ButtonPressedBackgroundColor()
        set => this.put_ButtonPressedBackgroundColor(value)
    }

    /**
     * Gets or sets the color of the title bar foreground when it's inactive.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtitlebar.inactiveforegroundcolor
     * @type {IReference<Color>} 
     */
    InactiveForegroundColor {
        get => this.get_InactiveForegroundColor()
        set => this.put_InactiveForegroundColor(value)
    }

    /**
     * Gets or sets the color of the title bar background when it's inactive.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtitlebar.inactivebackgroundcolor
     * @type {IReference<Color>} 
     */
    InactiveBackgroundColor {
        get => this.get_InactiveBackgroundColor()
        set => this.put_InactiveBackgroundColor(value)
    }

    /**
     * Gets or sets the foreground color of a title bar button when it's inactive.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtitlebar.buttoninactiveforegroundcolor
     * @type {IReference<Color>} 
     */
    ButtonInactiveForegroundColor {
        get => this.get_ButtonInactiveForegroundColor()
        set => this.put_ButtonInactiveForegroundColor(value)
    }

    /**
     * Gets or sets the background color of a title bar button when it's inactive.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtitlebar.buttoninactivebackgroundcolor
     * @type {IReference<Color>} 
     */
    ButtonInactiveBackgroundColor {
        get => this.get_ButtonInactiveBackgroundColor()
        set => this.put_ButtonInactiveBackgroundColor(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ForegroundColor(value) {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.put_ForegroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ForegroundColor() {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.get_ForegroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_BackgroundColor(value) {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.put_BackgroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_BackgroundColor() {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.get_BackgroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonForegroundColor(value) {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.put_ButtonForegroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonForegroundColor() {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.get_ButtonForegroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonBackgroundColor(value) {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.put_ButtonBackgroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonBackgroundColor() {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.get_ButtonBackgroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonHoverForegroundColor(value) {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.put_ButtonHoverForegroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonHoverForegroundColor() {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.get_ButtonHoverForegroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonHoverBackgroundColor(value) {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.put_ButtonHoverBackgroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonHoverBackgroundColor() {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.get_ButtonHoverBackgroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonPressedForegroundColor(value) {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.put_ButtonPressedForegroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonPressedForegroundColor() {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.get_ButtonPressedForegroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonPressedBackgroundColor(value) {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.put_ButtonPressedBackgroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonPressedBackgroundColor() {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.get_ButtonPressedBackgroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_InactiveForegroundColor(value) {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.put_InactiveForegroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_InactiveForegroundColor() {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.get_InactiveForegroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_InactiveBackgroundColor(value) {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.put_InactiveBackgroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_InactiveBackgroundColor() {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.get_InactiveBackgroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonInactiveForegroundColor(value) {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.put_ButtonInactiveForegroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonInactiveForegroundColor() {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.get_ButtonInactiveForegroundColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonInactiveBackgroundColor(value) {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.put_ButtonInactiveBackgroundColor(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonInactiveBackgroundColor() {
        if (!this.HasProp("__IApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTitleBar := IApplicationViewTitleBar(outPtr)
        }

        return this.__IApplicationViewTitleBar.get_ButtonInactiveBackgroundColor()
    }

;@endregion Instance Methods
}
