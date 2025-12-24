#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class CM_SHARE_DISPOSITION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CmResourceShareUndetermined => 0

    /**
     * @type {Integer (Int32)}
     */
    static CmResourceShareDeviceExclusive => 1

    /**
     * @type {Integer (Int32)}
     */
    static CmResourceShareDriverExclusive => 2

    /**
     * @type {Integer (Int32)}
     */
    static CmResourceShareShared => 3
}
