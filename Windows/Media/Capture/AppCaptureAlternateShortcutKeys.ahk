#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppCaptureAlternateShortcutKeys.ahk
#Include .\IAppCaptureAlternateShortcutKeys2.ahk
#Include .\IAppCaptureAlternateShortcutKeys3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines alternate shortcut keys for app capture.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * Get an instance of this class with the [AlternateShortcutKeys](appcapturesettings_alternateshortcutkeys.md) property.
 * 
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureAlternateShortcutKeys extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppCaptureAlternateShortcutKeys

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppCaptureAlternateShortcutKeys.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the toggle game bar shortcut key.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.togglegamebarkey
     * @type {Integer} 
     */
    ToggleGameBarKey {
        get => this.get_ToggleGameBarKey()
        set => this.put_ToggleGameBarKey(value)
    }

    /**
     * Gets or sets the toggle game bar shortcut key modifiers.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.togglegamebarkeymodifiers
     * @type {Integer} 
     */
    ToggleGameBarKeyModifiers {
        get => this.get_ToggleGameBarKeyModifiers()
        set => this.put_ToggleGameBarKeyModifiers(value)
    }

    /**
     * Gets or sets the save historical video shortcut key.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.savehistoricalvideokey
     * @type {Integer} 
     */
    SaveHistoricalVideoKey {
        get => this.get_SaveHistoricalVideoKey()
        set => this.put_SaveHistoricalVideoKey(value)
    }

    /**
     * Gets or sets the save historical video shortcut key modifiers.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.savehistoricalvideokeymodifiers
     * @type {Integer} 
     */
    SaveHistoricalVideoKeyModifiers {
        get => this.get_SaveHistoricalVideoKeyModifiers()
        set => this.put_SaveHistoricalVideoKeyModifiers(value)
    }

    /**
     * Gets or sets the toggle recording shortcut key.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.togglerecordingkey
     * @type {Integer} 
     */
    ToggleRecordingKey {
        get => this.get_ToggleRecordingKey()
        set => this.put_ToggleRecordingKey(value)
    }

    /**
     * Gets or sets the toggle recording shortcut key modifiers.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.togglerecordingkeymodifiers
     * @type {Integer} 
     */
    ToggleRecordingKeyModifiers {
        get => this.get_ToggleRecordingKeyModifiers()
        set => this.put_ToggleRecordingKeyModifiers(value)
    }

    /**
     * Gets or sets the take screenshot shortcut key.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.takescreenshotkey
     * @type {Integer} 
     */
    TakeScreenshotKey {
        get => this.get_TakeScreenshotKey()
        set => this.put_TakeScreenshotKey(value)
    }

    /**
     * Gets or sets the take screenshot shortcut key modifiers.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.takescreenshotkeymodifiers
     * @type {Integer} 
     */
    TakeScreenshotKeyModifiers {
        get => this.get_TakeScreenshotKeyModifiers()
        set => this.put_TakeScreenshotKeyModifiers(value)
    }

    /**
     * Gets or sets the toggle recording indicator shortcut key.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.togglerecordingindicatorkey
     * @type {Integer} 
     */
    ToggleRecordingIndicatorKey {
        get => this.get_ToggleRecordingIndicatorKey()
        set => this.put_ToggleRecordingIndicatorKey(value)
    }

    /**
     * Gets or sets the toggle recording indicator shortcut key modifiers.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.togglerecordingindicatorkeymodifiers
     * @type {Integer} 
     */
    ToggleRecordingIndicatorKeyModifiers {
        get => this.get_ToggleRecordingIndicatorKeyModifiers()
        set => this.put_ToggleRecordingIndicatorKeyModifiers(value)
    }

    /**
     * Gets or sets the toggle microphone capture shortcut key.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.togglemicrophonecapturekey
     * @type {Integer} 
     */
    ToggleMicrophoneCaptureKey {
        get => this.get_ToggleMicrophoneCaptureKey()
        set => this.put_ToggleMicrophoneCaptureKey(value)
    }

    /**
     * Gets or sets the toggle microphone capture shortcut key modifiers.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.togglemicrophonecapturekeymodifiers
     * @type {Integer} 
     */
    ToggleMicrophoneCaptureKeyModifiers {
        get => this.get_ToggleMicrophoneCaptureKeyModifiers()
        set => this.put_ToggleMicrophoneCaptureKeyModifiers(value)
    }

    /**
     * Gets or sets the toggle camera capture shortcut key.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.togglecameracapturekey
     * @type {Integer} 
     */
    ToggleCameraCaptureKey {
        get => this.get_ToggleCameraCaptureKey()
        set => this.put_ToggleCameraCaptureKey(value)
    }

    /**
     * Gets or sets the toggle camera capture shortcut key modifiers.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.togglecameracapturekeymodifiers
     * @type {Integer} 
     */
    ToggleCameraCaptureKeyModifiers {
        get => this.get_ToggleCameraCaptureKeyModifiers()
        set => this.put_ToggleCameraCaptureKeyModifiers(value)
    }

    /**
     * Gets or sets the toggle broadcast shortcut key.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.togglebroadcastkey
     * @type {Integer} 
     */
    ToggleBroadcastKey {
        get => this.get_ToggleBroadcastKey()
        set => this.put_ToggleBroadcastKey(value)
    }

    /**
     * Gets or sets the toggle broadcast shortcut key modifiers.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturealternateshortcutkeys.togglebroadcastkeymodifiers
     * @type {Integer} 
     */
    ToggleBroadcastKeyModifiers {
        get => this.get_ToggleBroadcastKeyModifiers()
        set => this.put_ToggleBroadcastKeyModifiers(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleGameBarKey(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.put_ToggleGameBarKey(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleGameBarKey() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.get_ToggleGameBarKey()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleGameBarKeyModifiers(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.put_ToggleGameBarKeyModifiers(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleGameBarKeyModifiers() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.get_ToggleGameBarKeyModifiers()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SaveHistoricalVideoKey(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.put_SaveHistoricalVideoKey(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SaveHistoricalVideoKey() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.get_SaveHistoricalVideoKey()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SaveHistoricalVideoKeyModifiers(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.put_SaveHistoricalVideoKeyModifiers(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SaveHistoricalVideoKeyModifiers() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.get_SaveHistoricalVideoKeyModifiers()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleRecordingKey(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.put_ToggleRecordingKey(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleRecordingKey() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.get_ToggleRecordingKey()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleRecordingKeyModifiers(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.put_ToggleRecordingKeyModifiers(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleRecordingKeyModifiers() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.get_ToggleRecordingKeyModifiers()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TakeScreenshotKey(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.put_TakeScreenshotKey(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TakeScreenshotKey() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.get_TakeScreenshotKey()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TakeScreenshotKeyModifiers(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.put_TakeScreenshotKeyModifiers(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TakeScreenshotKeyModifiers() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.get_TakeScreenshotKeyModifiers()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleRecordingIndicatorKey(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.put_ToggleRecordingIndicatorKey(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleRecordingIndicatorKey() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.get_ToggleRecordingIndicatorKey()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleRecordingIndicatorKeyModifiers(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.put_ToggleRecordingIndicatorKeyModifiers(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleRecordingIndicatorKeyModifiers() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys := IAppCaptureAlternateShortcutKeys(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys.get_ToggleRecordingIndicatorKeyModifiers()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleMicrophoneCaptureKey(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys2")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys2 := IAppCaptureAlternateShortcutKeys2(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys2.put_ToggleMicrophoneCaptureKey(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleMicrophoneCaptureKey() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys2")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys2 := IAppCaptureAlternateShortcutKeys2(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys2.get_ToggleMicrophoneCaptureKey()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleMicrophoneCaptureKeyModifiers(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys2")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys2 := IAppCaptureAlternateShortcutKeys2(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys2.put_ToggleMicrophoneCaptureKeyModifiers(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleMicrophoneCaptureKeyModifiers() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys2")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys2 := IAppCaptureAlternateShortcutKeys2(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys2.get_ToggleMicrophoneCaptureKeyModifiers()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleCameraCaptureKey(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys3")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys3 := IAppCaptureAlternateShortcutKeys3(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys3.put_ToggleCameraCaptureKey(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleCameraCaptureKey() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys3")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys3 := IAppCaptureAlternateShortcutKeys3(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys3.get_ToggleCameraCaptureKey()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleCameraCaptureKeyModifiers(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys3")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys3 := IAppCaptureAlternateShortcutKeys3(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys3.put_ToggleCameraCaptureKeyModifiers(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleCameraCaptureKeyModifiers() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys3")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys3 := IAppCaptureAlternateShortcutKeys3(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys3.get_ToggleCameraCaptureKeyModifiers()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleBroadcastKey(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys3")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys3 := IAppCaptureAlternateShortcutKeys3(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys3.put_ToggleBroadcastKey(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleBroadcastKey() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys3")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys3 := IAppCaptureAlternateShortcutKeys3(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys3.get_ToggleBroadcastKey()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleBroadcastKeyModifiers(value) {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys3")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys3 := IAppCaptureAlternateShortcutKeys3(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys3.put_ToggleBroadcastKeyModifiers(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleBroadcastKeyModifiers() {
        if (!this.HasProp("__IAppCaptureAlternateShortcutKeys3")) {
            if ((queryResult := this.QueryInterface(IAppCaptureAlternateShortcutKeys3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureAlternateShortcutKeys3 := IAppCaptureAlternateShortcutKeys3(outPtr)
        }

        return this.__IAppCaptureAlternateShortcutKeys3.get_ToggleBroadcastKeyModifiers()
    }

;@endregion Instance Methods
}
