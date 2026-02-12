#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\WebAuthenticationAddAccountResponse.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IWebAuthenticationAddAccountResponseFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAuthenticationAddAccountResponseFactory
     * @type {Guid}
     */
    static IID => Guid("{325f903e-77be-5365-81d9-0321cdd82195}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithAccount"]

    /**
     * 
     * @param {WebAccount} webAccount_ 
     * @returns {WebAuthenticationAddAccountResponse} 
     */
    CreateWithAccount(webAccount_) {
        result := ComCall(6, this, "ptr", webAccount_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAuthenticationAddAccountResponse(value)
    }
}
