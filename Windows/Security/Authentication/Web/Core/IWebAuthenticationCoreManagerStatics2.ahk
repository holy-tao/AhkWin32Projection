#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Credentials\WebAccountProvider.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IWebAuthenticationCoreManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAuthenticationCoreManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{f584184a-8b57-4820-b6a4-70a5b6fcf44a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindAccountProviderWithAuthorityForUserAsync"]

    /**
     * 
     * @param {HSTRING} webAccountProviderId 
     * @param {HSTRING} authority 
     * @param {User} user_ 
     * @returns {IAsyncOperation<WebAccountProvider>} 
     */
    FindAccountProviderWithAuthorityForUserAsync(webAccountProviderId, authority, user_) {
        if(webAccountProviderId is String) {
            pin := HSTRING.Create(webAccountProviderId)
            webAccountProviderId := pin.Value
        }
        webAccountProviderId := webAccountProviderId is Win32Handle ? NumGet(webAccountProviderId, "ptr") : webAccountProviderId
        if(authority is String) {
            pin := HSTRING.Create(authority)
            authority := pin.Value
        }
        authority := authority is Win32Handle ? NumGet(authority, "ptr") : authority

        result := ComCall(6, this, "ptr", webAccountProviderId, "ptr", authority, "ptr", user_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WebAccountProvider, asyncInfo)
    }
}
