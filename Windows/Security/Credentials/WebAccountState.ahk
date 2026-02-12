#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the state of a [WebAccount](webaccount.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccountstate
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class WebAccountState extends Win32Enum{

    /**
     * The account is currently not connected.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The account is connected.
     * @type {Integer (Int32)}
     */
    static Connected => 1

    /**
     * The account was unable to connect.
     * @type {Integer (Int32)}
     */
    static Error => 2
}
