#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Credentials\WebAccount.ahk
#Include .\WebProviderError.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IFindAllAccountsResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFindAllAccountsResult
     * @type {Guid}
     */
    static IID => Guid("{a5812b5d-b72e-420c-86ab-aac0d7b7261f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Accounts", "get_Status", "get_ProviderError"]

    /**
     * @type {IVectorView<WebAccount>} 
     */
    Accounts {
        get => this.get_Accounts()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {WebProviderError} 
     */
    ProviderError {
        get => this.get_ProviderError()
    }

    /**
     * 
     * @returns {IVectorView<WebAccount>} 
     */
    get_Accounts() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(WebAccount, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {WebProviderError} 
     */
    get_ProviderError() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebProviderError(value)
    }
}
