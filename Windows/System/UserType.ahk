#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Represents user types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.usertype
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class UserType extends Win32Enum{

    /**
     * The user is a local user.
     * @type {Integer (Int32)}
     */
    static LocalUser => 0

    /**
     * The user is a remote user.
     * @type {Integer (Int32)}
     */
    static RemoteUser => 1

    /**
     * The user is a local guest.
     * @type {Integer (Int32)}
     */
    static LocalGuest => 2

    /**
     * The user is a remote guest.
     * @type {Integer (Int32)}
     */
    static RemoteGuest => 3

    /**
     * The user is a system managed account.
     * @type {Integer (Int32)}
     */
    static SystemManaged => 4
}
