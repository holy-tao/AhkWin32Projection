#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\IMMDevice.ahk" { IMMDevice }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * The AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR structure (audioengineextensionapo.h) specifies an system effects property change APO notification.
 * @remarks
 * Return an [APO_NOTIFICATION_DESCRIPTOR](ns-audioengineextensionapo-apo_notification_descriptor.md) containing this structure from an implementation of[IAudioProcessingObjectNotifications::GetApoNotificationRegistrationInfo](nf-audioengineextensionapo-iaudioprocessingobjectnotifications-getaponotificationregistrationinfo.md) to request system effects property change APO notifications.
 * 
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_systemeffects_property_change_apo_notification_descriptor
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR {
    #StructPack 8

    /**
     * The [IMMDevice](../mmdeviceapi/nn-mmdeviceapi-immdevice.md) representing the audio endpoint associated with the notification request.
     */
    device : IMMDevice

    /**
     * A GUID identifying the APO property store associated with the notification.
     */
    propertyStoreContext : Guid

}
