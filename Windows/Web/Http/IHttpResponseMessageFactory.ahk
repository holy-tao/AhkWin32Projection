#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HttpResponseMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpResponseMessageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpResponseMessageFactory
     * @type {Guid}
     */
    static IID => Guid("{52a8af99-f095-43da-b60f-7cfc2bc7ea2f}")

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
     * @param {Integer} statusCode_ 
     * @returns {HttpResponseMessage} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(statusCode_) {
        result := ComCall(6, this, "int", statusCode_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpResponseMessage(value)
    }
}
