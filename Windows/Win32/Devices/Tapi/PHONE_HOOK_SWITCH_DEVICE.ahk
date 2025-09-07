#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PHONE_HOOK_SWITCH_DEVICE enum is used to indicate the types of switch hooks on a phone device.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-phone_hook_switch_device
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONE_HOOK_SWITCH_DEVICE{

    /**
     * The handset's hookswitch.
     * @type {Integer (Int32)}
     */
    static PHSD_HANDSET => 1

    /**
     * The speakerphone's hookswitch.
     * @type {Integer (Int32)}
     */
    static PHSD_SPEAKERPHONE => 2

    /**
     * The headset's hookswitch.
     * @type {Integer (Int32)}
     */
    static PHSD_HEADSET => 4
}
