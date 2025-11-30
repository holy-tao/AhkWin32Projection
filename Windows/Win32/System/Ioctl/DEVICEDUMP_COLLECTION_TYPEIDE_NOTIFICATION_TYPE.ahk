#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICEDUMP_COLLECTION_TYPEIDE_NOTIFICATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TCCollectionBugCheck => 1

    /**
     * @type {Integer (Int32)}
     */
    static TCCollectionApplicationRequested => 2

    /**
     * @type {Integer (Int32)}
     */
    static TCCollectionDeviceRequested => 3
}
