#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct EBranchOfficeJobEventType {
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
    static kInvalidJobState => 0

    /**
     * @type {Integer (Int32)}
     */
    static kLogJobPrinted => 1

    /**
     * @type {Integer (Int32)}
     */
    static kLogJobRendered => 2

    /**
     * @type {Integer (Int32)}
     */
    static kLogJobError => 3

    /**
     * @type {Integer (Int32)}
     */
    static kLogJobPipelineError => 4

    /**
     * @type {Integer (Int32)}
     */
    static kLogOfflineFileFull => 5
}
