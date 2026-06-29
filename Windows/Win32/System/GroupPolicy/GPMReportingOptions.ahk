#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Options for Group Policy Management Console reports.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/ne-gpmgmt-gpmreportingoptions
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct GPMReportingOptions {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use administrative template ADM files.
     * @type {Integer (Int32)}
     */
    static opReportLegacy => 0

    /**
     * Include comments.
     * @type {Integer (Int32)}
     */
    static opReportComments => 1
}
