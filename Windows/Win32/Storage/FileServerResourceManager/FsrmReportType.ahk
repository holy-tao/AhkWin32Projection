#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the types of reports that you can generate.
 * @remarks
 * To specify the values for report types that require a filter (for example, listing files over a specified 
 *     size), call the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setdefaultfilter">IFsrmReportManager::SetDefaultFilter</a> 
 *     method.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmreporttype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmReportType extends Win32Enum{

    /**
     * The report type is unknown. Do not use this flag.
     * @type {Integer (Int32)}
     */
    static FsrmReportType_Unknown => 0

    /**
     * Lists files that are larger than a specified size. Set the filter value to the size, in bytes.
     * @type {Integer (Int32)}
     */
    static FsrmReportType_LargeFiles => 1

    /**
     * Lists groups of files. Create a file group and use file name patterns to specify the members of the group. 
     *       Set the filter value to the name of the file group.
     * @type {Integer (Int32)}
     */
    static FsrmReportType_FilesByType => 2

    /**
     * Lists files that have not been accessed in the last <i>n</i> days. Specify the filter 
     *       value in days.
     * @type {Integer (Int32)}
     */
    static FsrmReportType_LeastRecentlyAccessed => 3

    /**
     * Lists files that have been accessed in the last <i>n</i> days. Specify the filter value 
     *       in days.
     * @type {Integer (Int32)}
     */
    static FsrmReportType_MostRecentlyAccessed => 4

    /**
     * Lists quotas that exceed the specified threshold. Set the filter value to the threshold.
     * @type {Integer (Int32)}
     */
    static FsrmReportType_QuotaUsage => 5

    /**
     * Lists files grouped by their owner. Set the filter value to the list of owners whose files you want 
     *       included in the report.
     * @type {Integer (Int32)}
     */
    static FsrmReportType_FilesByOwner => 6

    /**
     * Lists all files in the scope of the report job; there is no filtering. You can specify the XML or CSV file 
     *        formats only for this report type. This report cannot be sent through email.
     * 
     * For an action report, the scope is based on the quota or file screen event that initiated the report.
     * @type {Integer (Int32)}
     */
    static FsrmReportType_ExportReport => 7

    /**
     * Lists duplicate files. All files with the same file name, file size, and last modify time under the scope 
     *       of the report job are considered duplicates. For example, if the scope of the report is C:\ and 
     *       D:\ and file file1.txt exists in C:&#92;<i>folder1</i>\, 
     *       C:&#92;<i>folder2</i>\ and D:&#92;<i>folder1</i>\ with 
     *       the same modify time and file size, then the files are considered duplicates.
     * @type {Integer (Int32)}
     */
    static FsrmReportType_DuplicateFiles => 8

    /**
     * Lists file screening events that have occurred.
     * @type {Integer (Int32)}
     */
    static FsrmReportType_FileScreenAudit => 9

    /**
     * Lists files, grouped by property value, that contain the specified property (you can specify only one 
     *        property on which to report).
     * 
     * <b>Windows Server 2008:  </b>This report type is not supported before Windows Server 2008 R2.
     * @type {Integer (Int32)}
     */
    static FsrmReportType_FilesByProperty => 10

    /**
     * For internal use only; do not specify.
     * 
     * <b>Windows Server 2008:  </b>This report type is not supported before Windows Server 2008 R2.
     * @type {Integer (Int32)}
     */
    static FsrmReportType_AutomaticClassification => 11

    /**
     * For internal use only; do not specify.
     * 
     * <b>Windows Server 2008:  </b>This report type is not supported before Windows Server 2008 R2.
     * @type {Integer (Int32)}
     */
    static FsrmReportType_Expiration => 12

    /**
     * Lists folders, grouped by property value, that contain the specified property (you can specify only one 
     *        property on which to report).
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2008:  </b>This report type is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmReportType_FoldersByProperty => 13
}
