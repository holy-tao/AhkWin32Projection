#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FAX_DEVICE_RECEIVE_MODE_ENUM enumeration defines the way a device answers an incoming call.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_device_receive_mode_enum
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_DEVICE_RECEIVE_MODE_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The device will not answer the call.
     * @type {Integer (Int32)}
     */
    static fdrmNO_ANSWER => 0

    /**
     * The device will automatically answer the call.
     * @type {Integer (Int32)}
     */
    static fdrmAUTO_ANSWER => 1

    /**
     * The device will answer the call only if made to do so manually.
     * @type {Integer (Int32)}
     */
    static fdrmMANUAL_ANSWER => 2
}
