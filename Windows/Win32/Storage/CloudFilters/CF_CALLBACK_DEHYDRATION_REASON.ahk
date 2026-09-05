#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the reason why a cloud file was dehydrated.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_dehydration_reason
 * @namespace Windows.Win32.Storage.CloudFilters
 */
class CF_CALLBACK_DEHYDRATION_REASON extends Win32Enum {

    /**
     * The cloud file has never been dehydrated after its creation.
     * Native name: CF_CALLBACK_DEHYDRATION_REASON_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * User explicitly dehydrated the cloud file.
     * Native name: CF_CALLBACK_DEHYDRATION_REASON_USER_MANUAL
     * @type {Integer (Int32)}
     */
    static USER_MANUAL => 1

    /**
     * The platform dehydrated the cloud file when experiencing low disk space on the volume where this file resides.
     * Native name: CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_LOW_SPACE
     * @type {Integer (Int32)}
     */
    static SYSTEM_LOW_SPACE => 2

    /**
     * The platform aged out the cloud file based on user defined policies.
     * Native name: CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_INACTIVITY
     * @type {Integer (Int32)}
     */
    static SYSTEM_INACTIVITY => 3

    /**
     * The platform dehydrated this file when reclaiming disk space in order to upgrade the OS.
     * Native name: CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_OS_UPGRADE
     * @type {Integer (Int32)}
     */
    static SYSTEM_OS_UPGRADE => 4
}
