#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class CM_REMOVAL_POLICY extends Win32Enum {

    /**
     * Native name: CM_REMOVAL_POLICY_EXPECT_NO_REMOVAL
     * @type {Integer (UInt32)}
     */
    static EXPECT_NO_REMOVAL => 1

    /**
     * Native name: CM_REMOVAL_POLICY_EXPECT_ORDERLY_REMOVAL
     * @type {Integer (UInt32)}
     */
    static EXPECT_ORDERLY_REMOVAL => 2

    /**
     * Native name: CM_REMOVAL_POLICY_EXPECT_SURPRISE_REMOVAL
     * @type {Integer (UInt32)}
     */
    static EXPECT_SURPRISE_REMOVAL => 3
}
