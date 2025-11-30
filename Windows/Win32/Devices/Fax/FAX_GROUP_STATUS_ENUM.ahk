#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FAX_GROUP_STATUS_ENUM enumeration defines the status types for outbound routing groups.
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/ne-faxcomex-fax_group_status_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_GROUP_STATUS_ENUM extends Win32Enum{

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
