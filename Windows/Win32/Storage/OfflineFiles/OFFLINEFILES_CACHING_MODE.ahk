#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the caching mode used in methods such as IOfflineFilesCache::IsPathCacheable and IOfflineFilesShareInfo::GetShareCachingMode.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_caching_mode
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class OFFLINEFILES_CACHING_MODE extends Win32Enum{

    /**
     * No caching mode value was found.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_CACHING_MODE_NONE => 0

    /**
     * The share or shared folder is configured to disallow caching.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_CACHING_MODE_NOCACHING => 1

    /**
     * The share or shared folder is configured to allow manual caching.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_CACHING_MODE_MANUAL => 2

    /**
     * The share or shared folder is configured to allow automatic caching of documents.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_CACHING_MODE_AUTO_DOC => 3

    /**
     * The share or shared folder is configured to allow automatic caching of programs and documents.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_CACHING_MODE_AUTO_PROGANDDOC => 4
}
