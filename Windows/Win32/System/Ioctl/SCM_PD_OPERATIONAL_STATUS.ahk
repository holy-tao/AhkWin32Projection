#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_OPERATIONAL_STATUS {
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
    static ScmPhysicalDeviceOpStatus_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_Ok => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_PredictingFailure => 2

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_InService => 3

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_HardwareError => 4

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_NotUsable => 5

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_TransientError => 6

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_Missing => 7

    /**
     * @type {Integer (Int32)}
     */
    static ScmPhysicalDeviceOpStatus_Max => 8
}
