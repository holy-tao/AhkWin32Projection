#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of an APO_NOTIFICATION.
 * @remarks
 * Clients use this enumeration to specify requested notification types in their implementations of [IAudioProcessingObjectNotifications2::GetApoNotificationRegistrationInfo2](./nf-audioengineextensionapo-iaudioprocessingobjectnotifications2-getaponotificationregistrationinfo2.md) and [IAudioProcessingObjectNotifications::GetApoNotificationRegistrationInfo](./nf-audioengineextensionapo-iaudioprocessingobjectnotifications-getaponotificationregistrationinfo.md).
 * 
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ne-audioengineextensionapo-apo_notification_type
 * @namespace Windows.Win32.Media.Audio.Apo
 */
class APO_NOTIFICATION_TYPE extends Win32Enum {

    /**
     * None.
     * Native name: APO_NOTIFICATION_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Endpoint volume notification.
     * Native name: APO_NOTIFICATION_TYPE_ENDPOINT_VOLUME
     * @type {Integer (Int32)}
     */
    static ENDPOINT_VOLUME => 1

    /**
     * Endpoint property change notification.
     * Native name: APO_NOTIFICATION_TYPE_ENDPOINT_PROPERTY_CHANGE
     * @type {Integer (Int32)}
     */
    static ENDPOINT_PROPERTY_CHANGE => 2

    /**
     * System effects property change notification.
     * Native name: APO_NOTIFICATION_TYPE_SYSTEM_EFFECTS_PROPERTY_CHANGE
     * @type {Integer (Int32)}
     */
    static SYSTEM_EFFECTS_PROPERTY_CHANGE => 3

    /**
     * Endpoint volume notification for an endpoint that includes master and channel volume, in dB.
     * Native name: APO_NOTIFICATION_TYPE_ENDPOINT_VOLUME2
     * @type {Integer (Int32)}
     */
    static ENDPOINT_VOLUME2 => 4

    /**
     * Display orientation notification for the device.
     * Native name: APO_NOTIFICATION_TYPE_DEVICE_ORIENTATION
     * @type {Integer (Int32)}
     */
    static DEVICE_ORIENTATION => 5

    /**
     * Microphone boost notification.
     * Native name: APO_NOTIFICATION_TYPE_MICROPHONE_BOOST
     * @type {Integer (Int32)}
     */
    static MICROPHONE_BOOST => 6

    /**
     * Native name: APO_NOTIFICATION_TYPE_AUDIO_ENVIRONMENT_STATE_CHANGE
     * @type {Integer (Int32)}
     */
    static AUDIO_ENVIRONMENT_STATE_CHANGE => 7
}
