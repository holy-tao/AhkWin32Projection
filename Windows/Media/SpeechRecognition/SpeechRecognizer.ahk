#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechRecognizer.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ISpeechRecognizer2.ahk
#Include .\ISpeechRecognizerStatics.ahk
#Include .\ISpeechRecognizerFactory.ahk
#Include .\ISpeechRecognizerStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SpeechRecognizer.ahk
#Include .\SpeechRecognitionQualityDegradingEventArgs.ahk
#Include .\SpeechRecognizerStateChangedEventArgs.ahk
#Include .\SpeechRecognitionHypothesisGeneratedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Enables speech recognition with either a default or a custom graphical user interface (GUI).
 * @remarks
 * [CompileConstraintsAsync](speechrecognizer_compileconstraintsasync_1901700993.md) must always be called before [RecognizeAsync](speechrecognizer_recognizeasync_748427924.md) or [RecognizeWithUIAsync](speechrecognizer_recognizewithuiasync_1152231907.md), even if no constraints are specified in the [Constraints](speechrecognizer_constraints.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognizer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechRecognizer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechRecognizer.IID

    /**
     * Gets the speech language of the device specified in **Settings &gt; Time &amp; Language &gt; Speech**.
     * @remarks
     * Speech languages are added from the **Settings &gt; Time &amp; Language &gt; Region &amp; language** screen.
     * 
     * 1. Click **Add a language**.
     * 1. Select a language from the **Add a language** screen.
     * 1. Depending on the language selected, a language region screen might be displayed. Select the region.
     * 1. From the **Settings &gt; Time &amp; Language &gt; Region &amp; language** screen, select the language and click **Options**.
     * 1. If a speech language is available for the selected language and region, a **Download** button is displayed on the **Language options** screen. Click this button to download and install the speech language.
     * 
     * If no language is specified in the [SpeechRecognizer()](speechrecognizer_speechrecognizer_1221375020.md) constructor, [CurrentLanguage](speechrecognizer_currentlanguage.md) is initialized with the value of SystemSpeechLanguage.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.systemspeechlanguage
     * @type {Language} 
     */
    static SystemSpeechLanguage {
        get => SpeechRecognizer.get_SystemSpeechLanguage()
    }

    /**
     * Gets the collection of languages supported by the pre-defined, web-service grammars of the [SpeechRecognitionTopicConstraint](speechrecognitiontopicconstraint.md) objects specified in the [Constraints](speechrecognizer_constraints.md) property.
     * @remarks
     * Constraints, or grammars, define the spoken words and phrases that can be matched by the speech recognizer. You can specify one of the pre-defined, web-service grammars or you can create a custom grammar that is installed with your app.
     * 
     * Predefined dictation and web-search grammars provide speech recognition for your app without requiring you to author a grammar. When using these grammars, speech recognition is performed by a remote web service and the results are returned to the device
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.supportedtopiclanguages
     * @type {IVectorView<Language>} 
     */
    static SupportedTopicLanguages {
        get => SpeechRecognizer.get_SupportedTopicLanguages()
    }

    /**
     * Gets the collection of languages supported by the custom grammars of the [SpeechRecognitionGrammarFileConstraint](speechrecognitiongrammarfileconstraint.md) and [SpeechRecognitionListConstraint](speechrecognitionlistconstraint.md) objects specified in the [Constraints](speechrecognizer_constraints.md) property.
     * @remarks
     * Constraints, or grammars, define the spoken words and phrases that can be matched by the speech recognizer. You can specify one of the pre-defined, web-service grammars or you can create a custom grammar, described here, that is installed with your app (speech recognition using a custom constraint is performed on the device).
     * + Programmatic list constraints provide a lightweight approach to creating simple grammars using a list of words or phrases. A list constraint works well for recognizing short, distinct phrases. Explicitly specifying all words in a grammar also improves recognition accuracy, as the speech recognition engine must only process speech to confirm a match. The list can also be programmatically updated.
     * + A Speech Recognition Grammar Specification (SRGS) grammar is a static document that, unlike a programmatic list constraint, uses the XML format defined by the [ Version 1.0](https://www.w3.org/TR/speech-grammar/). An Speech Recognition Grammar Specification (SRGS) grammar provides the greatest control over the speech recognition experience by letting you capture multiple semantic meanings in a single recognition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.supportedgrammarlanguages
     * @type {IVectorView<Language>} 
     */
    static SupportedGrammarLanguages {
        get => SpeechRecognizer.get_SupportedGrammarLanguages()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Language} 
     */
    static get_SystemSpeechLanguage() {
        if (!SpeechRecognizer.HasProp("__ISpeechRecognizerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechRecognition.SpeechRecognizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpeechRecognizerStatics.IID)
            SpeechRecognizer.__ISpeechRecognizerStatics := ISpeechRecognizerStatics(factoryPtr)
        }

        return SpeechRecognizer.__ISpeechRecognizerStatics.get_SystemSpeechLanguage()
    }

    /**
     * 
     * @returns {IVectorView<Language>} 
     */
    static get_SupportedTopicLanguages() {
        if (!SpeechRecognizer.HasProp("__ISpeechRecognizerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechRecognition.SpeechRecognizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpeechRecognizerStatics.IID)
            SpeechRecognizer.__ISpeechRecognizerStatics := ISpeechRecognizerStatics(factoryPtr)
        }

        return SpeechRecognizer.__ISpeechRecognizerStatics.get_SupportedTopicLanguages()
    }

    /**
     * 
     * @returns {IVectorView<Language>} 
     */
    static get_SupportedGrammarLanguages() {
        if (!SpeechRecognizer.HasProp("__ISpeechRecognizerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechRecognition.SpeechRecognizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpeechRecognizerStatics.IID)
            SpeechRecognizer.__ISpeechRecognizerStatics := ISpeechRecognizerStatics(factoryPtr)
        }

        return SpeechRecognizer.__ISpeechRecognizerStatics.get_SupportedGrammarLanguages()
    }

    /**
     * Creates a new instance of the [SpeechRecognizer](speechrecognizer.md) class with a language specifier.
     * @remarks
     * Asynchronously starts a speech recognition session that includes additional UI mechanisms, including prompts, examples, text-to-speech (TTS), and confirmations.
     * 
     * [CurrentLanguage](speechrecognizer_currentlanguage.md) is set to the value of *language*.
     * @param {Language} language_ The spoken language to use for recognition.
     * @returns {SpeechRecognizer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.#ctor
     */
    static Create(language_) {
        if (!SpeechRecognizer.HasProp("__ISpeechRecognizerFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechRecognition.SpeechRecognizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpeechRecognizerFactory.IID)
            SpeechRecognizer.__ISpeechRecognizerFactory := ISpeechRecognizerFactory(factoryPtr)
        }

        return SpeechRecognizer.__ISpeechRecognizerFactory.Create(language_)
    }

    /**
     * Asynchronously attempts to set the system language used for speech recognition on an [IoT](https://developer.microsoft.com/en-us/windows/iot) device.
     * 
     * > [!NOTE]
     * > This method is available only in [Embedded mode](/windows/iot-core/develop-your-app/EmbeddedMode).
     * @remarks
     * Your app must declare the **systemManagement** capability, which lets apps access basic system administration privileges including locale, timezone, shut down, and reboot.
     * 
     * The systemManagement capability must include the iot namespace when you declare it in your app's package manifest.
     * 
     * ```xml
     * <Capabilities><iot:Capability Name="systemManagement"/></Capabilities>
     * ```
     * 
     * Use [SystemSpeechLanguage](speechrecognizer_systemspeechlanguage.md) to get the current system speech recognition language.
     * 
     * Use [Windows.Globalization.Language.IsWellFormed](/uwp/api/windows.globalization.language#Windows_Globalization_Language_IsWellFormed_System_String_) to validate *speechLanguage*.
     * @param {Language} speechLanguage The  [BCP-47](https://aka.ms/bcp47)-based system language used for speech recognition.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.trysetsystemspeechlanguageasync
     */
    static TrySetSystemSpeechLanguageAsync(speechLanguage) {
        if (!SpeechRecognizer.HasProp("__ISpeechRecognizerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechRecognition.SpeechRecognizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpeechRecognizerStatics2.IID)
            SpeechRecognizer.__ISpeechRecognizerStatics2 := ISpeechRecognizerStatics2(factoryPtr)
        }

        return SpeechRecognizer.__ISpeechRecognizerStatics2.TrySetSystemSpeechLanguageAsync(speechLanguage)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the language used for speech recognition.
     * @remarks
     * CurrentLanguage is initialized with the value specified in the [SpeechRecognizer(language)](speechrecognizer_speechrecognizer_938933992.md) constructor. If no language is specified in the [SpeechRecognizer()](speechrecognizer_speechrecognizer_1221375020.md) constructor, CurrentLanguage is initialized with the value of [SystemSpeechLanguage](speechrecognizer_systemspeechlanguage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.currentlanguage
     * @type {Language} 
     */
    CurrentLanguage {
        get => this.get_CurrentLanguage()
    }

    /**
     * Gets the collection of constraint objects currently added to the [SpeechRecognizer](speechrecognizer.md) object.
     * @remarks
     * To use web-service constraints, speech input and dictation support must be enabled in **Settings** by turning on the "Get to know me" option in the Settings -> Privacy -> Speech, inking, and typing page. See "Recognize speech input" in [Speech recognition](/windows/uwp/input-and-devices/speech-recognition).
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.constraints
     * @type {IVector<ISpeechRecognitionConstraint>} 
     */
    Constraints {
        get => this.get_Constraints()
    }

    /**
     * Gets how long a speech recognizer ignores silence or unrecognizable sounds (babble) and continues listening for speech input.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.timeouts
     * @type {SpeechRecognizerTimeouts} 
     */
    Timeouts {
        get => this.get_Timeouts()
    }

    /**
     * Gets the UI settings for the [RecognizeWithUIAsync](speechrecognizer_recognizewithuiasync_1152231907.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.uioptions
     * @type {SpeechRecognizerUIOptions} 
     */
    UIOptions {
        get => this.get_UIOptions()
    }

    /**
     * Gets the continuous recognition session object ([SpeechContinuousRecognitionSession](speechcontinuousrecognitionsession.md)) associated with this [SpeechRecognizer](speechrecognizer.md).
     * @remarks
     * To use web-service constraints, speech input and dictation support must be enabled in **Settings** by turning on the "Get to know me" option in the Settings -> Privacy -> Speech, inking, and typing page. See "Recognize speech input" in [Speech recognition](/windows/uwp/input-and-devices/speech-recognition).
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.continuousrecognitionsession
     * @type {SpeechContinuousRecognitionSession} 
     */
    ContinuousRecognitionSession {
        get => this.get_ContinuousRecognitionSession()
    }

    /**
     * Gets the state of the speech recognizer.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * This event is raised when an [audio problem](speechrecognitionaudioproblem.md) is detected that might affect recognition accuracy.
     * @type {TypedEventHandler<SpeechRecognizer, SpeechRecognitionQualityDegradingEventArgs>}
    */
    OnRecognitionQualityDegrading {
        get {
            if(!this.HasProp("__OnRecognitionQualityDegrading")){
                this.__OnRecognitionQualityDegrading := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{15ca7918-61d2-57b2-b933-44063e8bb662}"),
                    SpeechRecognizer,
                    SpeechRecognitionQualityDegradingEventArgs
                )
                this.__OnRecognitionQualityDegradingToken := this.add_RecognitionQualityDegrading(this.__OnRecognitionQualityDegrading.iface)
            }
            return this.__OnRecognitionQualityDegrading
        }
    }

    /**
     * This event is raised when a change occurs to the [State](speechrecognizer_state.md) property during audio capture.
     * @type {TypedEventHandler<SpeechRecognizer, SpeechRecognizerStateChangedEventArgs>}
    */
    OnStateChanged {
        get {
            if(!this.HasProp("__OnStateChanged")){
                this.__OnStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d1185e92-5c30-5561-b3e2-e82ddbd872c3}"),
                    SpeechRecognizer,
                    SpeechRecognizerStateChangedEventArgs
                )
                this.__OnStateChangedToken := this.add_StateChanged(this.__OnStateChanged.iface)
            }
            return this.__OnStateChanged
        }
    }

    /**
     * Occurs during an ongoing dictation session when a recognition result fragment is returned by the speech recognizer.
     * @remarks
     * The result fragment is useful for demonstrating that speech recognition is processing input during a lengthy dictation session.
     * @type {TypedEventHandler<SpeechRecognizer, SpeechRecognitionHypothesisGeneratedEventArgs>}
    */
    OnHypothesisGenerated {
        get {
            if(!this.HasProp("__OnHypothesisGenerated")){
                this.__OnHypothesisGenerated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4cb45aba-7573-545a-b29a-e9be35bd4682}"),
                    SpeechRecognizer,
                    SpeechRecognitionHypothesisGeneratedEventArgs
                )
                this.__OnHypothesisGeneratedToken := this.add_HypothesisGenerated(this.__OnHypothesisGenerated.iface)
            }
            return this.__OnHypothesisGenerated
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [SpeechRecognizer](speechrecognizer.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechRecognition.SpeechRecognizer")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnRecognitionQualityDegradingToken")) {
            this.remove_RecognitionQualityDegrading(this.__OnRecognitionQualityDegradingToken)
            this.__OnRecognitionQualityDegrading.iface.Dispose()
        }

        if(this.HasProp("__OnStateChangedToken")) {
            this.remove_StateChanged(this.__OnStateChangedToken)
            this.__OnStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnHypothesisGeneratedToken")) {
            this.remove_HypothesisGenerated(this.__OnHypothesisGeneratedToken)
            this.__OnHypothesisGenerated.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Language} 
     */
    get_CurrentLanguage() {
        if (!this.HasProp("__ISpeechRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer := ISpeechRecognizer(outPtr)
        }

        return this.__ISpeechRecognizer.get_CurrentLanguage()
    }

    /**
     * 
     * @returns {IVector<ISpeechRecognitionConstraint>} 
     */
    get_Constraints() {
        if (!this.HasProp("__ISpeechRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer := ISpeechRecognizer(outPtr)
        }

        return this.__ISpeechRecognizer.get_Constraints()
    }

    /**
     * 
     * @returns {SpeechRecognizerTimeouts} 
     */
    get_Timeouts() {
        if (!this.HasProp("__ISpeechRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer := ISpeechRecognizer(outPtr)
        }

        return this.__ISpeechRecognizer.get_Timeouts()
    }

    /**
     * 
     * @returns {SpeechRecognizerUIOptions} 
     */
    get_UIOptions() {
        if (!this.HasProp("__ISpeechRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer := ISpeechRecognizer(outPtr)
        }

        return this.__ISpeechRecognizer.get_UIOptions()
    }

    /**
     * Asynchronously compile all constraints specified by the [Constraints](speechrecognizer_constraints.md) property.
     * @remarks
     * CompileConstraintsAsync must always be called before [RecognizeAsync](speechrecognizer_recognizeasync_748427924.md) or [RecognizeWithUIAsync](speechrecognizer_recognizewithuiasync_1152231907.md), even if no constraints are specified in the [Constraints](speechrecognizer_constraints.md) property.
     * 
     * This method returns an error if:
     * 
     * + [SpeechRecognizerState](speechrecognizerstate.md) is not [Idle](speechrecognizerstate.md) or [Paused](speechrecognizerstate.md).
     * + One or more constraints are specified when the recognition session is initialized, recognition is [Paused](speechrecognizerstate.md), all constraints are removed, and recognition is resumed.
     * + No constraints are specified when the recognition session is initialized, recognition is [Paused](speechrecognizerstate.md), constraints are added, and recognition is resumed.
     * 
     * To use web-service constraints, speech input and dictation support must be enabled in **Settings** by turning on the "Get to know me" option in the Settings -> Privacy -> Speech, inking, and typing page. See "Recognize speech input" in [Speech recognition](/windows/uwp/input-and-devices/speech-recognition).
     * @returns {IAsyncOperation<SpeechRecognitionCompilationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.compileconstraintsasync
     */
    CompileConstraintsAsync() {
        if (!this.HasProp("__ISpeechRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer := ISpeechRecognizer(outPtr)
        }

        return this.__ISpeechRecognizer.CompileConstraintsAsync()
    }

    /**
     * Begins a speech recognition session for a [SpeechRecognizer](speechrecognizer.md) object.
     * @returns {IAsyncOperation<SpeechRecognitionResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.recognizeasync
     */
    RecognizeAsync() {
        if (!this.HasProp("__ISpeechRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer := ISpeechRecognizer(outPtr)
        }

        return this.__ISpeechRecognizer.RecognizeAsync()
    }

    /**
     * Asynchronously starts a speech recognition session that includes additional UI mechanisms, including prompts, examples, text-to-speech (TTS), and confirmations.
     * @remarks
     * The UI mechanisms supported by RecognizeWithUIAsync are specified by the [UIOptions](speechrecognizer_uioptions.md) property.
     * @returns {IAsyncOperation<SpeechRecognitionResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.recognizewithuiasync
     */
    RecognizeWithUIAsync() {
        if (!this.HasProp("__ISpeechRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer := ISpeechRecognizer(outPtr)
        }

        return this.__ISpeechRecognizer.RecognizeWithUIAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<SpeechRecognizer, SpeechRecognitionQualityDegradingEventArgs>} speechRecognitionQualityDegradingHandler 
     * @returns {EventRegistrationToken} 
     */
    add_RecognitionQualityDegrading(speechRecognitionQualityDegradingHandler) {
        if (!this.HasProp("__ISpeechRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer := ISpeechRecognizer(outPtr)
        }

        return this.__ISpeechRecognizer.add_RecognitionQualityDegrading(speechRecognitionQualityDegradingHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_RecognitionQualityDegrading(cookie) {
        if (!this.HasProp("__ISpeechRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer := ISpeechRecognizer(outPtr)
        }

        return this.__ISpeechRecognizer.remove_RecognitionQualityDegrading(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<SpeechRecognizer, SpeechRecognizerStateChangedEventArgs>} stateChangedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(stateChangedHandler) {
        if (!this.HasProp("__ISpeechRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer := ISpeechRecognizer(outPtr)
        }

        return this.__ISpeechRecognizer.add_StateChanged(stateChangedHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_StateChanged(cookie) {
        if (!this.HasProp("__ISpeechRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer := ISpeechRecognizer(outPtr)
        }

        return this.__ISpeechRecognizer.remove_StateChanged(cookie)
    }

    /**
     * Disposes the speech recognizer by freeing, releasing, or resetting allocated resources.
     * @remarks
     * If a [SpeechContinuousRecognitionSession](speechcontinuousrecognitionsession.md) is underway, Close is functionally equivalent to calling [CancelAsync](speechcontinuousrecognitionsession_cancelasync_1837883523.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * 
     * @returns {SpeechContinuousRecognitionSession} 
     */
    get_ContinuousRecognitionSession() {
        if (!this.HasProp("__ISpeechRecognizer2")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer2 := ISpeechRecognizer2(outPtr)
        }

        return this.__ISpeechRecognizer2.get_ContinuousRecognitionSession()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__ISpeechRecognizer2")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer2 := ISpeechRecognizer2(outPtr)
        }

        return this.__ISpeechRecognizer2.get_State()
    }

    /**
     * Asynchronously ends the speech recognition session.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizer.stoprecognitionasync
     */
    StopRecognitionAsync() {
        if (!this.HasProp("__ISpeechRecognizer2")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer2 := ISpeechRecognizer2(outPtr)
        }

        return this.__ISpeechRecognizer2.StopRecognitionAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<SpeechRecognizer, SpeechRecognitionHypothesisGeneratedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_HypothesisGenerated(value) {
        if (!this.HasProp("__ISpeechRecognizer2")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer2 := ISpeechRecognizer2(outPtr)
        }

        return this.__ISpeechRecognizer2.add_HypothesisGenerated(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} value 
     * @returns {HRESULT} 
     */
    remove_HypothesisGenerated(value) {
        if (!this.HasProp("__ISpeechRecognizer2")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognizer2 := ISpeechRecognizer2(outPtr)
        }

        return this.__ISpeechRecognizer2.remove_HypothesisGenerated(value)
    }

;@endregion Instance Methods
}
