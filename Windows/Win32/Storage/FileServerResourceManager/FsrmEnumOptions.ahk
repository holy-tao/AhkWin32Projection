#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the options for enumerating collections of objects.
 * @remarks
 * The <b>FsrmEnumOptions_Asynchronous</b> option is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmenumoptions
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmEnumOptions {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
