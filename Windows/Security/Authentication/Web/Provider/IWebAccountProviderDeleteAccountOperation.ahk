#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Credentials\WebAccount.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebAccountProviderDeleteAccountOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountProviderDeleteAccountOperation
     * @type {Guid}
     */
    static IID => Guid("{0abb48b8-9e01-49c9-a355-7d48caf7d6ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WebAccount"]

    /**
     * @type {WebAccount} 
     */
    WebAccount {
        get => this.get_WebAccount()
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
}
