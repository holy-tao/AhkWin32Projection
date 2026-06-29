#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct IRQD_FLAGS {
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
    static mIRQD_Share => 1

    /**
     * @type {Integer (UInt32)}
     */
    static fIRQD_Exclusive => 0

    /**
     * @type {Integer (UInt32)}
     */
    static fIRQD_Share => 1

    /**
     * @type {Integer (UInt32)}
     */
    static fIRQD_Share_Bit => 0

    /**
     * @type {Integer (UInt32)}
     */
    static fIRQD_Level_Bit => 1

    /**
     * @type {Integer (UInt32)}
     */
    static mIRQD_Edge_Level => 2

    /**
     * @type {Integer (UInt32)}
     */
    static fIRQD_Level => 0

    /**
     * @type {Integer (UInt32)}
     */
    static fIRQD_Edge => 2
}
