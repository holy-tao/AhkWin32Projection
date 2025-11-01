#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-audio_systemeffects_propertystore_type
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE_USER => 1

    /**
     * @type {Integer (Int32)}
     */
    static AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE_VOLATILE => 2

    /**
     * @type {Integer (Int32)}
     */
    static AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE_ENUM_COUNT => 3
}
