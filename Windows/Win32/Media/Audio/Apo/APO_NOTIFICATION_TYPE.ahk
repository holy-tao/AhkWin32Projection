#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ne-audioengineextensionapo-apo_notification_type
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APO_NOTIFICATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static APO_NOTIFICATION_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static APO_NOTIFICATION_TYPE_ENDPOINT_VOLUME => 1

    /**
     * @type {Integer (Int32)}
     */
    static APO_NOTIFICATION_TYPE_ENDPOINT_PROPERTY_CHANGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static APO_NOTIFICATION_TYPE_SYSTEM_EFFECTS_PROPERTY_CHANGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static APO_NOTIFICATION_TYPE_ENDPOINT_VOLUME2 => 4

    /**
     * @type {Integer (Int32)}
     */
    static APO_NOTIFICATION_TYPE_DEVICE_ORIENTATION => 5

    /**
     * @type {Integer (Int32)}
     */
    static APO_NOTIFICATION_TYPE_MICROPHONE_BOOST => 6

    /**
     * @type {Integer (Int32)}
     */
    static APO_NOTIFICATION_TYPE_AUDIO_ENVIRONMENT_STATE_CHANGE => 7
}
