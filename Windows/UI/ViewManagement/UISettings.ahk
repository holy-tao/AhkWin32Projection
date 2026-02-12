#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUISettings.ahk
#Include .\IUISettings2.ahk
#Include .\IUISettings3.ahk
#Include .\IUISettings4.ahk
#Include .\IUISettings5.ahk
#Include .\IUISettings6.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\UISettings.ahk
#Include .\UISettingsAutoHideScrollBarsChangedEventArgs.ahk
#Include .\UISettingsAnimationsEnabledChangedEventArgs.ahk
#Include .\UISettingsMessageDurationChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Contains a set of common app user interface settings and operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class UISettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUISettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUISettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the directional preference of the user interface created by the app view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.handpreference
     * @type {Integer} 
     */
    HandPreference {
        get => this.get_HandPreference()
    }

    /**
     * Gets the size of a new cursor created by the app view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.cursorsize
     * @type {SIZE} 
     */
    CursorSize {
        get => this.get_CursorSize()
    }

    /**
     * Gets the size of a scroll bar for windows associated with the app view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.scrollbarsize
     * @type {SIZE} 
     */
    ScrollBarSize {
        get => this.get_ScrollBarSize()
    }

    /**
     * Gets the size of a scroll bar arrow for windows associated with the app view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.scrollbararrowsize
     * @type {SIZE} 
     */
    ScrollBarArrowSize {
        get => this.get_ScrollBarArrowSize()
    }

    /**
     * Gets the size of a thumb box for windows associated with the app view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.scrollbarthumbboxsize
     * @type {SIZE} 
     */
    ScrollBarThumbBoxSize {
        get => this.get_ScrollBarThumbBoxSize()
    }

    /**
     * Gets the length of time a message is displayed for the app view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.messageduration
     * @type {Integer} 
     */
    MessageDuration {
        get => this.get_MessageDuration()
    }

    /**
     * Gets whether animations are enabled for the user interface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.animationsenabled
     * @type {Boolean} 
     */
    AnimationsEnabled {
        get => this.get_AnimationsEnabled()
    }

    /**
     * Gets whether the caret can be used for browse operations.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.caretbrowsingenabled
     * @type {Boolean} 
     */
    CaretBrowsingEnabled {
        get => this.get_CaretBrowsingEnabled()
    }

    /**
     * Gets the blink rate of a new caret created by the app view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.caretblinkrate
     * @type {Integer} 
     */
    CaretBlinkRate {
        get => this.get_CaretBlinkRate()
    }

    /**
     * Gets the width of a new caret created by the app view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.caretwidth
     * @type {Integer} 
     */
    CaretWidth {
        get => this.get_CaretWidth()
    }

    /**
     * Gets the maximum allowed time between clicks in a double-click operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.doubleclicktime
     * @type {Integer} 
     */
    DoubleClickTime {
        get => this.get_DoubleClickTime()
    }

    /**
     * Gets the amount of time the mouse pointer can rest in a hover rectangle before a hover event is raised.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.mousehovertime
     * @type {Integer} 
     */
    MouseHoverTime {
        get => this.get_MouseHoverTime()
    }

    /**
     * Gets the value of the system text size setting.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.textscalefactor
     * @type {Float} 
     */
    TextScaleFactor {
        get => this.get_TextScaleFactor()
    }

    /**
     * Gets a value that indicates whether the system Transparency effects setting is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.advancedeffectsenabled
     * @type {Boolean} 
     */
    AdvancedEffectsEnabled {
        get => this.get_AdvancedEffectsEnabled()
    }

    /**
     * Gets whether the user has specified that scroll bars should be automatically hidden when not being interacted with.
     * @remarks
     * This property is intended for handling mouse cursor proximity in custom UI frameworks and custom scroll bar implementations.
     * 
     * This property returns the specified user setting, not whether a specific scroll bar is visible.
     * 
     * You must manage all view updates that might be required when hiding or displaying the scroll bar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.autohidescrollbars
     * @type {Boolean} 
     */
    AutoHideScrollBars {
        get => this.get_AutoHideScrollBars()
    }

    /**
     * Occurs when the system text size setting is changed.
     * @remarks
     * The value ranges from 1 to 2.25.
     * 
     * >[!NOTE]
     * > Not all text is scaled by the same factor. Generally speaking, the larger text is, the less it’s affected by scaling.
     * @type {TypedEventHandler<UISettings, IInspectable>}
    */
    OnTextScaleFactorChanged {
        get {
            if(!this.HasProp("__OnTextScaleFactorChanged")){
                this.__OnTextScaleFactorChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2dbdba9d-20da-519d-9078-09f835bc5bc7}"),
                    UISettings,
                    IInspectable
                )
                this.__OnTextScaleFactorChangedToken := this.add_TextScaleFactorChanged(this.__OnTextScaleFactorChanged.iface)
            }
            return this.__OnTextScaleFactorChanged
        }
    }

    /**
     * Occurs when color values have changed.
     * @type {TypedEventHandler<UISettings, IInspectable>}
    */
    OnColorValuesChanged {
        get {
            if(!this.HasProp("__OnColorValuesChanged")){
                this.__OnColorValuesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2dbdba9d-20da-519d-9078-09f835bc5bc7}"),
                    UISettings,
                    IInspectable
                )
                this.__OnColorValuesChangedToken := this.add_ColorValuesChanged(this.__OnColorValuesChanged.iface)
            }
            return this.__OnColorValuesChanged
        }
    }

    /**
     * Occurs when the system advanced UI effects setting is enabled or disabled.
     * @type {TypedEventHandler<UISettings, IInspectable>}
    */
    OnAdvancedEffectsEnabledChanged {
        get {
            if(!this.HasProp("__OnAdvancedEffectsEnabledChanged")){
                this.__OnAdvancedEffectsEnabledChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2dbdba9d-20da-519d-9078-09f835bc5bc7}"),
                    UISettings,
                    IInspectable
                )
                this.__OnAdvancedEffectsEnabledChangedToken := this.add_AdvancedEffectsEnabledChanged(this.__OnAdvancedEffectsEnabledChanged.iface)
            }
            return this.__OnAdvancedEffectsEnabledChanged
        }
    }

    /**
     * Event invoked when the [AutoHideScrollBars](uisettings_autohidescrollbars.md) state changes.
     * @remarks
     * A handler for this event is called on a worker thread, not the calling thread.
     * @type {TypedEventHandler<UISettings, UISettingsAutoHideScrollBarsChangedEventArgs>}
    */
    OnAutoHideScrollBarsChanged {
        get {
            if(!this.HasProp("__OnAutoHideScrollBarsChanged")){
                this.__OnAutoHideScrollBarsChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{808aef30-2660-51b0-9c11-f75dd42006b4}"),
                    UISettings,
                    UISettingsAutoHideScrollBarsChangedEventArgs
                )
                this.__OnAutoHideScrollBarsChangedToken := this.add_AutoHideScrollBarsChanged(this.__OnAutoHideScrollBarsChanged.iface)
            }
            return this.__OnAutoHideScrollBarsChanged
        }
    }

    /**
     * Occurs when the value of the [AnimationsEnabled](uisettings_animationsenabled.md) property has changed.
     * @type {TypedEventHandler<UISettings, UISettingsAnimationsEnabledChangedEventArgs>}
    */
    OnAnimationsEnabledChanged {
        get {
            if(!this.HasProp("__OnAnimationsEnabledChanged")){
                this.__OnAnimationsEnabledChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{deff0f90-59e1-5859-a245-3d275081c2ad}"),
                    UISettings,
                    UISettingsAnimationsEnabledChangedEventArgs
                )
                this.__OnAnimationsEnabledChangedToken := this.add_AnimationsEnabledChanged(this.__OnAnimationsEnabledChanged.iface)
            }
            return this.__OnAnimationsEnabledChanged
        }
    }

    /**
     * Occurs when the value of the [MessageDuration](uisettings_messageduration.md) property has changed.
     * @type {TypedEventHandler<UISettings, UISettingsMessageDurationChangedEventArgs>}
    */
    OnMessageDurationChanged {
        get {
            if(!this.HasProp("__OnMessageDurationChanged")){
                this.__OnMessageDurationChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ec807b08-1ac6-5b37-9af7-1aaf1c93577e}"),
                    UISettings,
                    UISettingsMessageDurationChangedEventArgs
                )
                this.__OnMessageDurationChangedToken := this.add_MessageDurationChanged(this.__OnMessageDurationChanged.iface)
            }
            return this.__OnMessageDurationChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new default instance of the [UISettings](uisettings.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.UISettings")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTextScaleFactorChangedToken")) {
            this.remove_TextScaleFactorChanged(this.__OnTextScaleFactorChangedToken)
            this.__OnTextScaleFactorChanged.iface.Dispose()
        }

        if(this.HasProp("__OnColorValuesChangedToken")) {
            this.remove_ColorValuesChanged(this.__OnColorValuesChangedToken)
            this.__OnColorValuesChanged.iface.Dispose()
        }

        if(this.HasProp("__OnAdvancedEffectsEnabledChangedToken")) {
            this.remove_AdvancedEffectsEnabledChanged(this.__OnAdvancedEffectsEnabledChangedToken)
            this.__OnAdvancedEffectsEnabledChanged.iface.Dispose()
        }

        if(this.HasProp("__OnAutoHideScrollBarsChangedToken")) {
            this.remove_AutoHideScrollBarsChanged(this.__OnAutoHideScrollBarsChangedToken)
            this.__OnAutoHideScrollBarsChanged.iface.Dispose()
        }

        if(this.HasProp("__OnAnimationsEnabledChangedToken")) {
            this.remove_AnimationsEnabledChanged(this.__OnAnimationsEnabledChangedToken)
            this.__OnAnimationsEnabledChanged.iface.Dispose()
        }

        if(this.HasProp("__OnMessageDurationChangedToken")) {
            this.remove_MessageDurationChanged(this.__OnMessageDurationChangedToken)
            this.__OnMessageDurationChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HandPreference() {
        if (!this.HasProp("__IUISettings")) {
            if ((queryResult := this.QueryInterface(IUISettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings := IUISettings(outPtr)
        }

        return this.__IUISettings.get_HandPreference()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_CursorSize() {
        if (!this.HasProp("__IUISettings")) {
            if ((queryResult := this.QueryInterface(IUISettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings := IUISettings(outPtr)
        }

        return this.__IUISettings.get_CursorSize()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_ScrollBarSize() {
        if (!this.HasProp("__IUISettings")) {
            if ((queryResult := this.QueryInterface(IUISettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings := IUISettings(outPtr)
        }

        return this.__IUISettings.get_ScrollBarSize()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_ScrollBarArrowSize() {
        if (!this.HasProp("__IUISettings")) {
            if ((queryResult := this.QueryInterface(IUISettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings := IUISettings(outPtr)
        }

        return this.__IUISettings.get_ScrollBarArrowSize()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_ScrollBarThumbBoxSize() {
        if (!this.HasProp("__IUISettings")) {
            if ((queryResult := this.QueryInterface(IUISettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings := IUISettings(outPtr)
        }

        return this.__IUISettings.get_ScrollBarThumbBoxSize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageDuration() {
        if (!this.HasProp("__IUISettings")) {
            if ((queryResult := this.QueryInterface(IUISettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings := IUISettings(outPtr)
        }

        return this.__IUISettings.get_MessageDuration()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AnimationsEnabled() {
        if (!this.HasProp("__IUISettings")) {
            if ((queryResult := this.QueryInterface(IUISettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings := IUISettings(outPtr)
        }

        return this.__IUISettings.get_AnimationsEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CaretBrowsingEnabled() {
        if (!this.HasProp("__IUISettings")) {
            if ((queryResult := this.QueryInterface(IUISettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings := IUISettings(outPtr)
        }

        return this.__IUISettings.get_CaretBrowsingEnabled()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CaretBlinkRate() {
        if (!this.HasProp("__IUISettings")) {
            if ((queryResult := this.QueryInterface(IUISettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings := IUISettings(outPtr)
        }

        return this.__IUISettings.get_CaretBlinkRate()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CaretWidth() {
        if (!this.HasProp("__IUISettings")) {
            if ((queryResult := this.QueryInterface(IUISettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings := IUISettings(outPtr)
        }

        return this.__IUISettings.get_CaretWidth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DoubleClickTime() {
        if (!this.HasProp("__IUISettings")) {
            if ((queryResult := this.QueryInterface(IUISettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings := IUISettings(outPtr)
        }

        return this.__IUISettings.get_DoubleClickTime()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MouseHoverTime() {
        if (!this.HasProp("__IUISettings")) {
            if ((queryResult := this.QueryInterface(IUISettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings := IUISettings(outPtr)
        }

        return this.__IUISettings.get_MouseHoverTime()
    }

    /**
     * Gets the color used for a specific user interface element type, such as a button face or window text.
     * @param {Integer} desiredElement The type of element for which the color will be obtained.
     * @returns {Color} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.uielementcolor
     */
    UIElementColor(desiredElement) {
        if (!this.HasProp("__IUISettings")) {
            if ((queryResult := this.QueryInterface(IUISettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings := IUISettings(outPtr)
        }

        return this.__IUISettings.UIElementColor(desiredElement)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TextScaleFactor() {
        if (!this.HasProp("__IUISettings2")) {
            if ((queryResult := this.QueryInterface(IUISettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings2 := IUISettings2(outPtr)
        }

        return this.__IUISettings2.get_TextScaleFactor()
    }

    /**
     * 
     * @param {TypedEventHandler<UISettings, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextScaleFactorChanged(handler) {
        if (!this.HasProp("__IUISettings2")) {
            if ((queryResult := this.QueryInterface(IUISettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings2 := IUISettings2(outPtr)
        }

        return this.__IUISettings2.add_TextScaleFactorChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_TextScaleFactorChanged(cookie) {
        if (!this.HasProp("__IUISettings2")) {
            if ((queryResult := this.QueryInterface(IUISettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings2 := IUISettings2(outPtr)
        }

        return this.__IUISettings2.remove_TextScaleFactorChanged(cookie)
    }

    /**
     * Returns the color value of the specified color type.
     * @remarks
     * The [UIColorType.Complement](uicolortype.md) value is not supported and will cause an exception if used as the *desiredColor* parameter.
     * @param {Integer} desiredColor An enumeration value that specifies the type of color to get a value for.
     * @returns {Color} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uisettings.getcolorvalue
     */
    GetColorValue(desiredColor) {
        if (!this.HasProp("__IUISettings3")) {
            if ((queryResult := this.QueryInterface(IUISettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings3 := IUISettings3(outPtr)
        }

        return this.__IUISettings3.GetColorValue(desiredColor)
    }

    /**
     * 
     * @param {TypedEventHandler<UISettings, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ColorValuesChanged(handler) {
        if (!this.HasProp("__IUISettings3")) {
            if ((queryResult := this.QueryInterface(IUISettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings3 := IUISettings3(outPtr)
        }

        return this.__IUISettings3.add_ColorValuesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ColorValuesChanged(cookie) {
        if (!this.HasProp("__IUISettings3")) {
            if ((queryResult := this.QueryInterface(IUISettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings3 := IUISettings3(outPtr)
        }

        return this.__IUISettings3.remove_ColorValuesChanged(cookie)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AdvancedEffectsEnabled() {
        if (!this.HasProp("__IUISettings4")) {
            if ((queryResult := this.QueryInterface(IUISettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings4 := IUISettings4(outPtr)
        }

        return this.__IUISettings4.get_AdvancedEffectsEnabled()
    }

    /**
     * 
     * @param {TypedEventHandler<UISettings, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AdvancedEffectsEnabledChanged(handler) {
        if (!this.HasProp("__IUISettings4")) {
            if ((queryResult := this.QueryInterface(IUISettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings4 := IUISettings4(outPtr)
        }

        return this.__IUISettings4.add_AdvancedEffectsEnabledChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_AdvancedEffectsEnabledChanged(cookie) {
        if (!this.HasProp("__IUISettings4")) {
            if ((queryResult := this.QueryInterface(IUISettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings4 := IUISettings4(outPtr)
        }

        return this.__IUISettings4.remove_AdvancedEffectsEnabledChanged(cookie)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoHideScrollBars() {
        if (!this.HasProp("__IUISettings5")) {
            if ((queryResult := this.QueryInterface(IUISettings5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings5 := IUISettings5(outPtr)
        }

        return this.__IUISettings5.get_AutoHideScrollBars()
    }

    /**
     * 
     * @param {TypedEventHandler<UISettings, UISettingsAutoHideScrollBarsChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AutoHideScrollBarsChanged(handler) {
        if (!this.HasProp("__IUISettings5")) {
            if ((queryResult := this.QueryInterface(IUISettings5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings5 := IUISettings5(outPtr)
        }

        return this.__IUISettings5.add_AutoHideScrollBarsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AutoHideScrollBarsChanged(token) {
        if (!this.HasProp("__IUISettings5")) {
            if ((queryResult := this.QueryInterface(IUISettings5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings5 := IUISettings5(outPtr)
        }

        return this.__IUISettings5.remove_AutoHideScrollBarsChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UISettings, UISettingsAnimationsEnabledChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AnimationsEnabledChanged(handler) {
        if (!this.HasProp("__IUISettings6")) {
            if ((queryResult := this.QueryInterface(IUISettings6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings6 := IUISettings6(outPtr)
        }

        return this.__IUISettings6.add_AnimationsEnabledChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AnimationsEnabledChanged(token) {
        if (!this.HasProp("__IUISettings6")) {
            if ((queryResult := this.QueryInterface(IUISettings6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings6 := IUISettings6(outPtr)
        }

        return this.__IUISettings6.remove_AnimationsEnabledChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UISettings, UISettingsMessageDurationChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MessageDurationChanged(handler) {
        if (!this.HasProp("__IUISettings6")) {
            if ((queryResult := this.QueryInterface(IUISettings6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings6 := IUISettings6(outPtr)
        }

        return this.__IUISettings6.add_MessageDurationChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MessageDurationChanged(token) {
        if (!this.HasProp("__IUISettings6")) {
            if ((queryResult := this.QueryInterface(IUISettings6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUISettings6 := IUISettings6(outPtr)
        }

        return this.__IUISettings6.remove_MessageDurationChanged(token)
    }

;@endregion Instance Methods
}
