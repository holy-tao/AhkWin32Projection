#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the possible result states of a speech recognition session or from the compiling of grammar constraints.
 * @remarks
 * [RecognizeAsync](speechrecognizer_recognizeasync_748427924.md) and [RecognizeWithUIAsync](speechrecognizer_recognizewithuiasync_1152231907.md) return a [SpeechRecognitionResult](speechrecognitionresult.md) object.
 * 
 * [CompileConstraintsAsync](speechrecognizer_compileconstraintsasync_1901700993.md) returns a [SpeechRecognitionCompilationResult](speechrecognitioncompilationresult.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionresultstatus
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionResultStatus extends Win32Enum{

    /**
     * The recognition session or compilation succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * A topic constraint was set for an unsupported language.
     * @type {Integer (Int32)}
     */
    static TopicLanguageNotSupported => 1

    /**
     * The language of the speech recognizer does not match the language of a grammar.
     * @type {Integer (Int32)}
     */
    static GrammarLanguageMismatch => 2

    /**
     * A grammar failed to compile.
     * @type {Integer (Int32)}
     */
    static GrammarCompilationFailure => 3

    /**
     * Audio problems caused recognition to fail.
     * @type {Integer (Int32)}
     */
    static AudioQualityFailure => 4

    /**
     * User canceled recognition session.
     * @type {Integer (Int32)}
     */
    static UserCanceled => 5

    /**
     * An unknown problem caused recognition or compilation to fail.
     * @type {Integer (Int32)}
     */
    static Unknown => 6

    /**
     * A timeout due to extended silence or poor audio caused recognition to fail.
     * 
     * > Not supported in Windows 8 apps and Windows Phone apps.
     * @type {Integer (Int32)}
     */
    static TimeoutExceeded => 7

    /**
     * An extended pause, or excessive processing time, caused recognition to fail.
     * 
     * 
     * 
     * > Not supported in Windows 8 apps and Windows Phone apps.
     * @type {Integer (Int32)}
     */
    static PauseLimitExceeded => 8

    /**
     * Network problems caused recognition to fail.
     * 
     * 
     * 
     * > Not supported in Windows 8 apps and Windows Phone apps.
     * @type {Integer (Int32)}
     */
    static NetworkFailure => 9

    /**
     * Lack of a microphone caused recognition to fail.
     * 
     * 
     * 
     * > Not supported in Windows 8 apps and Windows Phone apps.
     * @type {Integer (Int32)}
     */
    static MicrophoneUnavailable => 10
}
