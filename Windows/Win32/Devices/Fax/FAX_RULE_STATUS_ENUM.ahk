#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FAX_RULE_STATUS_ENUM enumeration defines the status types for outbound routing rules.
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/ne-faxcomex-fax_rule_status_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_RULE_STATUS_ENUM extends Win32Enum{

    /**
     * The routing rule is valid and can be applied to outbound faxes.
     * @type {Integer (Int32)}
     */
    static frsVALID => 0

    /**
     * The routing rule cannot be applied because the rule uses an outbound routing group for its destination and the group is empty.
     * @type {Integer (Int32)}
     */
    static frsEMPTY_GROUP => 1

    /**
     * The routing rule cannot be applied because the rule uses an existing outbound routing group for its destination and the group does not contain devices that are valid for sending faxes.
     * @type {Integer (Int32)}
     */
    static frsALL_GROUP_DEV_NOT_VALID => 2

    /**
     * The routing rule uses an existing outbound routing group for its destination but the group contains devices that are not valid for sending faxes.
     * 
     * 
     * 
     * This is a warning status. The rule can be applied to the valid devices in the routing group.
     * @type {Integer (Int32)}
     */
    static frsSOME_GROUP_DEV_NOT_VALID => 3

    /**
     * The routing rule cannot be applied because the rule uses a single device for its destination and that device is not valid for sending faxes.
     * @type {Integer (Int32)}
     */
    static frsBAD_DEVICE => 4
}
