#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IWebAccountProviderOperation.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines properties for web account provider token objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.iwebaccountprovidertokenobjects
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebAccountProviderTokenObjects extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountProviderTokenObjects
     * @type {Guid}
     */
    static IID => Guid("{408f284b-1328-42db-89a4-0bce7a717d8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Operation"]

    /**
     * Gets the web account provider operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.iwebaccountprovidertokenobjects.operation
     * @type {IWebAccountProviderOperation} 
     */
    Operation {
        get => this.get_Operation()
    }

    /**
     * 
     * @returns {IWebAccountProviderOperation} 
     */
    get_Operation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWebAccountProviderOperation(value)
    }
}
