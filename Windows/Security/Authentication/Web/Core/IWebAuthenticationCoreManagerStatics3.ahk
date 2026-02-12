#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\WebAccountMonitor.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IWebAuthenticationCoreManagerStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAuthenticationCoreManagerStatics3
     * @type {Guid}
     */
    static IID => Guid("{2404eeb2-8924-4d93-ab3a-99688b419d56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWebAccountMonitor"]

    /**
     * 
     * @param {IIterable<WebAccount>} webAccounts 
     * @returns {WebAccountMonitor} 
     */
    CreateWebAccountMonitor(webAccounts) {
        result := ComCall(6, this, "ptr", webAccounts, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAccountMonitor(result_)
    }
}
