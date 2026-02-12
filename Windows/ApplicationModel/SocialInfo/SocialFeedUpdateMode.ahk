#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the modes for updating a social media feed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedupdatemode
 * @namespace Windows.ApplicationModel.SocialInfo
 * @version WindowsRuntime 1.4
 */
class SocialFeedUpdateMode extends Win32Enum{

    /**
     * Append mode
     * @type {Integer (Int32)}
     */
    static Append => 0

    /**
     * Replace mode
     * @type {Integer (Int32)}
     */
    static Replace => 1
}
