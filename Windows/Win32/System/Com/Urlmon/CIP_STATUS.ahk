#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class CIP_STATUS extends Win32Enum {

    /**
     * Native name: CIP_DISK_FULL
     * @type {Integer (Int32)}
     */
    static DISK_FULL => 0

    /**
     * Native name: CIP_ACCESS_DENIED
     * @type {Integer (Int32)}
     */
    static ACCESS_DENIED => 1

    /**
     * Native name: CIP_NEWER_VERSION_EXISTS
     * @type {Integer (Int32)}
     */
    static NEWER_VERSION_EXISTS => 2

    /**
     * Native name: CIP_OLDER_VERSION_EXISTS
     * @type {Integer (Int32)}
     */
    static OLDER_VERSION_EXISTS => 3

    /**
     * Native name: CIP_NAME_CONFLICT
     * @type {Integer (Int32)}
     */
    static NAME_CONFLICT => 4

    /**
     * Native name: CIP_TRUST_VERIFICATION_COMPONENT_MISSING
     * @type {Integer (Int32)}
     */
    static TRUST_VERIFICATION_COMPONENT_MISSING => 5

    /**
     * Native name: CIP_EXE_SELF_REGISTERATION_TIMEOUT
     * @type {Integer (Int32)}
     */
    static EXE_SELF_REGISTERATION_TIMEOUT => 6

    /**
     * Native name: CIP_UNSAFE_TO_ABORT
     * @type {Integer (Int32)}
     */
    static UNSAFE_TO_ABORT => 7

    /**
     * Native name: CIP_NEED_REBOOT
     * @type {Integer (Int32)}
     */
    static NEED_REBOOT => 8

    /**
     * Native name: CIP_NEED_REBOOT_UI_PERMISSION
     * @type {Integer (Int32)}
     */
    static NEED_REBOOT_UI_PERMISSION => 9
}
