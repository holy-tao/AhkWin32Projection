#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents an audio endpoint volume change APO notification.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_endpoint_volume_change_notification
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An [IMMDevice](..//mmdeviceapi/nn-mmdeviceapi-immdevice.md) representing the audio endpoint associated with the notification.
     * @type {Pointer<IMMDevice>}
     */
    endpoint {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a [AUDIO_VOLUME_NOTIFICATION_DATA](/windows/win32/api/endpointvolume/ns-endpointvolume-audio_volume_notification_data) representing the new endpoint volume.
     * @type {Pointer<AUDIO_VOLUME_NOTIFICATION_DATA>}
     */
    volume {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
