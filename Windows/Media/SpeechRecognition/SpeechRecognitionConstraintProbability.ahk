#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the weighted value of a constraint for speech recognition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechrecognition.speechrecognitionconstraintprobability
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class SpeechRecognitionConstraintProbability extends Win32Enum{

    /**
     * The constraint has a low weighted value.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The constraint has a medium weighted value.
     * @type {Integer (Int32)}
     */
    static Min => 1

    /**
     * The constraint has a high weighted value.
     * @type {Integer (Int32)}
     */
    static Max => 2
}
