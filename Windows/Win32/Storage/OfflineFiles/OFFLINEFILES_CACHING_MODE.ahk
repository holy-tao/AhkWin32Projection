#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the caching mode used in methods such as IOfflineFilesCache::IsPathCacheable and IOfflineFilesShareInfo::GetShareCachingMode.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_caching_mode
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct OFFLINEFILES_CACHING_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
