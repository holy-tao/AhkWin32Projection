#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether or not hard links are allowed on placeholder files.
 * @remarks
 * If hard links are enabled, applications can create as many hard links as the file system supports so long as the links are under the same sync root or no sync root. Hard links and placeholder operations that are not compatible with this policy will fail with the error: **HRESULT(ERROR_CLOUD_FILES_INCOMPATIBLE_HARDLINKS)**.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_hardlink_policy
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_HARDLINK_POLICY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Default; No hard links can be created on any placeholder.
     * @type {Integer (Int32)}
     */
    static CF_HARDLINK_POLICY_NONE => 0

    /**
     * Hard links can be created on a placeholder under the same sync root or no sync root.
     * @type {Integer (Int32)}
     */
    static CF_HARDLINK_POLICY_ALLOWED => 1
}
