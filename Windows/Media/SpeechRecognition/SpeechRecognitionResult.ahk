#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechRecognitionResult.ahk
#Include .\ISpeechRecognitionResult2.ahk
#Include ..\..\..\Guid.ahk

/**
 * The result of a speech recognition session.
 * @remarks
 * Call the [SpeechRecognizer.RecognizeAsync](speechrecognizer_recognizeasync_748427924.md) or the [SpeechRecognizer.RecognizeWithUIAsync](speechrecognizer_recognizewithuiasync_1152231907.md) method to obtain an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionresult
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechRecognitionResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechRecognitionResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the result state ([SpeechRecognitionResultStatus](speechrecognitionresultstatus.md)) of a speech recognition session.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the recognized phrase of the speech recognition session.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionresult.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * Gets a value that indicates the confidence of the speech recognizer in the recognition result.
     * @remarks
     * Call [GetAlternates](speechrecognitionresult_getalternates_1293755280.md) for the full collection of recognition alternatives, ordered by confidence from most likely to least likely. The first item in the collection is the recognition result indicated by the parent object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionresult.confidence
     * @type {Integer} 
     */
    Confidence {
        get => this.get_Confidence()
    }

    /**
     * Gets an interpretation object containing the semantic properties of a recognized phrase in a Speech Recognition Grammar Specification (SRGS) grammar.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionresult.semanticinterpretation
     * @type {SpeechRecognitionSemanticInterpretation} 
     */
    SemanticInterpretation {
        get => this.get_SemanticInterpretation()
    }

    /**
     * Gets the constraint used for the recognition result.
     * @remarks
     * [CompileConstraintsAsync](speechrecognizer_compileconstraintsasync_1901700993.md) must be called before [RecognizeAsync](speechrecognizer_recognizeasync_748427924.md) or [RecognizeWithUIAsync](speechrecognizer_recognizewithuiasync_1152231907.md), even if no constraints are specified in the [Constraints](speechrecognizer_constraints.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionresult.constraint
     * @type {ISpeechRecognitionConstraint} 
     */
    Constraint {
        get => this.get_Constraint()
    }

    /**
     * Gets the hierarchy of rule elements that were triggered to return the recognized phrase.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionresult.rulepath
     * @type {IVectorView<HSTRING>} 
     */
    RulePath {
        get => this.get_RulePath()
    }

    /**
     * Gets a value that indicates the relative confidence of the [SpeechRecognitionResult](speechrecognitionresult.md) when compared with a collection of alternatives returned with the recognition result.
     * @remarks
     * RawConfidence does not indicate the likelihood that a phrase was correctly recognized. Instead it provides a way to compare the relative accuracy of alternatives returned with the recognition result. For example, a RawConfidence score of 0.8 does not mean that a result is 80% likely to be correct; it means the phrase is more likely than an alternative with a RawConfidence of 0.7.
     * 
     * Do not use RawConfidence to determine whether a result should be discarded. RawConfidence values are unique to each recognition engine and can vary between sessions or devices. Instead, check the [Confidence](speechrecognitionresult_confidence.md) property, which indicates a [SpeechRecognitionConfidence](speechrecognitionconfidence.md) of High, Medium, Low or Rejected.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionresult.rawconfidence
     * @type {Float} 
     */
    RawConfidence {
        get => this.get_RawConfidence()
    }

    /**
     * Gets the start time of the utterance.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionresult.phrasestarttime
     * @type {DateTime} 
     */
    PhraseStartTime {
        get => this.get_PhraseStartTime()
    }

    /**
     * Gets the amount of time required for the utterance.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionresult.phraseduration
     * @type {TimeSpan} 
     */
    PhraseDuration {
        get => this.get_PhraseDuration()
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
    get_Status() {
        if (!this.HasProp("__ISpeechRecognitionResult")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionResult := ISpeechRecognitionResult(outPtr)
        }

        return this.__ISpeechRecognitionResult.get_Status()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__ISpeechRecognitionResult")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionResult := ISpeechRecognitionResult(outPtr)
        }

        return this.__ISpeechRecognitionResult.get_Text()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Confidence() {
        if (!this.HasProp("__ISpeechRecognitionResult")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionResult := ISpeechRecognitionResult(outPtr)
        }

        return this.__ISpeechRecognitionResult.get_Confidence()
    }

    /**
     * 
     * @returns {SpeechRecognitionSemanticInterpretation} 
     */
    get_SemanticInterpretation() {
        if (!this.HasProp("__ISpeechRecognitionResult")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionResult := ISpeechRecognitionResult(outPtr)
        }

        return this.__ISpeechRecognitionResult.get_SemanticInterpretation()
    }

    /**
     * Gets a collection of recognition result alternatives, ordered by [RawConfidence](speechrecognitionresult_rawconfidence.md) from most likely to least likely. The first item in the collection is the recognition result indicated by the parent object.
     * @param {Integer} maxAlternates The maximum number of speech recognition results to return in the collection.
     * @returns {IVectorView<SpeechRecognitionResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionresult.getalternates
     */
    GetAlternates(maxAlternates) {
        if (!this.HasProp("__ISpeechRecognitionResult")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionResult := ISpeechRecognitionResult(outPtr)
        }

        return this.__ISpeechRecognitionResult.GetAlternates(maxAlternates)
    }

    /**
     * 
     * @returns {ISpeechRecognitionConstraint} 
     */
    get_Constraint() {
        if (!this.HasProp("__ISpeechRecognitionResult")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionResult := ISpeechRecognitionResult(outPtr)
        }

        return this.__ISpeechRecognitionResult.get_Constraint()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_RulePath() {
        if (!this.HasProp("__ISpeechRecognitionResult")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionResult := ISpeechRecognitionResult(outPtr)
        }

        return this.__ISpeechRecognitionResult.get_RulePath()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RawConfidence() {
        if (!this.HasProp("__ISpeechRecognitionResult")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionResult := ISpeechRecognitionResult(outPtr)
        }

        return this.__ISpeechRecognitionResult.get_RawConfidence()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_PhraseStartTime() {
        if (!this.HasProp("__ISpeechRecognitionResult2")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionResult2 := ISpeechRecognitionResult2(outPtr)
        }

        return this.__ISpeechRecognitionResult2.get_PhraseStartTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_PhraseDuration() {
        if (!this.HasProp("__ISpeechRecognitionResult2")) {
            if ((queryResult := this.QueryInterface(ISpeechRecognitionResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechRecognitionResult2 := ISpeechRecognitionResult2(outPtr)
        }

        return this.__ISpeechRecognitionResult2.get_PhraseDuration()
    }

;@endregion Instance Methods
}
