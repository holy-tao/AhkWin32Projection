#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_microphone_boost_apo_notification_descriptor
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_MICROPHONE_BOOST_APO_NOTIFICATION_DESCRIPTOR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {IMMDevice}
     */
    device {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
