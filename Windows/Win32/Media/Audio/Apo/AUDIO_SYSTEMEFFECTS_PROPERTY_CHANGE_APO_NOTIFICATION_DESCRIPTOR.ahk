#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR structure (audioengineextensionapo.h) specifies an system effects property change APO notification.
 * @remarks
 * Return an [APO_NOTIFICATION_DESCRIPTOR](ns-audioengineextensionapo-apo_notification_descriptor.md) containing this structure from an implementation of[IAudioProcessingObjectNotifications::GetApoNotificationRegistrationInfo](nf-audioengineextensionapo-iaudioprocessingobjectnotifications-getaponotificationregistrationinfo.md) to request system effects property change APO notifications.
  * 
  * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_systemeffects_property_change_apo_notification_descriptor
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The [IMMDevice](../mmdeviceapi/nn-mmdeviceapi-immdevice.md) representing the audio endpoint associated with the notification request.
     * @type {Pointer<IMMDevice>}
     */
    device {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A GUID identifying the APO property store associated with the notification.
     * @type {Pointer<Guid>}
     */
    propertyStoreContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
