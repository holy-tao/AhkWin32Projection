#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Security\Authentication\Web\Core\WebTokenRequestResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class IWebAuthenticationCoreManagerHelper extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAuthenticationCoreManagerHelper
     * @type {Guid}
     */
    static IID => Guid("{06a50525-e715-4123-9276-9d6f865ba55f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestTokenWithUIElementHostingAsync", "RequestTokenWithUIElementHostingAndWebAccountAsync"]

    /**
     * 
     * @param {WebTokenRequest} request 
     * @param {UIElement} uiElement_ 
     * @returns {IAsyncOperation<WebTokenRequestResult>} 
     */
    RequestTokenWithUIElementHostingAsync(request, uiElement_) {
        result := ComCall(6, this, "ptr", request, "ptr", uiElement_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebTokenRequestResult, asyncInfo)
    }

    /**
     * 
     * @param {WebTokenRequest} request 
     * @param {WebAccount} webAccount_ 
     * @param {UIElement} uiElement_ 
     * @returns {IAsyncOperation<WebTokenRequestResult>} 
     */
    RequestTokenWithUIElementHostingAndWebAccountAsync(request, webAccount_, uiElement_) {
        result := ComCall(7, this, "ptr", request, "ptr", webAccount_, "ptr", uiElement_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebTokenRequestResult, asyncInfo)
    }
}
