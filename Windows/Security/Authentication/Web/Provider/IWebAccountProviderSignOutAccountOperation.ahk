#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Credentials\WebAccount.ahk
#Include ..\..\..\..\Foundation\Uri.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebAccountProviderSignOutAccountOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountProviderSignOutAccountOperation
     * @type {Guid}
     */
    static IID => Guid("{b890e21d-0c55-47bc-8c72-04a6fc7cac07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WebAccount", "get_ApplicationCallbackUri", "get_ClientId"]

    /**
     * @type {WebAccount} 
     */
    WebAccount {
        get => this.get_WebAccount()
    }

    /**
     * @type {Uri} 
     */
    ApplicationCallbackUri {
        get => this.get_ApplicationCallbackUri()
    }

    /**
     * @type {HSTRING} 
     */
    ClientId {
        get => this.get_ClientId()
    }

    /**
     * 
     * @returns {WebAccount} 
     */
    get_WebAccount() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAccount(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ApplicationCallbackUri() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ClientId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
