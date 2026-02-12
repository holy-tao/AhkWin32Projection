#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechRecognitionTopicConstraint.ahk
#Include .\ISpeechRecognitionConstraint.ahk
#Include .\ISpeechRecognitionTopicConstraintFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A pre-defined grammar constraint (specifed by [SpeechRecognitionScenario](speechrecognitionscenario.md)) provided through a web service.
 * @remarks
 * Constraints, or grammars, define the spoken words and phrases that can be matched by the speech recognizer.
 * 
 * You can specify one of the pre-defined, web-service grammars or you can create your own custom grammar (see [SpeechRecognitionGrammarFileConstraint](speechrecognitiongrammarfileconstraint.md), [SpeechRecognitionListConstraint](speechrecognitionlistconstraint.md), and [SpeechRecognitionVoiceCommandDefinitionConstraint](speechrecognitionvoicecommanddefinitionconstraint.md)) that is installed with your app.
 * 
 * [CompileConstraintsAsync](speechrecognizer_compileconstraintsasync_1901700993.md) must always be called before [RecognizeAsync](speechrecognizer_recognizeasync_748427924.md) or [RecognizeWithUIAsync](speechrecognizer_recognizewithuiasync_1152231907.md), even if no constraints are specified in the [Constraints](speechrecognizer_constraints.md) property.
 * 
 * To use web-service constraints, speech input and dictation support must be enabled in **Settings** by turning on the "Get to know me" option in **Settings -> Privacy -> Speech, inking, and typing**. For more detail on recognition constraints, see "Recognize speech input" in [Speech recognition](/windows/uwp/input-and-devices/speech-recognition).
 * 
 * > [!NOTE]
 * > Increase recognition accuracy during a lengthy dictation session by using a [SpeechRecognitionListConstraint](speechrecognitionlistconstraint.md) in conjunction with the SpeechRecognitionTopicConstraint. This lets you provide a set of domain-specific keywords that you think are likely to be used during dictation.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiontopicconstraint
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionTopicConstraint extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechRecognitionTopicConstraint

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechRecognitionTopicConstraint.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [SpeechRecognitionTopicConstraint](speechrecognitiontopicconstraint.md) class by using a pre-defined scenario type and context.
     * @param {Integer} scenario A predefined scenario type.
     * @param {HSTRING} topicHint A subject, or context hint, used to optimize recognition.
     * @returns {SpeechRecognitionTopicConstraint} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiontopicconstraint.#ctor
     */
    static Create(scenario, topicHint) {
        if (!SpeechRecognitionTopicConstraint.HasProp("__ISpeechRecognitionTopicConstraintFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechRecognition.SpeechRecognitionTopicConstraint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpeechRecognitionTopicConstraintFactory.IID)
            SpeechRecognitionTopicConstraint.__ISpeechRecognitionTopicConstraintFactory := ISpeechRecognitionTopicConstraintFactory(factoryPtr)
        }

        return SpeechRecognitionTopicConstraint.__ISpeechRecognitionTopicConstraintFactory.Create(scenario, topicHint)
    }

    /**
     * Creates an instance of the [SpeechRecognitionTopicConstraint](speechrecognitiontopicconstraint.md) class by using a pre-defined scenario type, context, and an identifier.
     * @param {Integer} scenario A predefined scenario type.
     * @param {HSTRING} topicHint A subject, or context hint, used to optimize recognition.
     * @param {HSTRING} tag Identifier for the constraint.
     * @returns {SpeechRecognitionTopicConstraint} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiontopicconstraint.#ctor
     */
    static CreateWithTag(scenario, topicHint, tag) {
        if (!SpeechRecognitionTopicConstraint.HasProp("__ISpeechRecognitionTopicConstraintFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechRecognition.SpeechRecognitionTopicConstraint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpeechRecognitionTopicConstraintFactory.IID)
            SpeechRecognitionTopicConstraint.__ISpeechRecognitionTopicConstraintFactory := ISpeechRecognitionTopicConstraintFactory(factoryPtr)
        }

        return SpeechRecognitionTopicConstraint.__ISpeechRecognitionTopicConstraintFactory.CreateWithTag(scenario, topicHint, tag)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the predefined scenario type for the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiontopicconstraint.scenario
     * @type {Integer} 
     */
    Scenario {
        get => this.get_Scenario()
    }

    /**
     * Gets the topic hint for the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiontopicconstraint.topichint
     * @type {HSTRING} 
     */
    TopicHint {
        get => this.get_TopicHint()
    }

    /**
     * Gets or sets whether the constraint can be used by the [SpeechRecognizer](speechrecognizer.md) object to perform recognition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiontopicconstraint.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets a tag that can be useful for identifying the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiontopicconstraint.tag
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * Gets the type of the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiontopicconstraint.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets or sets the weighted value of the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiontopicconstraint.probability
     * @type {Integer} 
     */
    Probability {
        get => this.get_Probability()
        set => this.put_Probability(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Scenario() {
        if (!this.HasProp("__ISpeechRecognitionTopicConstraint")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionTopicConstraint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionTopicConstraint := ISpeechRecognitionTopicConstraint(outPtr)
        }

        return this.__ISpeechRecognitionTopicConstraint.get_Scenario()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TopicHint() {
        if (!this.HasProp("__ISpeechRecognitionTopicConstraint")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionTopicConstraint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionTopicConstraint := ISpeechRecognitionTopicConstraint(outPtr)
        }

        return this.__ISpeechRecognitionTopicConstraint.get_TopicHint()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__ISpeechRecognitionConstraint")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionConstraint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionConstraint := ISpeechRecognitionConstraint(outPtr)
        }

        return this.__ISpeechRecognitionConstraint.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__ISpeechRecognitionConstraint")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionConstraint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionConstraint := ISpeechRecognitionConstraint(outPtr)
        }

        return this.__ISpeechRecognitionConstraint.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Tag() {
        if (!this.HasProp("__ISpeechRecognitionConstraint")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionConstraint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionConstraint := ISpeechRecognitionConstraint(outPtr)
        }

        return this.__ISpeechRecognitionConstraint.get_Tag()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Tag(value) {
        if (!this.HasProp("__ISpeechRecognitionConstraint")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionConstraint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionConstraint := ISpeechRecognitionConstraint(outPtr)
        }

        return this.__ISpeechRecognitionConstraint.put_Tag(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__ISpeechRecognitionConstraint")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionConstraint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionConstraint := ISpeechRecognitionConstraint(outPtr)
        }

        return this.__ISpeechRecognitionConstraint.get_Type()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Probability() {
        if (!this.HasProp("__ISpeechRecognitionConstraint")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionConstraint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionConstraint := ISpeechRecognitionConstraint(outPtr)
        }

        return this.__ISpeechRecognitionConstraint.get_Probability()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Probability(value) {
        if (!this.HasProp("__ISpeechRecognitionConstraint")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionConstraint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionConstraint := ISpeechRecognitionConstraint(outPtr)
        }

        return this.__ISpeechRecognitionConstraint.put_Probability(value)
    }

;@endregion Instance Methods
}
