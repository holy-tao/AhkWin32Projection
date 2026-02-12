#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the state of the speech recognizer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognizerstate
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognizerState extends Win32Enum{

    /**
     * Indicates that speech recognition is not active and the speech recognizer is not capturing (listening for) audio input.
     * 
     * In this state, [SpeechRecognizer.RecognizeAsync](speechrecognizer_recognizeasync_748427924.md), [SpeechRecognizer.RecognizeWithUIAsync](speechrecognizer_recognizewithuiasync_1152231907.md), [SpeechContinuousRecognitionSession.StartAsync](speechcontinuousrecognitionsession_startasync_192219967.md), or [SpeechRecognizer.CompileConstraintsAsync](speechrecognizer_compileconstraintsasync_1901700993.md) can be called.
     * @type {Integer (Int32)}
     */
    static Idle => 0

    /**
     * Indicates that the speech recognizer is capturing (listening for) audio input from the user.
     * 
     * Useful for providing dynamic feedback during standard or continuous recognition.
     * @type {Integer (Int32)}
     */
    static Capturing => 1

    /**
     * Indicates that the speech recognizer is processing (attempting to recognize) audio input from the user. The recognizer is no longer capturing (listening for) audio input from the user.
     * 
     * During standard recognition, the state can occur after the recognizer has stopped capturing audio input and before a recognition result is returned.
     * 
     * During continuous recognition, this state can occur after [StopAsync](speechcontinuousrecognitionsession_stopasync_1648475005.md) has been called and before the [Completed](speechcontinuousrecognitionsession_completed.md) event fires.
     * 
     * Useful for indicating that a user should stop speaking.
     * @type {Integer (Int32)}
     */
    static Processing => 2

    /**
     * Indicates that the speech recognizer has detected sound on the audio stream.
     * 
     * Useful for indicating that sound (not necessarily speech) has been detected.
     * @type {Integer (Int32)}
     */
    static SoundStarted => 3

    /**
     * Indicates that the speech recognizer no longer detects sound on the audio stream.
     * 
     * Useful for hiding speech recognition UI. However, the recognition session is still active.
     * @type {Integer (Int32)}
     */
    static SoundEnded => 4

    /**
     * Indicates that the speech recognizer has detected speech input on the audio stream.
     * 
     * Useful for indicating that speech has been detected.
     * @type {Integer (Int32)}
     */
    static SpeechDetected => 5

    /**
     * Only valid for continuous recognition.
     * 
     * Indicates that the speech recognition session is still active, but the speech recognizer is no longer processing (attempting to recognize) audio input. Ongoing audio input is buffered.
     * 
     * In this state, [constraints](speechrecognizer_constraints.md) can be added, removed, and [compiled](speechrecognizer_compileconstraintsasync_1901700993.md).
     * 
     * If one or more constraints are specified when the recognition session is initialized, removing all constraints and resuming recognition will result in an error.
     * 
     * Similarly, if no constraints are specified when the recognition session is initialized, adding constraints and resuming recognition will also result in an error.
     * @type {Integer (Int32)}
     */
    static Paused => 6
}
