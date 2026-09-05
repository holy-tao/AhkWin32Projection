#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags that indicate conditions for creating and deleting the object and access modes for the object.
 * @remarks
 * You can combine these flags, but you can only choose one flag from each group of related flags. Typically one flag from each of the access and sharing groups must be specified for all functions and methods which use these constants. Flags from other groups are optional.
 * @see https://learn.microsoft.com/windows/win32/Stg/stgm-constants
 * @namespace Windows.Win32.System.Com
 */
class STGM extends Win32BitflagEnum {

    /**
     * Native name: STGM_DIRECT
     * @type {Integer (UInt32)}
     */
    static DIRECT => 0

    /**
     * Native name: STGM_TRANSACTED
     * @type {Integer (UInt32)}
     */
    static TRANSACTED => 65536

    /**
     * Native name: STGM_SIMPLE
     * @type {Integer (UInt32)}
     */
    static SIMPLE => 134217728

    /**
     * Native name: STGM_READ
     * @type {Integer (UInt32)}
     */
    static READ => 0

    /**
     * Native name: STGM_WRITE
     * @type {Integer (UInt32)}
     */
    static WRITE => 1

    /**
     * Native name: STGM_READWRITE
     * @type {Integer (UInt32)}
     */
    static READWRITE => 2

    /**
     * Native name: STGM_SHARE_DENY_NONE
     * @type {Integer (UInt32)}
     */
    static SHARE_DENY_NONE => 64

    /**
     * Native name: STGM_SHARE_DENY_READ
     * @type {Integer (UInt32)}
     */
    static SHARE_DENY_READ => 48

    /**
     * Native name: STGM_SHARE_DENY_WRITE
     * @type {Integer (UInt32)}
     */
    static SHARE_DENY_WRITE => 32

    /**
     * Native name: STGM_SHARE_EXCLUSIVE
     * @type {Integer (UInt32)}
     */
    static SHARE_EXCLUSIVE => 16

    /**
     * Native name: STGM_PRIORITY
     * @type {Integer (UInt32)}
     */
    static PRIORITY => 262144

    /**
     * Native name: STGM_DELETEONRELEASE
     * @type {Integer (UInt32)}
     */
    static DELETEONRELEASE => 67108864

    /**
     * Native name: STGM_NOSCRATCH
     * @type {Integer (UInt32)}
     */
    static NOSCRATCH => 1048576

    /**
     * Native name: STGM_CREATE
     * @type {Integer (UInt32)}
     */
    static CREATE => 4096

    /**
     * Native name: STGM_CONVERT
     * @type {Integer (UInt32)}
     */
    static CONVERT => 131072

    /**
     * Native name: STGM_FAILIFTHERE
     * @type {Integer (UInt32)}
     */
    static FAILIFTHERE => 0

    /**
     * Native name: STGM_NOSNAPSHOT
     * @type {Integer (UInt32)}
     */
    static NOSNAPSHOT => 2097152

    /**
     * Native name: STGM_DIRECT_SWMR
     * @type {Integer (UInt32)}
     */
    static DIRECT_SWMR => 4194304
}
