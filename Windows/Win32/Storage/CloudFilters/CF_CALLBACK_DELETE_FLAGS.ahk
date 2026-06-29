#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This callback is used to inform the sync provider that a placeholder file or directory under one of its sync roots is about to be deleted or undeleted.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_delete_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CALLBACK_DELETE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * `0x00000000`
     * 
     * No delete flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DELETE_FLAG_NONE => 0

    /**
     * `0x00000001`
     * 
     * The placeholder that is about to be deleted is a directory.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DELETE_FLAG_IS_DIRECTORY => 1

    /**
     * `0x00000002`
     * 
     * The placeholder is being undeleted.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DELETE_FLAG_IS_UNDELETE => 2
}
