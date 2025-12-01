#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the options for failing IO operations that violate a quota, enabling or disabling quota tracking, and providing the status of the quota scan operation.
 * @remarks
 * You can set the <b>FsrmQuotaFlags_Enforce</b> and 
 *     <b>FsrmQuotaFlags_Disable</b> flags when calling the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-get_quotaflags">IFsrmQuotaBase::put_QuotaFlags</a> method. The 
 *     <b>IFsrmQuotaBase::get_QuotaFlags</b> method can return 
 *     these flags in addition to the <b>FsrmQuotaFlags_StatusIncomplete</b> and 
 *     <b>FsrmQuotaFlags_StatusRebuilding</b> flags.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmquotaflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmQuotaFlags extends Win32Enum{

    /**
     * If this flag is set, the server will fail an IO operation that causes the disk space usage to exceed the 
     *      quota limit. If this flag is not set, the server will not fail violating IO operations but will still run any 
     *      action associated with the quota thresholds.
     * @type {Integer (Int32)}
     */
    static FsrmQuotaFlags_Enforce => 256

    /**
     * The server will not track quota data for the quota and will not run any action associated with quota 
     *      thresholds.
     * @type {Integer (Int32)}
     */
    static FsrmQuotaFlags_Disable => 512

    /**
     * The quota is defined on the server but the rebuilding procedure (see 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-scan">IFsrmQuotaManager::Scan</a>) did not start or the scan 
     *      failed.
     * @type {Integer (Int32)}
     */
    static FsrmQuotaFlags_StatusIncomplete => 65536

    /**
     * The quota is in the process of rebuilding its data from the disk.
     * @type {Integer (Int32)}
     */
    static FsrmQuotaFlags_StatusRebuilding => 131072
}
