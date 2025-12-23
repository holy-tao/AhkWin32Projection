#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class CIP_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CIP_DISK_FULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static CIP_ACCESS_DENIED => 1

    /**
     * @type {Integer (Int32)}
     */
    static CIP_NEWER_VERSION_EXISTS => 2

    /**
     * @type {Integer (Int32)}
     */
    static CIP_OLDER_VERSION_EXISTS => 3

    /**
     * @type {Integer (Int32)}
     */
    static CIP_NAME_CONFLICT => 4

    /**
     * @type {Integer (Int32)}
     */
    static CIP_TRUST_VERIFICATION_COMPONENT_MISSING => 5

    /**
     * @type {Integer (Int32)}
     */
    static CIP_EXE_SELF_REGISTERATION_TIMEOUT => 6

    /**
     * @type {Integer (Int32)}
     */
    static CIP_UNSAFE_TO_ABORT => 7

    /**
     * @type {Integer (Int32)}
     */
    static CIP_NEED_REBOOT => 8

    /**
     * @type {Integer (Int32)}
     */
    static CIP_NEED_REBOOT_UI_PERMISSION => 9
}
