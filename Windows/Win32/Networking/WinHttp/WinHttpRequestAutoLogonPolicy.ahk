#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Includes possible settings for the Automatic Logon Policy.
 * @remarks
 * To set the automatic logon policy, call the [**SetAutoLogonPolicy**](iwinhttprequest-setautologonpolicy.md) method and specify one of the preceding constants.
 * 
 * > [!Note]  
 * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP start page.
 * @see https://learn.microsoft.com/windows/win32/WinHttp/winhttprequestautologonpolicy
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WinHttpRequestAutoLogonPolicy extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AutoLogonPolicy_Always => 0

    /**
     * @type {Integer (Int32)}
     */
    static AutoLogonPolicy_OnlyIfBypassProxy => 1

    /**
     * @type {Integer (Int32)}
     */
    static AutoLogonPolicy_Never => 2
}
