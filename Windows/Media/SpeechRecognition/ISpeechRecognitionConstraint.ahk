#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a constraint for a [SpeechRecognizer](speechrecognizer.md) object.
 * @remarks
 * Constraints, or grammars, define the spoken words and phrases that can be matched by the speech recognizer.
 * 
 * You can specify one of the pre-defined, web-service grammars (see [SpeechRecognitionTopicConstraint](speechrecognitiontopicconstraint.md)) or you can create your own custom grammar (see [SpeechRecognitionGrammarFileConstraint](speechrecognitiongrammarfileconstraint.md), [SpeechRecognitionListConstraint](speechrecognitionlistconstraint.md), and [SpeechRecognitionVoiceCommandDefinitionConstraint](speechrecognitionvoicecommanddefinitionconstraint.md)) that is installed with your app.
 * 
 * To use web-service constraints, speech input and dictation support must be enabled in **Settings** by turning on the "Get to know me" option in the Settings -> Privacy -> Speech, inking, and typing page. See "Recognize speech input" in [Speech recognition](/windows/uwp/input-and-devices/speech-recognition).
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.ispeechrecognitionconstraint
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class ISpeechRecognitionConstraint extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecognitionConstraint
     * @type {Guid}
     */
    static IID => Guid("{79ac1628-4d68-43c4-8911-40dc4101b55b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsEnabled", "put_IsEnabled", "get_Tag", "put_Tag", "get_Type", "get_Probability", "put_Probability"]

    /**
     * Gets or sets whether the constraint can be used by the [SpeechRecognizer](speechrecognizer.md) object to perform recognition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.ispeechrecognitionconstraint.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets a tag that can be useful for identifying the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.ispeechrecognitionconstraint.tag
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * Gets the type of the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.ispeechrecognitionconstraint.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets or sets the weighted value of the constraint.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.ispeechrecognitionconstraint.probability
     * @type {Integer} 
     */
    Probability {
        get => this.get_Probability()
        set => this.put_Probability(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Tag() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Tag(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Probability() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Probability(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
