#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the behavior of the speech recognizer during a continuous recognition session.
 * @remarks
 * To use web-service constraints, speech input and dictation support must be enabled in **Settings** by turning on the "Get to know me" option in the Settings -> Privacy -> Speech, inking, and typing page. See "Recognize speech input" in [Speech recognition](/windows/uwp/input-and-devices/speech-recognition).
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechcontinuousrecognitionmode
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechContinuousRecognitionMode extends Win32Enum{

    /**
     * Speech recognizer continues listening for and processing speech input after a recognition result is generated.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Speech recognizer pauses and suspends further processing of speech input when a recognition result is generated.
     * @type {Integer (Int32)}
     */
    static PauseOnRecognition => 1
}
