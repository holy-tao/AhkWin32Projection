#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the types of update, such as a driver or software update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/ne-wuapi-updatetype
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class UpdateType extends Win32Enum{

    /**
     * Indicates that the update is a software update.
     * @type {Integer (Int32)}
     */
    static utSoftware => 1

    /**
     * Indicates that the update is a driver update.
     * @type {Integer (Int32)}
     */
    static utDriver => 2
}
