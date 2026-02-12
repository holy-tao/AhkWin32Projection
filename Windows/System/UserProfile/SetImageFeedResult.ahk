#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the result of a call to [LockScreen.RequestSetImageFeedAsync](lockscreen_requestsetimagefeedasync_841630601.md)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.setimagefeedresult
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class SetImageFeedResult extends Win32Enum{

    /**
     * The image feed was set successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The feed was not set because the lock screen image slide show is disabled by group policy.
     * @type {Integer (Int32)}
     */
    static ChangeDisabled => 1

    /**
     * The operation was canceled by the user.
     * @type {Integer (Int32)}
     */
    static UserCanceled => 2
}
