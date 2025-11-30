#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class DEFINE_DOS_DEVICE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DDD_RAW_TARGET_PATH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DDD_REMOVE_DEFINITION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDD_EXACT_MATCH_ON_REMOVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DDD_NO_BROADCAST_SYSTEM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DDD_LUID_BROADCAST_DRIVE => 16
}
