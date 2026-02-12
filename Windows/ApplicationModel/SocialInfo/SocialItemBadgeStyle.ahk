#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines app badge types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialitembadgestyle
 * @namespace Windows.ApplicationModel.SocialInfo
 * @version WindowsRuntime 1.4
 */
class SocialItemBadgeStyle extends Win32Enum{

    /**
     * Hidden badge
     * @type {Integer (Int32)}
     */
    static Hidden => 0

    /**
     * Visible badge
     * @type {Integer (Int32)}
     */
    static Visible => 1

    /**
     * Visible badge with an unseen items count displayed
     * @type {Integer (Int32)}
     */
    static VisibleWithCount => 2
}
