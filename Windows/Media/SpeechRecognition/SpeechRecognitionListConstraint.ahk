#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechRecognitionListConstraint.ahk
#Include .\ISpeechRecognitionConstraint.ahk
#Include .\ISpeechRecognitionListConstraintFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A custom grammar constraint based on a list of words or phrases that can be recognized by the [SpeechRecognizer](speechrecognizer.md) object. When initialized, this object is added to the [Constraints](speechrecognizer_constraints.md) collection.
  * 
  * > [!NOTE]
  * > Speech recognition using a custom constraint is performed on the device.
 * @remarks
 * Constraints, or grammars, define the spoken words and phrases that can be matched by the speech recognizer. You can specify one of the pre-defined, web-service grammars ([SpeechRecognitionTopicConstraint](speechrecognitiontopicconstraint.md)) or you can create a custom grammar, described here, that is installed with your app.
 * 
 * + Programmatic list constraints (SpeechRecognitionListConstraint) provide a lightweight approach to creating simple grammars using a list of words or phrases. A list constraint works well for recognizing short, distinct phrases. Explicitly specifying all words in a grammar also improves recognition accuracy, as the speech recognition engine must only process speech to confirm a match. The list can also be programmatically updated.
 * + A Speech Recognition Grammar Specification (SRGS) grammar ([SpeechRecognitionGrammarFileConstraint](speechrecognitiongrammarfileconstraint.md)) is a static document that, unlike a programmatic list constraint, uses the XML format defined by the [ Version 1.0](https://www.w3.org/TR/speech-grammar/). An Speech Recognition Grammar Specification (SRGS) grammar provides the greatest control over the speech recognition experience by letting you capture multiple semantic meanings in a single recognition.
 * 
 * [CompileConstraintsAsync](speechrecognizer_compileconstraintsasync_1901700993.md) must always be called before [RecognizeAsync](speechrecognizer_recognizeasync_748427924.md) or [RecognizeWithUIAsync](speechrecognizer_recognizewithuiasync_1152231907.md), even if no constraints are specified in the [Constraints](speechrecognizer_constraints.md) property.
 * 
 * > [!NOTE]
 * > You can use a SpeechRecognitionListConstraint in conjunction with a web service [SpeechRecognitionTopicConstraint](speechrecognitiontopicconstraint.md) to increase accuracy during a dictation session by providing a set of domain-specific keywords that you think are likely to be used.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionlistconstraint
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionListConstraint extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechRecognitionListConstraint

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechRecognitionListConstraint.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [SpeechRecognitionListConstraint](speechrecognitionlistconstraint.md) class from an array of words or phrases.
     * @param {IIterable<HSTRING>} commands A string array of words or phrases that make up the constraint.
     * @returns {SpeechRecognitionListConstraint} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionlistconstraint.#ctor
     */
    static Create(commands) {
        if (!SpeechRecognitionListConstraint.HasProp("__ISpeechRecognitionListConstraintFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechRecognition.SpeechRecognitionListConstraint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpeechRecognitionListConstraintFactory.IID)
            SpeechRecognitionListConstraint.__ISpeechRecognitionListConstraintFactory := ISpeechRecognitionListConstraintFactory(factoryPtr)
        }

        return SpeechRecognitionListConstraint.__ISpeechRecognitionListConstraintFactory.Create(commands)
    }

    /**
     * Creates an instance of the [SpeechRecognitionListConstraint](speechrecognitionlistconstraint.md) class from an array of words or phrases and a tag.
     * @param {IIterable<HSTRING>} commands A string array of words or phrases that make up the constraint.
     * @param {HSTRING} tag The tag to assign to the constraint.
     * @returns {SpeechRecognitionListConstraint} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionlistconstraint.#ctor
     */
    static CreateWithTag(commands, tag) {
        if (!SpeechRecognitionListConstraint.HasProp("__ISpeechRecognitionListConstraintFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechRecognition.SpeechRecognitionListConstraint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpeechRecognitionListConstraintFactory.IID)
            SpeechRecognitionListConstraint.__ISpeechRecognitionListConstraintFactory := ISpeechRecognitionListConstraintFactory(factoryPtr)
        }

        return SpeechRecognitionListConstraint.__ISpeechRecognitionListConstraintFactory.CreateWithTag(commands, tag)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the array of words or phrases that make up the constraint.
     * @remarks
     * Modifications to the constraint collection are ignored. You must create a new [SpeechRecognitionListConstraint](speechrecognitionlistconstraint.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionlistconstraint.commands
     * @type {IVector<HSTRING>} 
     */
    Commands {
        get => this.get_Commands()
    }

    /**
     * Gets or sets whether the constraint can be used by the speech recognizer to perform recognition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionlistconstraint.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets a tag that can be useful for identifying the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionlistconstraint.tag
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * Gets the type of the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionlistconstraint.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets or sets the weighted value of the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionlistconstraint.probability
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
     * @returns {IVector<HSTRING>} 
     */
    get_Commands() {
        if (!this.HasProp("__ISpeechRecognitionListConstraint")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionListConstraint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionListConstraint := ISpeechRecognitionListConstraint(outPtr)
        }

        return this.__ISpeechRecognitionListConstraint.get_Commands()
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
