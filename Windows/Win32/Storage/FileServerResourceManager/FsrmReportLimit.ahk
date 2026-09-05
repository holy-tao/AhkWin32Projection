#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the limit used to limit the files included in a report.
 * @remarks
 * You specify the  value for the limit in the <i>limitValue</i> parameter when calling the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setreportsizelimit">IFsrmReportManager::SetReportSizeLimit</a> 
 *     method.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmreportlimit
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmReportLimit extends Win32Enum {

    /**
     * The report will list up to a maximum number of files. Applies to all report types.
     * Native name: FsrmReportLimit_MaxFiles
     * @type {Integer (Int32)}
     */
    static MaxFiles => 1

    /**
     * A <b>FsrmReportType_FilesByType</b> report will list up to a maximum number of file 
     *       groups.
     * Native name: FsrmReportLimit_MaxFileGroups
     * @type {Integer (Int32)}
     */
    static MaxFileGroups => 2

    /**
     * A <b>FsrmReportType_FilesByOwner</b> report will list up to a maximum number of 
     *       owners.
     * Native name: FsrmReportLimit_MaxOwners
     * @type {Integer (Int32)}
     */
    static MaxOwners => 3

    /**
     * A <b>FsrmReportType_FilesByProperty</b> report will list up to a maximum number of 
     *       files per file group.
     * Native name: FsrmReportLimit_MaxFilesPerFileGroup
     * @type {Integer (Int32)}
     */
    static MaxFilesPerFileGroup => 4

    /**
     * A <b>FsrmReportType_FilesByOwner</b> report will be limited to a maximum number of 
     *       files per owner.
     * Native name: FsrmReportLimit_MaxFilesPerOwner
     * @type {Integer (Int32)}
     */
    static MaxFilesPerOwner => 5

    /**
     * A <b>FsrmReportType_DuplicateFiles</b> report will list up to a maximum number of 
     *       files per duplicated file group.
     * Native name: FsrmReportLimit_MaxFilesPerDuplGroup
     * @type {Integer (Int32)}
     */
    static MaxFilesPerDuplGroup => 6

    /**
     * A <b>FsrmReportType_DuplicateFiles</b> report will list up to a maximum number of 
     *       duplicated file groups.
     * Native name: FsrmReportLimit_MaxDuplicateGroups
     * @type {Integer (Int32)}
     */
    static MaxDuplicateGroups => 7

    /**
     * A <b>FsrmReportType_QuotaUsage</b> report will list up to a maximum number of 
     *       quotas.
     * Native name: FsrmReportLimit_MaxQuotas
     * @type {Integer (Int32)}
     */
    static MaxQuotas => 8

    /**
     * A <b>FsrmReportType_FileScreenAudit</b> report will list up to a maximum number of 
     *       file screen events.
     * Native name: FsrmReportLimit_MaxFileScreenEvents
     * @type {Integer (Int32)}
     */
    static MaxFileScreenEvents => 9

    /**
     * A <b>FsrmReportType_FilesByProperty</b> report will list up to a maximum number of 
     *       property values.
     * Native name: FsrmReportLimit_MaxPropertyValues
     * @type {Integer (Int32)}
     */
    static MaxPropertyValues => 10

    /**
     * A <b>FsrmReportType_FilesByProperty</b> report will list up to a maximum number of 
     *       files per property value.
     * Native name: FsrmReportLimit_MaxFilesPerPropertyValue
     * @type {Integer (Int32)}
     */
    static MaxFilesPerPropertyValue => 11

    /**
     * A <b>FsrmReportType_FolderByProperty</b> report will list up to a maximum number of 
     *        folders.
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2008:  </b>This report limit is not supported before Windows Server 2012.
     * Native name: FsrmReportLimit_MaxFolders
     * @type {Integer (Int32)}
     */
    static MaxFolders => 12
}
