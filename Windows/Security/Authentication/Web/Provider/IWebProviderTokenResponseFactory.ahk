#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\WebProviderTokenResponse.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebProviderTokenResponseFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebProviderTokenResponseFactory
     * @type {Guid}
     */
    static IID => Guid("{fa49d99a-25ba-4077-9cfa-9db4dea7b71a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {WebTokenResponse} webTokenResponse_ 
     * @returns {WebProviderTokenResponse} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(webTokenResponse_) {
        result := ComCall(6, this, "ptr", webTokenResponse_, "ptr*", &webProviderTokenResponse_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebProviderTokenResponse(webProviderTokenResponse_)
    }
}
