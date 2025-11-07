#Requires AutoHotkey v2.0.0 64-bit

/**
 * Constants used by IFileIsInUse::GetUsage to indicate how a file in use is being used.
 * @remarks
 * 
 * The interpretation of "playing" or "editing" is left to the application's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileisinuse">IFileIsInUse</a>. Generally, "playing" would refer to a media file while "editing" can refer to any file being altered in an application. However, the application itself best knows how to map these terms to its actions.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-file_usage_type
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FILE_USAGE_TYPE{

    /**
     * The file is being played by the process that has it open.
     * @type {Integer (Int32)}
     */
    static FUT_PLAYING => 0

    /**
     * The file is being edited by the process that has it open.
     * @type {Integer (Int32)}
     */
    static FUT_EDITING => 1

    /**
     * The file is open in the process for an unspecified action or an action that does not readily fit into the other two categories.
     * @type {Integer (Int32)}
     */
    static FUT_GENERIC => 2
}
