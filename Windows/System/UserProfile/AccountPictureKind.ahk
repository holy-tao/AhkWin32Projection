#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Allows you to request a specific image type when using [GetAccountPicture](userinformation_getaccountpicture_1542251334.md).
 * @remarks
 * To see how to use this property, check out our [code sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/Account%20picture%20name%20sample).
 * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.accountpicturekind
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class AccountPictureKind extends Win32Enum{

    /**
     * Indicates you want the small image for the user's account.
     * @type {Integer (Int32)}
     */
    static SmallImage => 0

    /**
     * Indicates you want the large image for the user's account.
     * @type {Integer (Int32)}
     */
    static LargeImage => 1

    /**
     * Indicates you want the video for the user's account.
     * @type {Integer (Int32)}
     */
    static Video => 2
}
