#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the grammar definition constraint used for speech recognition.
 * @remarks
 * Constraints, or grammars, define the spoken words and phrases that can be matched by the speech recognizer.
 * 
 * You can specify one of the pre-defined, web-service grammars (see [SpeechRecognitionTopicConstraint](speechrecognitiontopicconstraint.md)) or you can create your own custom grammar (see [SpeechRecognitionGrammarFileConstraint](speechrecognitiongrammarfileconstraint.md), [SpeechRecognitionListConstraint](speechrecognitionlistconstraint.md), and [SpeechRecognitionVoiceCommandDefinitionConstraint](speechrecognitionvoicecommanddefinitionconstraint.md)) that is installed with your app.
 * 
 * To use web-service constraints, speech input and dictation support must be enabled in **Settings** by turning on the "Get to know me" option in the Settings -> Privacy -> Speech, inking, and typing page. See "Recognize speech input" in [Speech recognition](/windows/uwp/input-and-devices/speech-recognition).
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionconstrainttype
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionConstraintType extends Win32Enum{

    /**
     * A pre-defined, web-service grammar constraint based on a dictation topic. See [SpeechRecognitionTopicConstraint](speechrecognitiontopicconstraint.md).
     * @type {Integer (Int32)}
     */
    static Topic => 0

    /**
     * A constraint based on a list of words or phrases. See [SpeechRecognitionListConstraint](speechrecognitionlistconstraint.md).
     * @type {Integer (Int32)}
     */
    static List => 1

    /**
     * A constraint based on a Speech Recognition Grammar Specification (SRGS) grammar file. See [SpeechRecognitionGrammarFileConstraint](speechrecognitiongrammarfileconstraint.md).
     * @type {Integer (Int32)}
     */
    static Grammar => 2

    /**
     * A constraint based on a Voice Command Definition (VCD) file. See [SpeechRecognitionVoiceCommandDefinitionConstraint](speechrecognitionvoicecommanddefinitionconstraint.md).
     * @type {Integer (Int32)}
     */
    static VoiceCommandDefinition => 3
}
