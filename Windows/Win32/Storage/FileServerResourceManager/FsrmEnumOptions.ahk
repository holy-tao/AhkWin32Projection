#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the options for enumerating collections of objects.
 * @remarks
 * 
 * The <b>FsrmEnumOptions_Asynchronous</b> option is not supported.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmenumoptions
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmEnumOptions extends Win32Enum{

    /**
     * Use no options and enumerate objects synchronously.
     * @type {Integer (Int32)}
     */
    static FsrmEnumOptions_None => 0

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static FsrmEnumOptions_Asynchronous => 1

    /**
     * Include items and paths that are in the system recycle bin when enumerating.
     * @type {Integer (Int32)}
     */
    static FsrmEnumOptions_CheckRecycleBin => 2

    /**
     * Include objects on all nodes in a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/windows-clustering">Windows cluster</a> 
     *       when enumerating report jobs 
     *       (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-enumreportjobs">IFsrmReportManager::EnumReportJobs</a>).
     * @type {Integer (Int32)}
     */
    static FsrmEnumOptions_IncludeClusterNodes => 4

    /**
     * Include deprecated objects when enumerating.
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2008:  </b>This enumeration value is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmEnumOptions_IncludeDeprecatedObjects => 8
}
