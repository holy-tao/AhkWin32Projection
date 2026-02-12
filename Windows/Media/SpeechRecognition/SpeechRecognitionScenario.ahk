#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the scenario used to optimize speech recognition for a web-service constraint (created through a [SpeechRecognitionTopicConstraint](speechrecognitiontopicconstraint.md) object).
 * @remarks
 * To use web-service constraints, speech input and dictation support must be enabled in **Settings** by turning on the "Get to know me" option in the Settings -> Privacy -> Speech, inking, and typing page. See "Recognize speech input" in [Speech recognition](/windows/uwp/input-and-devices/speech-recognition).
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionscenario
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionScenario extends Win32Enum{

    /**
     * A grammar constraint optimized for web search recognition scenarios.
     * @type {Integer (Int32)}
     */
    static WebSearch => 0

    /**
     * A gramar constraint optimized for continuous recognition scenarios.
     * @type {Integer (Int32)}
     */
    static Dictation => 1

    /**
     * A grammar constraint optimized for form input recognition scenarios.
     * @type {Integer (Int32)}
     */
    static FormFilling => 2
}
