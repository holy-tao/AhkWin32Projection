#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\IMMDevice.ahk" { IMMDevice }

/**
 * Specifies an endpoint microphone boost APO notification.
 * @remarks
 * Return an [APO_NOTIFICATION_DESCRIPTOR](ns-audioengineextensionapo-apo_notification_descriptor.md) containing this structure from an implementation of [IAudioProcessingObjectNotifications2::GetApoNotificationRegistrationInfo2](nf-audioengineextensionapo-iaudioprocessingobjectnotifications2-getaponotificationregistrationinfo2.md) to request endpoint microphone boost notifications for the specified device.
 * 
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_microphone_boost_apo_notification_descriptor
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct AUDIO_MICROPHONE_BOOST_APO_NOTIFICATION_DESCRIPTOR {
    #StructPack 8

    /**
     * The [IMMDevice](../mmdeviceapi/nn-mmdeviceapi-immdevice.md) representing the audio endpoint associated with the notification request.
     */
    device : IMMDevice

}
