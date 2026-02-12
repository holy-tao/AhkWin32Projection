#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * A result that is returned when you try to set the image for a user account.
  * 
  * This object is returned when you call [SetAccountPictureAsync](userinformation_setaccountpictureasync_2005420122.md), [SetAccountPictureFromStreamAsync](userinformation_setaccountpicturefromstreamasync_649508924.md), [SetAccountPicturesAsync](userinformation_setaccountpicturesasync_1051215039.md), and [SetAccountPicturesFromStreamAsync.](windows_system_userprofile.md)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.setaccountpictureresult
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class SetAccountPictureResult extends Win32Enum{

    /**
     * Indicates the picture was successfully set.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Indicates that the picture was not set because the [AccountPictureChangeEnabled](userinformation_accountpicturechangeenabled.md) property is disabled, or the user cancelled the consent prompt.
     * @type {Integer (Int32)}
     */
    static ChangeDisabled => 1

    /**
     * Indicates that the picture was not set because the picture was too large.
     * @type {Integer (Int32)}
     */
    static LargeOrDynamicError => 2

    /**
     * Indicates that the video was not set because of its frame size was too large.
     * @type {Integer (Int32)}
     */
    static VideoFrameSizeError => 3

    /**
     * Indicates the picture was not set because the file size was too large.
     * @type {Integer (Int32)}
     */
    static FileSizeError => 4

    /**
     * Indicates the picture or video was not set.
     * @type {Integer (Int32)}
     */
    static Failure => 5
}
