#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DIRECTORY_NOTIFY_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DirectoryNotifyInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static DirectoryNotifyExtendedInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static DirectoryNotifyFullInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static DirectoryNotifyMaximumInformation => 4
}
