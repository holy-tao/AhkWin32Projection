#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FAX_GROUP_STATUS_ENUM enumeration defines the status types for outbound routing groups.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_group_status_enum
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_GROUP_STATUS_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * All the devices in the routing group are valid and available for sending outgoing faxes.
     * @type {Integer (Int32)}
     */
    static fgsALL_DEV_VALID => 0

    /**
     * The routing group does not contain any devices.
     * @type {Integer (Int32)}
     */
    static fgsEMPTY => 1

    /**
     * The routing group does not contain any available devices for sending faxes. (Devices can be "unavailable" when they are offline and when they do not exist.)
     * @type {Integer (Int32)}
     */
    static fgsALL_DEV_NOT_VALID => 2

    /**
     * The routing group contains some devices that are unavailable for sending faxes. (Devices can be "unavailable" when they are offline and when they do not exist.)
     * @type {Integer (Int32)}
     */
    static fgsSOME_DEV_NOT_VALID => 3
}
