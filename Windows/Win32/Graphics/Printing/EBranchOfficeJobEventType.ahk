#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class EBranchOfficeJobEventType{

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
