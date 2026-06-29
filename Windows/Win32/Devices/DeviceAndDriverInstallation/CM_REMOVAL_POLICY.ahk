#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CM_REMOVAL_POLICY {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
