#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies command types.
 * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/ne-projectedfslib-prj_complete_command_type
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_COMPLETE_COMMAND_TYPE extends Win32Enum{

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
