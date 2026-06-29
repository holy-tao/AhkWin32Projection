#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PrintJobStatus {
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
    static PrintJobStatus_Paused => 1

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Error => 2

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Deleting => 4

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Spooling => 8

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Printing => 16

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Offline => 32

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_PaperOut => 64

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Printed => 128

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Deleted => 256

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_BlockedDeviceQueue => 512

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_UserIntervention => 1024

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Restarted => 2048

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Complete => 4096

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Retained => 8192
}
