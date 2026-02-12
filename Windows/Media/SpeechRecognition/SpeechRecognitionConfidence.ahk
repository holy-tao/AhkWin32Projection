#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies confidence levels that indicate how accurately a spoken phrase was matched to a phrase in an active constraint.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionconfidence
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionConfidence extends Win32Enum{

    /**
     * The confidence level is high.
     * @type {Integer (Int32)}
     */
    static High => 0

    /**
     * The confidence level is medium.
     * @type {Integer (Int32)}
     */
    static Medium => 1

    /**
     * The confidence level is low.
     * @type {Integer (Int32)}
     */
    static Low => 2

    /**
     * The spoken phrase was not matched to any phrase in any active grammar.
     * @type {Integer (Int32)}
     */
    static Rejected => 3
}
