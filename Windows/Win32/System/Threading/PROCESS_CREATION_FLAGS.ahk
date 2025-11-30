#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_CREATION_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PROCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ONLY_THIS_PROCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_SUSPENDED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DETACHED_PROCESS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_NEW_CONSOLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NORMAL_PRIORITY_CLASS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IDLE_PRIORITY_CLASS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HIGH_PRIORITY_CLASS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static REALTIME_PRIORITY_CLASS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_NEW_PROCESS_GROUP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_UNICODE_ENVIRONMENT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_SEPARATE_WOW_VDM => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_SHARED_WOW_VDM => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_FORCEDOS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static BELOW_NORMAL_PRIORITY_CLASS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ABOVE_NORMAL_PRIORITY_CLASS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static INHERIT_PARENT_AFFINITY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static INHERIT_CALLER_PRIORITY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_PROTECTED_PROCESS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENDED_STARTUPINFO_PRESENT => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_MODE_BACKGROUND_BEGIN => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_MODE_BACKGROUND_END => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_SECURE_PROCESS => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_BREAKAWAY_FROM_JOB => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_PRESERVE_CODE_AUTHZ_LEVEL => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_DEFAULT_ERROR_MODE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_NO_WINDOW => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static PROFILE_USER => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static PROFILE_KERNEL => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static PROFILE_SERVER => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_IGNORE_SYSTEM_DEFAULT => 2147483648
}
