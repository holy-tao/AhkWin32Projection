#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about a file that has been downloaded.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_filedownloadevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_FILEDOWNLOADEVENT extends Win32Enum {

    /**
     * The URL or web address of the downloaded file.
     * Native name: WPC_ARGS_FILEDOWNLOADEVENT_URL
     * @type {Integer (Int32)}
     */
    static URL => 0

    /**
     * The name of the application used to download the file.
     * Native name: WPC_ARGS_FILEDOWNLOADEVENT_APPNAME
     * @type {Integer (Int32)}
     */
    static APPNAME => 1

    /**
     * The version of the application used to download the file.
     * Native name: WPC_ARGS_FILEDOWNLOADEVENT_VERSION
     * @type {Integer (Int32)}
     */
    static VERSION => 2

    /**
     * The file download was blocked.
     * Native name: WPC_ARGS_FILEDOWNLOADEVENT_BLOCKED
     * @type {Integer (Int32)}
     */
    static BLOCKED => 3

    /**
     * The path location of the downloaded file.
     * Native name: WPC_ARGS_FILEDOWNLOADEVENT_PATH
     * @type {Integer (Int32)}
     */
    static PATH => 4

    /**
     * The arguments for the file download.
     * Native name: WPC_ARGS_FILEDOWNLOADEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 5
}
