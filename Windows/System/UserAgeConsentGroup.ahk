#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the age consent groups a user can belong to.
 * @remarks
 * This enumeration is used by the [CheckUserAgeConsentGroupAsync](user_checkuserageconsentgroupasync_43625918.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.system.userageconsentgroup
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class UserAgeConsentGroup extends Win32Enum{

    /**
     * Child consent group.
     * @type {Integer (Int32)}
     */
    static Child => 0

    /**
     * Minot consent group.
     * @type {Integer (Int32)}
     */
    static Minor => 1

    /**
     * Adult consent group.
     * @type {Integer (Int32)}
     */
    static Adult => 2
}
