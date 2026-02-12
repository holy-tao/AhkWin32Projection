#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of audio problem detected.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionaudioproblem
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionAudioProblem extends Win32Enum{

    /**
     * No audio problem.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Too much background noise interfering with the speech recognition.
     * @type {Integer (Int32)}
     */
    static TooNoisy => 1

    /**
     * No audio. For example, the microphone may have been muted.
     * @type {Integer (Int32)}
     */
    static NoSignal => 2

    /**
     * Input volume too high.
     * @type {Integer (Int32)}
     */
    static TooLoud => 3

    /**
     * Input volume too quiet.
     * @type {Integer (Int32)}
     */
    static TooQuiet => 4

    /**
     * User spoke too fast.
     * @type {Integer (Int32)}
     */
    static TooFast => 5

    /**
     * User spoke too slowly.
     * @type {Integer (Int32)}
     */
    static TooSlow => 6
}
