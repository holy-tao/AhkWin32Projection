#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Includes possible settings for the Automatic Logon Policy.
 * @remarks
 * To set the automatic logon policy, call the [**SetAutoLogonPolicy**](iwinhttprequest-setautologonpolicy.md) method and specify one of the preceding constants.
 * 
 * > [!Note]  
 * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP start page.
 * @see https://learn.microsoft.com/windows/win32/WinHttp/winhttprequestautologonpolicy
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WinHttpRequestAutoLogonPolicy {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
