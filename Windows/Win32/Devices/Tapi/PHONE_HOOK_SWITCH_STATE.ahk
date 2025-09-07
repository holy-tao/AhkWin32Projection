#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PHONE_HOOK_SWITCH_STATE enum provides indicators of the phone hookswitch status.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-phone_hook_switch_state
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONE_HOOK_SWITCH_STATE{

    /**
     * Indicates that the phone is onhook.
     * @type {Integer (Int32)}
     */
    static PHSS_ONHOOK => 1

    /**
     * Indicates that only the phone's microphone is offhook.
     * @type {Integer (Int32)}
     */
    static PHSS_OFFHOOK_MIC_ONLY => 2

    /**
     * Indicates that only the phone's speaker is offhook.
     * @type {Integer (Int32)}
     */
    static PHSS_OFFHOOK_SPEAKER_ONLY => 4

    /**
     * Indicates that the phone is offhook.
     * @type {Integer (Int32)}
     */
    static PHSS_OFFHOOK => 8
}
