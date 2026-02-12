#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the amount of silence added to the end of the speech synthesis utterance (before another utterance begins).
 * @remarks
 * By default, approximately 750ms of silence is appended to the end of each generated utterance. If the utterance is not a complete sentence, this can complicate concatenation of multiple utterances. For example, a streaming app that reads text from a document as it downloads, might start reading from its cache at a predetermined number of words.
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechappendedsilence
 * @namespace Windows.Media.SpeechSynthesis
 * @version WindowsRuntime 1.4
 */
class SpeechAppendedSilence extends Win32Enum{

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
