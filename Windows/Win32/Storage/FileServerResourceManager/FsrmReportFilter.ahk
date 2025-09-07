#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the filters that you can use to limit the files that are included in a report.
 * @remarks
 * The value for the filter is specified when you call the 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreport-setfilter">IFsrmReport::SetFilter</a> or 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setdefaultfilter">IFsrmReportManager::SetDefaultFilter</a> 
  *     method to specify the filter. For example, you set the <i>filterValue</i> parameter to the 
  *     filter's value when calling <b>SetFilter</b>.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmreportfilter
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmReportFilter{

    /**
     * The report will show only files that meet a minimum size.
 * 
 * Applies to the <b>FsrmReportType_LargeFiles</b> report type.
     * @type {Integer (Int32)}
     */
    static FsrmReportFilter_MinSize => 1

    /**
     * The report will show only files that were accessed more than a minimum number of days ago.
 * 
 * Applies to the <b>FsrmReportType_LeastRecentlyAccessed</b> and 
 *        <b>FsrmReportType_FileScreenAudit</b> report types.
     * @type {Integer (Int32)}
     */
    static FsrmReportFilter_MinAgeDays => 2

    /**
     * The report will show only files that were accessed prior to a maximum number of days ago.
 * 
 * Applies to the <b>FsrmReportType_MostRecentlyAccessed</b> report type.
     * @type {Integer (Int32)}
     */
    static FsrmReportFilter_MaxAgeDays => 3

    /**
     * The report will show only quotas that meet a certain disk space usage level.
 * 
 * Applies to the <b>FsrmReportType_QuotaUsage</b> report type.
     * @type {Integer (Int32)}
     */
    static FsrmReportFilter_MinQuotaUsage => 4

    /**
     * The report will show only files from a specified set of file groups.
 * 
 * Applies to the <b>FsrmReportType_FilesByType</b> report type.
     * @type {Integer (Int32)}
     */
    static FsrmReportFilter_FileGroups => 5

    /**
     * The report will show only files that belong to specified owners. The format of the owner string can be either 
 *        the user principal name 
 *        ("<i>UserName</i>@<i>Domain</i>" or 
 *        "<i>Domain</i>&#92;<i>UserName</i>") or a SID in string 
 *        format.
 * 
 * Applies to the <b>FsrmReportType_FilesByOwner</b> report type.
     * @type {Integer (Int32)}
     */
    static FsrmReportFilter_Owners => 6

    /**
     * The report will show only files with names that match the specified pattern.
 * 
 * Applies to the <b>FsrmReportType_LargeFiles</b>, 
 *        <b>FsrmReportType_MostRecentlyAccessed</b>, 
 *        <b>FsrmReportType_LeastRecentlyAccessed</b>, 
 *        <b>FsrmReportType_FilesByOwner</b>, and  
 *        <b>FsrmReportType_FilesByProperty</b> report types. For these report types, multiple 
 *        filters could exist. For example, for the <b>FsrmReportType_LargeFiles</b> report type, 
 *        both the <b>FsrmReportFilter_MinSize</b> and 
 *        <b>FsrmReportFilter_NamePattern</b> filters could exist.
     * @type {Integer (Int32)}
     */
    static FsrmReportFilter_NamePattern => 7

    /**
     * The report will show only files that contain the specified property.
 * 
 * Applies to the <b>FsrmReportType_FilesByProperty</b> and 
 *        <b>FsrmReportType_FoldersByProperty</b> report types.
     * @type {Integer (Int32)}
     */
    static FsrmReportFilter_Property => 8
}
