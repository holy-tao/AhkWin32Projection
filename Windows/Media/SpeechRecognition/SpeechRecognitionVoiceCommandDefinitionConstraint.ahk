#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechRecognitionVoiceCommandDefinitionConstraint.ahk
#Include .\ISpeechRecognitionConstraint.ahk
#Include ..\..\..\Guid.ahk

/**
 * A constraint for a [SpeechRecognizer](speechrecognizer.md) object based on a [Voice Command Definition](/uwp/schemas/voicecommands/voice-command-elements-and-attributes-1-2) file.
 * @remarks
 * Access the [SpeechRecognitionResult.Constraint](speechrecognitionresult_constraint.md) property to obtain an instance of this class.
 * 
 * [CompileConstraintsAsync](speechrecognizer_compileconstraintsasync_1901700993.md) must always be called before [RecognizeAsync](speechrecognizer_recognizeasync_748427924.md) or [RecognizeWithUIAsync](speechrecognizer_recognizewithuiasync_1152231907.md), even if no constraints are specified in the [Constraints](speechrecognizer_constraints.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionvoicecommanddefinitionconstraint
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionVoiceCommandDefinitionConstraint extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechRecognitionVoiceCommandDefinitionConstraint

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechRecognitionVoiceCommandDefinitionConstraint.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether the constraint can be used by the [SpeechRecognizer](speechrecognizer.md) object to perform recognition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionvoicecommanddefinitionconstraint.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets a tag that can be useful for identifying the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionvoicecommanddefinitionconstraint.tag
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * Gets the type of the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionvoicecommanddefinitionconstraint.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets or sets the weighted value of the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionvoicecommanddefinitionconstraint.probability
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
