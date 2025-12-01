#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags that indicate conditions for creating and deleting the object and access modes for the object.
 * @remarks
 * You can combine these flags, but you can only choose one flag from each group of related flags. Typically one flag from each of the access and sharing groups must be specified for all functions and methods which use these constants. Flags from other groups are optional.
 * @see https://learn.microsoft.com/windows/win32/Stg/stgm-constants
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class STGM extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_DIRECT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_TRANSACTED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_SIMPLE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_READ => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_WRITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_READWRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_SHARE_DENY_NONE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_SHARE_DENY_READ => 48

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_SHARE_DENY_WRITE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_SHARE_EXCLUSIVE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_PRIORITY => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_DELETEONRELEASE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_NOSCRATCH => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_CREATE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_CONVERT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_FAILIFTHERE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_NOSNAPSHOT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static STGM_DIRECT_SWMR => 4194304
}
