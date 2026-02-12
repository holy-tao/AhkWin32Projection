#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Represents the authentication status of a user.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userauthenticationstatus
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class UserAuthenticationStatus extends Win32Enum{

    /**
     * The user is unauthenticated.
     * @type {Integer (Int32)}
     */
    static Unauthenticated => 0

    /**
     * The user is locally authenticated.
     * @type {Integer (Int32)}
     */
    static LocallyAuthenticated => 1

    /**
     * The user is remotely authenticated.
     * @type {Integer (Int32)}
     */
    static RemotelyAuthenticated => 2
}
