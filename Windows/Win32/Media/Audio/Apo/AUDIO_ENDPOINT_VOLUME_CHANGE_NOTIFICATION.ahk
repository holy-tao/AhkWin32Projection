#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\IMMDevice.ahk" { IMMDevice }
#Import "..\AUDIO_VOLUME_NOTIFICATION_DATA.ahk" { AUDIO_VOLUME_NOTIFICATION_DATA }

/**
 * Represents an audio endpoint volume change APO notification.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_endpoint_volume_change_notification
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION {
    #StructPack 8

    /**
     * An [IMMDevice](..//mmdeviceapi/nn-mmdeviceapi-immdevice.md) representing the audio endpoint associated with the notification.
     */
    endpoint : IMMDevice

    /**
     * A pointer to a [AUDIO_VOLUME_NOTIFICATION_DATA](/windows/win32/api/endpointvolume/ns-endpointvolume-audio_volume_notification_data) representing the new endpoint volume.
     */
    volume : AUDIO_VOLUME_NOTIFICATION_DATA.Ptr

}
