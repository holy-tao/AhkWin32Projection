#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct DD_FLAGS {
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
    static mDD_Width => 3

    /**
     * @type {Integer (UInt32)}
     */
    static fDD_BYTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static fDD_WORD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static fDD_DWORD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static fDD_BYTE_AND_WORD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static mDD_BusMaster => 4

    /**
     * @type {Integer (UInt32)}
     */
    static fDD_NoBusMaster => 0

    /**
     * @type {Integer (UInt32)}
     */
    static fDD_BusMaster => 4

    /**
     * @type {Integer (UInt32)}
     */
    static mDD_Type => 24

    /**
     * @type {Integer (UInt32)}
     */
    static fDD_TypeStandard => 0

    /**
     * @type {Integer (UInt32)}
     */
    static fDD_TypeA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static fDD_TypeB => 16

    /**
     * @type {Integer (UInt32)}
     */
    static fDD_TypeF => 24
}
