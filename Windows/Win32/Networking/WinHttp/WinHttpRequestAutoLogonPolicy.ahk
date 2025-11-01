#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/WinHttp/winhttprequestautologonpolicy
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WinHttpRequestAutoLogonPolicy{

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
