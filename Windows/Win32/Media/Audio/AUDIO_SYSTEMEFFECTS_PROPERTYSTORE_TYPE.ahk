#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of an audio system effects property store.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-audio_systemeffects_propertystore_type
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE extends Win32Enum{

    /**
     * Default property store. Contains custom effects properties and is populated from the INF file. Properties will not be persisted across OS upgrades.
     * @type {Integer (Int32)}
     */
    static AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE_DEFAULT => 0

    /**
     * User property store. Contains user settings pertaining to effects properties and will be persisted by the OS across upgrades and migrations.
     * @type {Integer (Int32)}
     */
    static AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE_USER => 1

    /**
     * The volatile property store. Contains audio effects properties that are lost on device reboot. The store is cleared each time the endpoint transitions to active
     * @type {Integer (Int32)}
     */
    static AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE_VOLATILE => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE_ENUM_COUNT => 3
}
