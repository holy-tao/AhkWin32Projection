#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\AUDIO_VOLUME_NOTIFICATION_DATA.ahk" { AUDIO_VOLUME_NOTIFICATION_DATA }

/**
 * Represents information about a volume change notification event. This structure is used by the AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION2 structure.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_volume_notification_data2
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct AUDIO_VOLUME_NOTIFICATION_DATA2 {
    #StructPack 8

    /**
     * An [AUDIO_VOLUME_NOTIFICATION_DATA](/windows/win32/api/endpointvolume/ns-endpointvolume-audio_volume_notification_data) structure containing additional information about the volume change event.
     */
    notificationData : AUDIO_VOLUME_NOTIFICATION_DATA.Ptr

    /**
     * A float value representing the current master volume level of the audio stream in dB.
     */
    masterVolumeInDb : Float32

    /**
     * A float value representing the minimum volume level of the endpoint in decibels. This value remains constant for the lifetime of the audio device specified in the associated [AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR](ns-audioengineextensionapo-audio_endpoint_volume_apo_notification_descriptor.md).
     */
    volumeMinInDb : Float32

    /**
     * A float value representing the maximum volume level of the endpoint in decibels. This value remains constant for the lifetime of the audio device specified in the associated **AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR**.
     */
    volumeMaxInDb : Float32

    /**
     * A float value representing the volume increment of the endpoint in decibels. This value remains constant for the lifetime of the audio device specified in the associated **AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR**.
     */
    volumeIncrementInDb : Float32

    /**
     * An unsigned integer value representing the current step in the volume range. Is a value in the range from 0 to *stepCount* - 1, where 0 represents the minimum volume level and *stepCount* - 1 represents the maximum level.
     */
    step : UInt32

    /**
     * An unsigned integer value representing the number of steps in the volume range. This value remains constant for the lifetime of the audio device specified in the associated **AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR**.
     */
    stepCount : UInt32

    /**
     * The first element in an array of channel volumes in dB. This element contains the current volume level of channel 0 in the audio stream. If the audio stream contains more than one channel, the volume levels for the additional channels immediately follow the **AUDIO_VOLUME_NOTIFICATION_DATA2** structure.
     */
    channelVolumesInDb : Float32[1]

}
