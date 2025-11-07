#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the limit used to limit the files included in a report.
 * @remarks
 * 
 * You specify the  value for the limit in the <i>limitValue</i> parameter when calling the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setreportsizelimit">IFsrmReportManager::SetReportSizeLimit</a> 
 *     method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmreportlimit
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmReportLimit{

    /**
     * The report will list up to a maximum number of files. Applies to all report types.
     * @type {Integer (Int32)}
     */
    static FsrmReportLimit_MaxFiles => 1

    /**
     * A <b>FsrmReportType_FilesByType</b> report will list up to a maximum number of file 
 *       groups.
     * @type {Integer (Int32)}
     */
    static FsrmReportLimit_MaxFileGroups => 2

    /**
     * A <b>FsrmReportType_FilesByOwner</b> report will list up to a maximum number of 
 *       owners.
     * @type {Integer (Int32)}
     */
    static FsrmReportLimit_MaxOwners => 3

    /**
     * A <b>FsrmReportType_FilesByProperty</b> report will list up to a maximum number of 
 *       files per file group.
     * @type {Integer (Int32)}
     */
    static FsrmReportLimit_MaxFilesPerFileGroup => 4

    /**
     * A <b>FsrmReportType_FilesByOwner</b> report will be limited to a maximum number of 
 *       files per owner.
     * @type {Integer (Int32)}
     */
    static FsrmReportLimit_MaxFilesPerOwner => 5

    /**
     * A <b>FsrmReportType_DuplicateFiles</b> report will list up to a maximum number of 
 *       files per duplicated file group.
     * @type {Integer (Int32)}
     */
    static FsrmReportLimit_MaxFilesPerDuplGroup => 6

    /**
     * A <b>FsrmReportType_DuplicateFiles</b> report will list up to a maximum number of 
 *       duplicated file groups.
     * @type {Integer (Int32)}
     */
    static FsrmReportLimit_MaxDuplicateGroups => 7

    /**
     * A <b>FsrmReportType_QuotaUsage</b> report will list up to a maximum number of 
 *       quotas.
     * @type {Integer (Int32)}
     */
    static FsrmReportLimit_MaxQuotas => 8

    /**
     * A <b>FsrmReportType_FileScreenAudit</b> report will list up to a maximum number of 
 *       file screen events.
     * @type {Integer (Int32)}
     */
    static FsrmReportLimit_MaxFileScreenEvents => 9

    /**
     * A <b>FsrmReportType_FilesByProperty</b> report will list up to a maximum number of 
 *       property values.
     * @type {Integer (Int32)}
     */
    static FsrmReportLimit_MaxPropertyValues => 10

    /**
     * A <b>FsrmReportType_FilesByProperty</b> report will list up to a maximum number of 
 *       files per property value.
     * @type {Integer (Int32)}
     */
    static FsrmReportLimit_MaxFilesPerPropertyValue => 11

    /**
     * A <b>FsrmReportType_FolderByProperty</b> report will list up to a maximum number of 
 *        folders.
 * 
 * <b>Windows Server 2008 R2 and Windows Server 2008:  </b>This report limit is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmReportLimit_MaxFolders => 12
}
