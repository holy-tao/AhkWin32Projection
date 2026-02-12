#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPenAndInkSettings.ahk
#Include .\IPenAndInkSettings2.ahk
#Include .\IPenAndInkSettingsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides access to user settings related to accepting and converting ink to text input in a text control (when [HandwritingView](../windows.ui.xaml.controls/handwritingview.md) is enabled).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.penandinksettings
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class PenAndInkSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPenAndInkSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPenAndInkSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [PenAndInkSettings](penandinksettings.md) object with default property values.
     * @returns {PenAndInkSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.penandinksettings.getdefault
     */
    static GetDefault() {
        if (!PenAndInkSettings.HasProp("__IPenAndInkSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.PenAndInkSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPenAndInkSettingsStatics.IID)
            PenAndInkSettings.__IPenAndInkSettingsStatics := IPenAndInkSettingsStatics(factoryPtr)
        }

        return PenAndInkSettings.__IPenAndInkSettingsStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets whether ink can be used for text input in a text control (when [HandwritingView](../windows.ui.xaml.controls/handwritingview.md) is enabled).
     * @remarks
     * This value can be set by the user through the *Pen & Windows Ink* settings screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.penandinksettings.ishandwritingdirectlyintotextfieldenabled
     * @type {Boolean} 
     */
    IsHandwritingDirectlyIntoTextFieldEnabled {
        get => this.get_IsHandwritingDirectlyIntoTextFieldEnabled()
    }

    /**
     * Gets the user's preferred hand (left or right) for pen and ink input, and related UI.
     * @remarks
     * This value can be set by the user through the *Pen & Windows Ink* settings screen.
     * 
     * In order to minimize UI being hidden by the user's hand, this setting affects the direction and orientation of menus and other interface elements that are displayed based on pen movement and gestures.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.penandinksettings.penhandedness
     * @type {Integer} 
     */
    PenHandedness {
        get => this.get_PenHandedness()
    }

    /**
     * Gets the handwriting space available when using ink for text input in a text control (when [HandwritingView](../windows.ui.xaml.controls/handwritingview.md) is enabled).
     * @remarks
     * This value can be set by the user through the *Pen & Windows Ink* settings screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.penandinksettings.handwritinglineheight
     * @type {Integer} 
     */
    HandwritingLineHeight {
        get => this.get_HandwritingLineHeight()
    }

    /**
     * Gets the font used for converting ink to text input in a text control (when [HandwritingView](../windows.ui.xaml.controls/handwritingview.md) is enabled).
     * @remarks
     * This value can be set by the user through the *Pen & Windows Ink* settings screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.penandinksettings.fontfamilyname
     * @type {HSTRING} 
     */
    FontFamilyName {
        get => this.get_FontFamilyName()
    }

    /**
     * Gets whether ink/handwriting input telemetry data can be collected and sent to Microsoft for improving recognition and suggestion capabilities.
     * @remarks
     * This value can be set by the user through the *Diagnostics and feedback* settings screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.penandinksettings.userconsentstohandwritingtelemetrycollection
     * @type {Boolean} 
     */
    UserConsentsToHandwritingTelemetryCollection {
        get => this.get_UserConsentsToHandwritingTelemetryCollection()
    }

    /**
     * Gets whether touch inking can be used for text input in a text control (when [HandwritingView](../windows.ui.xaml.controls/handwritingview.md) is enabled).
     * @remarks
     * This value can be set by the user through the *Pen & Windows Ink* settings screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.penandinksettings.istouchhandwritingenabled
     * @type {Boolean} 
     */
    IsTouchHandwritingEnabled {
        get => this.get_IsTouchHandwritingEnabled()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHandwritingDirectlyIntoTextFieldEnabled() {
        if (!this.HasProp("__IPenAndInkSettings")) {
            if ((queryResult := this.QueryInterface(IPenAndInkSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenAndInkSettings := IPenAndInkSettings(outPtr)
        }

        return this.__IPenAndInkSettings.get_IsHandwritingDirectlyIntoTextFieldEnabled()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PenHandedness() {
        if (!this.HasProp("__IPenAndInkSettings")) {
            if ((queryResult := this.QueryInterface(IPenAndInkSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenAndInkSettings := IPenAndInkSettings(outPtr)
        }

        return this.__IPenAndInkSettings.get_PenHandedness()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HandwritingLineHeight() {
        if (!this.HasProp("__IPenAndInkSettings")) {
            if ((queryResult := this.QueryInterface(IPenAndInkSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenAndInkSettings := IPenAndInkSettings(outPtr)
        }

        return this.__IPenAndInkSettings.get_HandwritingLineHeight()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FontFamilyName() {
        if (!this.HasProp("__IPenAndInkSettings")) {
            if ((queryResult := this.QueryInterface(IPenAndInkSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenAndInkSettings := IPenAndInkSettings(outPtr)
        }

        return this.__IPenAndInkSettings.get_FontFamilyName()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UserConsentsToHandwritingTelemetryCollection() {
        if (!this.HasProp("__IPenAndInkSettings")) {
            if ((queryResult := this.QueryInterface(IPenAndInkSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenAndInkSettings := IPenAndInkSettings(outPtr)
        }

        return this.__IPenAndInkSettings.get_UserConsentsToHandwritingTelemetryCollection()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTouchHandwritingEnabled() {
        if (!this.HasProp("__IPenAndInkSettings")) {
            if ((queryResult := this.QueryInterface(IPenAndInkSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenAndInkSettings := IPenAndInkSettings(outPtr)
        }

        return this.__IPenAndInkSettings.get_IsTouchHandwritingEnabled()
    }

    /**
     * Sets the user's preferred hand (left or right) for pen and ink input, and related UI.
     * @remarks
     * This value can be set by the user through the *Pen & Windows Ink* settings screen.
     * 
     * In order to minimize UI being hidden by the user's hand, this setting affects the direction and orientation of menus and other interface elements that are displayed based on pen movement and gestures.
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.penandinksettings.setpenhandedness
     */
    SetPenHandedness(value) {
        if (!this.HasProp("__IPenAndInkSettings2")) {
            if ((queryResult := this.QueryInterface(IPenAndInkSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenAndInkSettings2 := IPenAndInkSettings2(outPtr)
        }

        return this.__IPenAndInkSettings2.SetPenHandedness(value)
    }

;@endregion Instance Methods
}
