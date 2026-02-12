#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the types of social media feeds.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedkind
 * @namespace Windows.ApplicationModel.SocialInfo
 * @version WindowsRuntime 1.4
 */
class SocialFeedKind extends Win32Enum{

    /**
     * A home feed
     * @type {Integer (Int32)}
     */
    static HomeFeed => 0

    /**
     * A contact feed
     * @type {Integer (Int32)}
     */
    static ContactFeed => 1

    /**
     * A dashboard feed
     * @type {Integer (Int32)}
     */
    static Dashboard => 2
}
