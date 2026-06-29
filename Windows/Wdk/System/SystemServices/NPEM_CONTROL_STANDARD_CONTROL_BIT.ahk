#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct NPEM_CONTROL_STANDARD_CONTROL_BIT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static InitiateReset => 1

    /**
     * @type {Integer (Int32)}
     */
    static OkControl => 2

    /**
     * @type {Integer (Int32)}
     */
    static LocateControl => 3

    /**
     * @type {Integer (Int32)}
     */
    static FailControl => 4

    /**
     * @type {Integer (Int32)}
     */
    static RebuildControl => 5

    /**
     * @type {Integer (Int32)}
     */
    static PFAControl => 6

    /**
     * @type {Integer (Int32)}
     */
    static HotSpareControl => 7

    /**
     * @type {Integer (Int32)}
     */
    static InACriticalArrayControl => 8

    /**
     * @type {Integer (Int32)}
     */
    static InAFailedArrayControl => 9

    /**
     * @type {Integer (Int32)}
     */
    static InvalidDeviceTypeControl => 10

    /**
     * @type {Integer (Int32)}
     */
    static DisabledControl => 11
}
