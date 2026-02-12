#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the amount of silence added after punctuation in the speech synthesis utterance (before another utterance begins).
 * @remarks
 * By default, approximately 750ms of silence is appended after each punctuation mark to ensure the utterance sounds as natural as possible. In some cases, such as accelerated playback or screen-reader descriptions of app content, this behavior is not required or needs to be configurable by the user.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechpunctuationsilence
 * @namespace Windows.Media.SpeechSynthesis
 * @version WindowsRuntime 1.4
 */
class SpeechPunctuationSilence extends Win32Enum{

    /**
     * The default amount of silence defined by the speech synthesis voice.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The minimum amount of silence defined by the speech synthesis voice.
     * @type {Integer (Int32)}
     */
    static Min => 1
}
