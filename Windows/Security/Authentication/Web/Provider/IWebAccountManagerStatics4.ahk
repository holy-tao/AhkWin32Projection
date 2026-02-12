#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebAccountManagerStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountManagerStatics4
     * @type {Guid}
     */
    static IID => Guid("{59ebc2d2-f7db-412f-bc3f-f2fea04430b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InvalidateAppCacheForAllAccountsAsync", "InvalidateAppCacheForAccountAsync"]

    /**
     * 
     * @returns {IAsyncAction} 
     */
    InvalidateAppCacheForAllAccountsAsync() {
        result := ComCall(6, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {WebAccount} webAccount_ 
     * @returns {IAsyncAction} 
     */
    InvalidateAppCacheForAccountAsync(webAccount_) {
        result := ComCall(7, this, "ptr", webAccount_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}
