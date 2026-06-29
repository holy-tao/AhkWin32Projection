#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PHONE_HOOK_SWITCH_DEVICE enum is used to indicate the types of switch hooks on a phone device.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-phone_hook_switch_device
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct PHONE_HOOK_SWITCH_DEVICE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
