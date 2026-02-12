#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the status of a key credential request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialstatus
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class KeyCredentialStatus extends Win32Enum{

    /**
     * The operation was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * An unknown error occurred.
     * @type {Integer (Int32)}
     */
    static UnknownError => 1

    /**
     * The credential could not be found.
     * @type {Integer (Int32)}
     */
    static NotFound => 2

    /**
     * The request was cancelled by the user.
     * @type {Integer (Int32)}
     */
    static UserCanceled => 3

    /**
     * The user prefers to enter a password.
     * @type {Integer (Int32)}
     */
    static UserPrefersPassword => 4

    /**
     * The credential already exists.
     * @type {Integer (Int32)}
     */
    static CredentialAlreadyExists => 5

    /**
     * The security device was locked.
     * @type {Integer (Int32)}
     */
    static SecurityDeviceLocked => 6
}
