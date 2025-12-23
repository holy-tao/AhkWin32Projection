#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible priorities for a download operation.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-downloadpriority
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class DownloadPriority extends Win32Enum{

    /**
     * Updates are downloaded as low priority.
     * @type {Integer (Int32)}
     */
    static dpLow => 1

    /**
     * Updates are downloaded as normal priority.
     * @type {Integer (Int32)}
     */
    static dpNormal => 2

    /**
     * Updates are downloaded as high priority.
     * @type {Integer (Int32)}
     */
    static dpHigh => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static dpExtraHigh => 4
}
