#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies command types.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ne-projectedfslib-prj_complete_command_type
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_COMPLETE_COMMAND_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The provider is completing a call to its <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_notification_cb">PRJ_NOTIFICATION_CB</a> callback.
     * @type {Integer (Int32)}
     */
    static PRJ_COMPLETE_COMMAND_TYPE_NOTIFICATION => 1

    /**
     * The provider is completing a call to its <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_directory_enumeration_cb">PRJ_GET_DIRECTORY_ENUMERATION_CB</a> callback.
     * @type {Integer (Int32)}
     */
    static PRJ_COMPLETE_COMMAND_TYPE_ENUMERATION => 2
}
