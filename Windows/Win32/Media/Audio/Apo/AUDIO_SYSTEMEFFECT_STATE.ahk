#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ne-audioengineextensionapo-audio_systemeffect_state
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_SYSTEMEFFECT_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AUDIO_SYSTEMEFFECT_STATE_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static AUDIO_SYSTEMEFFECT_STATE_ON => 1
}
