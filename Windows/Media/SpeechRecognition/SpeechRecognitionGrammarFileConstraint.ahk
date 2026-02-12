#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechRecognitionGrammarFileConstraint.ahk
#Include .\ISpeechRecognitionConstraint.ahk
#Include .\ISpeechRecognitionGrammarFileConstraintFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A custom grammar constraint based on a list of words or phrases (defined in a Speech Recognition Grammar Specification (SRGS) file) that can be recognized by the [SpeechRecognizer](speechrecognizer.md) object.
  * 
  * > [!NOTE]
  * > Speech recognition using a custom constraint is performed on the device.
 * @remarks
 * Constraints, or grammars, define the spoken words and phrases that can be matched by the speech recognizer. You can specify one of the pre-defined, web-service grammars ([SpeechRecognitionTopicConstraint](speechrecognitiontopicconstraint.md)) or you can create a custom grammar, described here, that is installed with your app (speech recognition using a custom constraint is performed on the device).
 * + Programmatic list constraints ([SpeechRecognitionListConstraint](speechrecognitionlistconstraint.md)) provide a lightweight approach to creating simple grammars using a list of words or phrases. A list constraint works well for recognizing short, distinct phrases. Explicitly specifying all words in a grammar also improves recognition accuracy, as the speech recognition engine must only process speech to confirm a match. The list can also be programmatically updated.
 * + An Speech Recognition Grammar Specification (SRGS) grammar (SpeechRecognitionGrammarFileConstraint) is a static document that, unlike a programmatic list constraint, uses the XML format defined by the [ Version 1.0](https://www.w3.org/TR/speech-grammar/). An Speech Recognition Grammar Specification (SRGS) grammar provides the greatest control over the speech recognition experience by letting you capture multiple semantic meanings in a single recognition.
 * 
 * [CompileConstraintsAsync](speechrecognizer_compileconstraintsasync_1901700993.md) must always be called before [RecognizeAsync](speechrecognizer_recognizeasync_748427924.md) or [RecognizeWithUIAsync](speechrecognizer_recognizewithuiasync_1152231907.md), even if no constraints are specified in the [Constraints](speechrecognizer_constraints.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiongrammarfileconstraint
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionGrammarFileConstraint extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechRecognitionGrammarFileConstraint

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechRecognitionGrammarFileConstraint.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [SpeechRecognitionGrammarFileConstraint](speechrecognitiongrammarfileconstraint.md) class from a file object.
     * @param {StorageFile} file_ An object representing a Speech Recognition Grammar Specification (SRGS) grammar file.
     * @returns {SpeechRecognitionGrammarFileConstraint} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiongrammarfileconstraint.#ctor
     */
    static Create(file_) {
        if (!SpeechRecognitionGrammarFileConstraint.HasProp("__ISpeechRecognitionGrammarFileConstraintFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechRecognition.SpeechRecognitionGrammarFileConstraint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpeechRecognitionGrammarFileConstraintFactory.IID)
            SpeechRecognitionGrammarFileConstraint.__ISpeechRecognitionGrammarFileConstraintFactory := ISpeechRecognitionGrammarFileConstraintFactory(factoryPtr)
        }

        return SpeechRecognitionGrammarFileConstraint.__ISpeechRecognitionGrammarFileConstraintFactory.Create(file_)
    }

    /**
     * Creates an instance of the [SpeechRecognitionGrammarFileConstraint](speechrecognitiongrammarfileconstraint.md) class from a file object and a tag.
     * @param {StorageFile} file_ An object representing a Speech Recognition Grammar Specification (SRGS) grammar file.
     * @param {HSTRING} tag The tag to assign to the constraint.
     * @returns {SpeechRecognitionGrammarFileConstraint} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiongrammarfileconstraint.#ctor
     */
    static CreateWithTag(file_, tag) {
        if (!SpeechRecognitionGrammarFileConstraint.HasProp("__ISpeechRecognitionGrammarFileConstraintFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechRecognition.SpeechRecognitionGrammarFileConstraint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpeechRecognitionGrammarFileConstraintFactory.IID)
            SpeechRecognitionGrammarFileConstraint.__ISpeechRecognitionGrammarFileConstraintFactory := ISpeechRecognitionGrammarFileConstraintFactory(factoryPtr)
        }

        return SpeechRecognitionGrammarFileConstraint.__ISpeechRecognitionGrammarFileConstraintFactory.CreateWithTag(file_, tag)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [StorageFile](../windows.storage/storagefile.md) object representing the Speech Recognition Grammar Specification (SRGS) grammar file.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiongrammarfileconstraint.grammarfile
     * @type {StorageFile} 
     */
    GrammarFile {
        get => this.get_GrammarFile()
    }

    /**
     * Gets or sets whether the constraint can be used by the speech recognizer to perform recognition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiongrammarfileconstraint.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets a tag that can be useful for identifying the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiongrammarfileconstraint.tag
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * Gets the type of the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiongrammarfileconstraint.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets or sets the weighted value of the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitiongrammarfileconstraint.probability
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
     * @returns {StorageFile} 
     */
    get_GrammarFile() {
        if (!this.HasProp("__ISpeechRecognitionGrammarFileConstraint")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionGrammarFileConstraint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionGrammarFileConstraint := ISpeechRecognitionGrammarFileConstraint(outPtr)
        }

        return this.__ISpeechRecognitionGrammarFileConstraint.get_GrammarFile()
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
