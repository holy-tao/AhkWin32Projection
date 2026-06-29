#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags for creating a placeholder file or directory.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_create_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CREATE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Default mode. All entries are processed.
     * @type {Integer (Int32)}
     */
    static CF_CREATE_FLAG_NONE => 0

    /**
     * Causes the API to return immediately if placeholder creation fails. If creation fails, the error code will be returned by the API.
     * @type {Integer (Int32)}
     */
    static CF_CREATE_FLAG_STOP_ON_ERROR => 1
}
