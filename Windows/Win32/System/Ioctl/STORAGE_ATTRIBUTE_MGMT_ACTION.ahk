#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_ATTRIBUTE_MGMT_ACTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static StorAttributeMgmt_ClearAttribute => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorAttributeMgmt_SetAttribute => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorAttributeMgmt_ResetAttribute => 2
}
