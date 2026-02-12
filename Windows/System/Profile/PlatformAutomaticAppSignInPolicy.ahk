#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines state that specify the current stage for automatic app sign in.
 * @remarks
 * > [!IMPORTANT]
 * > This enum is intended for use by first-party applications.
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.platformautomaticappsigninpolicy
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class PlatformAutomaticAppSignInPolicy extends Win32Enum{

    /**
     * This policy cannot be evaluated
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Do not sign in automatically
     * @type {Integer (Int32)}
     */
    static PermissionRequired => 1

    /**
     * Sign in automatically
     * @type {Integer (Int32)}
     */
    static AlwaysAllowed => 2
}
