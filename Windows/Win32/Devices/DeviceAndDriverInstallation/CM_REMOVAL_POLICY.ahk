#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_REMOVAL_POLICY{

    /**
     * @type {Integer (UInt32)}
     */
    static CM_REMOVAL_POLICY_EXPECT_NO_REMOVAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_REMOVAL_POLICY_EXPECT_ORDERLY_REMOVAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_REMOVAL_POLICY_EXPECT_SURPRISE_REMOVAL => 3
}
