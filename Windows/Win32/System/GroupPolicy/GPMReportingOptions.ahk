#Requires AutoHotkey v2.0.0 64-bit

/**
 * Options for Group Policy Management Console reports.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/ne-gpmgmt-gpmreportingoptions
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMReportingOptions{

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
