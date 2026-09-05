#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the options for enumerating collections of objects.
 * @remarks
 * The <b>FsrmEnumOptions_Asynchronous</b> option is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmenumoptions
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmEnumOptions extends Win32Enum {

    /**
     * Use no options and enumerate objects synchronously.
     * Native name: FsrmEnumOptions_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Reserved. Do not use.
     * Native name: FsrmEnumOptions_Asynchronous
     * @type {Integer (Int32)}
     */
    static Asynchronous => 1

    /**
     * Include items and paths that are in the system recycle bin when enumerating.
     * Native name: FsrmEnumOptions_CheckRecycleBin
     * @type {Integer (Int32)}
     */
    static CheckRecycleBin => 2

    /**
     * Include objects on all nodes in a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/windows-clustering">Windows cluster</a> 
     *       when enumerating report jobs 
     *       (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-enumreportjobs">IFsrmReportManager::EnumReportJobs</a>).
     * Native name: FsrmEnumOptions_IncludeClusterNodes
     * @type {Integer (Int32)}
     */
    static IncludeClusterNodes => 4

    /**
     * Include deprecated objects when enumerating.
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2008:  </b>This enumeration value is not supported before Windows Server 2012.
     * Native name: FsrmEnumOptions_IncludeDeprecatedObjects
     * @type {Integer (Int32)}
     */
    static IncludeDeprecatedObjects => 8
}
