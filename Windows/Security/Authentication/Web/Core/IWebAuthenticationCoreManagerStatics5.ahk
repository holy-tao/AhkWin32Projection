#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include .\WebAuthenticationAddAccountResult.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IWebAuthenticationCoreManagerStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAuthenticationCoreManagerStatics5
     * @type {Guid}
     */
    static IID => Guid("{d07c1ded-270f-4554-9966-27b7df05b965}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAccountWithTransferTokenAsync"]

    /**
     * 
     * @param {WebAuthenticationTransferTokenRequest} request 
     * @returns {IAsyncOperation<WebAuthenticationAddAccountResult>} 
     */
    AddAccountWithTransferTokenAsync(request) {
        result := ComCall(6, this, "ptr", request, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAuthenticationAddAccountResult, operation)
    }
}
