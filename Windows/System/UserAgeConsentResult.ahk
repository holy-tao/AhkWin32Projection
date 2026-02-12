#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the result of a call to [CheckUserAgeConsentGroupAsync](user_checkuserageconsentgroupasync_43625918.md), querying for a user's membership in a specified [UserAgeConsentGroup](userageconsentgroup.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userageconsentresult
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class UserAgeConsentResult extends Win32Enum{

    /**
     * The user's region does not use age consent enforcement groups.
     * @type {Integer (Int32)}
     */
    static NotEnforced => 0

    /**
     * The user is a member of the specified group, or a group that includes the specified group. For example, checking for **Minor** will return **Included** if the user is an **Adult**, because **Adult** is a superset of **Minor**.
     * @type {Integer (Int32)}
     */
    static Included => 1

    /**
     * The user is not a member of the specified group.
     * @type {Integer (Int32)}
     */
    static NotIncluded => 2

    /**
     * The system cannot determine which enforcement group the user belongs to.
     * @type {Integer (Int32)}
     */
    static Unknown => 3

    /**
     * The specified enforcement group is obsolete, and the user belongs to an enforcement group that partially overlaps it.
     * @type {Integer (Int32)}
     */
    static Ambiguous => 4
}
