#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class CM_SHARE_DISPOSITION extends Win32Enum {

    /**
     * Native name: CmResourceShareUndetermined
     * @type {Integer (Int32)}
     */
    static ResourceShareUndetermined => 0

    /**
     * Native name: CmResourceShareDeviceExclusive
     * @type {Integer (Int32)}
     */
    static ResourceShareDeviceExclusive => 1

    /**
     * Native name: CmResourceShareDriverExclusive
     * @type {Integer (Int32)}
     */
    static ResourceShareDriverExclusive => 2

    /**
     * Native name: CmResourceShareShared
     * @type {Integer (Int32)}
     */
    static ResourceShareShared => 3
}
