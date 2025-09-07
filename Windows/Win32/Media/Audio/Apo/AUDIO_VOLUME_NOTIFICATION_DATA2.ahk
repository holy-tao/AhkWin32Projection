#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents information about a volume change notification event. This structure is used by the AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION2 structure.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_volume_notification_data2
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_VOLUME_NOTIFICATION_DATA2 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * An [AUDIO_VOLUME_NOTIFICATION_DATA](/windows/win32/api/endpointvolume/ns-endpointvolume-audio_volume_notification_data) structure containing additional information about the volume change event.
     * @type {Pointer<AUDIO_VOLUME_NOTIFICATION_DATA>}
     */
    notificationData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A float value representing the current master volume level of the audio stream in dB.
     * @type {Float}
     */
    masterVolumeInDb {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * A float value representing the minimum volume level of the endpoint in decibels. This value remains constant for the lifetime of the audio device specified in the associated [AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR](ns-audioengineextensionapo-audio_endpoint_volume_apo_notification_descriptor.md).
     * @type {Float}
     */
    volumeMinInDb {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * A float value representing the maximum volume level of the endpoint in decibels. This value remains constant for the lifetime of the audio device specified in the associated **AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR**.
     * @type {Float}
     */
    volumeMaxInDb {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * A float value representing the volume increment of the endpoint in decibels. This value remains constant for the lifetime of the audio device specified in the associated **AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR**.
     * @type {Float}
     */
    volumeIncrementInDb {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * An unsigned integer value representing the current step in the volume range. Is a value in the range from 0 to *stepCount* - 1, where 0 represents the minimum volume level and *stepCount* - 1 represents the maximum level.
     * @type {Integer}
     */
    step {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * An unsigned integer value representing the number of steps in the volume range. This value remains constant for the lifetime of the audio device specified in the associated **AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR**.
     * @type {Integer}
     */
    stepCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The first element in an array of channel volumes in dB. This element contains the current volume level of channel 0 in the audio stream. If the audio stream contains more than one channel, the volume levels for the additional channels immediately follow the **AUDIO_VOLUME_NOTIFICATION_DATA2** structure.
     * @type {Array<Single>}
     */
    channelVolumesInDb{
        get {
            if(!this.HasProp("__channelVolumesInDbProxyArray"))
                this.__channelVolumesInDbProxyArray := Win32FixedArray(this.ptr + 32, 4, Primitive, "float")
            return this.__channelVolumesInDbProxyArray
        }
    }
}
