#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechRecognizerUIOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies the UI settings for the [SpeechRecognizer.RecognizeWithUIAsync](speechrecognizer_recognizewithuiasync_1152231907.md) method.
 * @remarks
 * An app retrieves this object through the [SpeechRecognizer.UIOptions](speechrecognizer_uioptions.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizeruioptions
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognizerUIOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechRecognizerUIOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechRecognizerUIOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the example text shown on the **Listening** screen.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizeruioptions.exampletext
     * @type {HSTRING} 
     */
    ExampleText {
        get => this.get_ExampleText()
        set => this.put_ExampleText(value)
    }

    /**
     * Gets or sets the heading text that is displayed on the **Listening** screen. The default is "Listening...".
     * @remarks
     * The default string is automatically localized: If the speech recognizer has an associated language, the default text is shown in that language. Otherwise, the default text is shown in the system language.
     * 
     * You are responsible for localizing a custom string.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizeruioptions.audibleprompt
     * @type {HSTRING} 
     */
    AudiblePrompt {
        get => this.get_AudiblePrompt()
        set => this.put_AudiblePrompt(value)
    }

    /**
     * Gets or sets whether the recognized text is spoken back to the user on the **Heard you say** screen.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizeruioptions.isreadbackenabled
     * @type {Boolean} 
     */
    IsReadBackEnabled {
        get => this.get_IsReadBackEnabled()
        set => this.put_IsReadBackEnabled(value)
    }

    /**
     * Gets or sets whether a **Heard you say** screen is shown to the user after speech recognition is completed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizeruioptions.showconfirmation
     * @type {Boolean} 
     */
    ShowConfirmation {
        get => this.get_ShowConfirmation()
        set => this.put_ShowConfirmation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExampleText() {
        if (!this.HasProp("__ISpeechRecognizerUIOptions")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerUIOptions := ISpeechRecognizerUIOptions(outPtr)
        }

        return this.__ISpeechRecognizerUIOptions.get_ExampleText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ExampleText(value) {
        if (!this.HasProp("__ISpeechRecognizerUIOptions")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerUIOptions := ISpeechRecognizerUIOptions(outPtr)
        }

        return this.__ISpeechRecognizerUIOptions.put_ExampleText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudiblePrompt() {
        if (!this.HasProp("__ISpeechRecognizerUIOptions")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerUIOptions := ISpeechRecognizerUIOptions(outPtr)
        }

        return this.__ISpeechRecognizerUIOptions.get_AudiblePrompt()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AudiblePrompt(value) {
        if (!this.HasProp("__ISpeechRecognizerUIOptions")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerUIOptions := ISpeechRecognizerUIOptions(outPtr)
        }

        return this.__ISpeechRecognizerUIOptions.put_AudiblePrompt(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadBackEnabled() {
        if (!this.HasProp("__ISpeechRecognizerUIOptions")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerUIOptions := ISpeechRecognizerUIOptions(outPtr)
        }

        return this.__ISpeechRecognizerUIOptions.get_IsReadBackEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsReadBackEnabled(value) {
        if (!this.HasProp("__ISpeechRecognizerUIOptions")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerUIOptions := ISpeechRecognizerUIOptions(outPtr)
        }

        return this.__ISpeechRecognizerUIOptions.put_IsReadBackEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowConfirmation() {
        if (!this.HasProp("__ISpeechRecognizerUIOptions")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerUIOptions := ISpeechRecognizerUIOptions(outPtr)
        }

        return this.__ISpeechRecognizerUIOptions.get_ShowConfirmation()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowConfirmation(value) {
        if (!this.HasProp("__ISpeechRecognizerUIOptions")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizerUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizerUIOptions := ISpeechRecognizerUIOptions(outPtr)
        }

        return this.__ISpeechRecognizerUIOptions.put_ShowConfirmation(value)
    }

;@endregion Instance Methods
}
