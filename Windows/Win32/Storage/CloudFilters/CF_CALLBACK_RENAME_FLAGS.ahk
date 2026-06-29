#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Call back flags to inform the sync provider that a placeholder under one of its sync roots is about to be renamed or moved.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_rename_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CALLBACK_RENAME_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No rename flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_RENAME_FLAG_NONE => 0

    /**
     * Flag set if the placeholder is a directory.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_RENAME_FLAG_IS_DIRECTORY => 1

    /**
     * Flag set if the link to be renamed or moved is within a sync root managed by the sync process.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_RENAME_FLAG_SOURCE_IN_SCOPE => 2

    /**
     * Flag set if the rename or move target is in the same sync root of the source path.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_RENAME_FLAG_TARGET_IN_SCOPE => 4
}
