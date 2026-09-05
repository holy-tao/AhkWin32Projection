#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DIRECTORY_NOTIFY_INFORMATION_CLASS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DirectoryNotifyInformation => 1

    /**
     * Native name: DirectoryNotifyExtendedInformation
     * @type {Integer (Int32)}
     */
    static ExtendedInformation => 2

    /**
     * Native name: DirectoryNotifyFullInformation
     * @type {Integer (Int32)}
     */
    static FullInformation => 3

    /**
     * Native name: DirectoryNotifyMaximumInformation
     * @type {Integer (Int32)}
     */
    static MaximumInformation => 4
}
