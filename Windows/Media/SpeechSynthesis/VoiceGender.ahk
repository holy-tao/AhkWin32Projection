#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the gender preferences available for speech synthesis (if supported by the specified speech synthesis engine).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.voicegender
 * @namespace Windows.Media.SpeechSynthesis
 * @version WindowsRuntime 1.4
 */
class VoiceGender extends Win32Enum{

    /**
     * Male
     * @type {Integer (Int32)}
     */
    static Male => 0

    /**
     * Female
     * @type {Integer (Int32)}
     */
    static Female => 1
}
