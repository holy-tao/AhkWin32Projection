#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WebProviderError.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IWebProviderErrorFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebProviderErrorFactory
     * @type {Guid}
     */
    static IID => Guid("{e3c40a2d-89ef-4e37-847f-a8b9d5a32910}")

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
     * @param {Integer} errorCode 
     * @param {HSTRING} errorMessage 
     * @returns {WebProviderError} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(errorCode, errorMessage) {
        if(errorMessage is String) {
            pin := HSTRING.Create(errorMessage)
            errorMessage := pin.Value
        }
        errorMessage := errorMessage is Win32Handle ? NumGet(errorMessage, "ptr") : errorMessage

        result := ComCall(6, this, "uint", errorCode, "ptr", errorMessage, "ptr*", &webProviderError_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebProviderError(webProviderError_)
    }
}
