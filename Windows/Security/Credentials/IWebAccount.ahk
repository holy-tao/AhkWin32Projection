#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WebAccountProvider.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables a class to represent an account from a web account provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.iwebaccount
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class IWebAccount extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccount
     * @type {Guid}
     */
    static IID => Guid("{69473eb2-8031-49be-80bb-96cb46d99aba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WebAccountProvider", "get_UserName", "get_State"]

    /**
     * Gets the web authentication provider for the account.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.iwebaccount.webaccountprovider
     * @type {WebAccountProvider} 
     */
    WebAccountProvider {
        get => this.get_WebAccountProvider()
    }

    /**
     * Gets the username for the web account.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.iwebaccount.username
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
    }

    /**
     * Gets the connected state of the web account.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.iwebaccount.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @returns {WebAccountProvider} 
     */
    get_WebAccountProvider() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAccountProvider(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
