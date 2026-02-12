#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the types of social media feed items.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeeditemstyle
 * @namespace Windows.ApplicationModel.SocialInfo
 * @version WindowsRuntime 1.4
 */
class SocialFeedItemStyle extends Win32Enum{

    /**
     * Default value
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * A photo item
     * @type {Integer (Int32)}
     */
    static Photo => 1
}
