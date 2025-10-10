#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates information about a file that has been downloaded.
 * @see https://docs.microsoft.com/windows/win32/api//wpcevent/ne-wpcevent-wpc_args_filedownloadevent
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_FILEDOWNLOADEVENT{

    /**
     * The URL or web address of the downloaded file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_FILEDOWNLOADEVENT_URL => 0

    /**
     * The name of the application used to download the file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_FILEDOWNLOADEVENT_APPNAME => 1

    /**
     * The version of the application used to download the file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_FILEDOWNLOADEVENT_VERSION => 2

    /**
     * The file download was blocked.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_FILEDOWNLOADEVENT_BLOCKED => 3

    /**
     * The path location of the downloaded file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_FILEDOWNLOADEVENT_PATH => 4

    /**
     * The arguments for the file download.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_FILEDOWNLOADEVENT_CARGS => 5
}
